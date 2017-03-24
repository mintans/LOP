package th.co.entronica.mjolnir.controller.calendar;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.model.db.CompanyInformation;
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.db.EmploymentType;
import th.co.entronica.mjolnir.model.db.Insurance;
import th.co.entronica.mjolnir.model.db.InsuranceNotice;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.manage.CompanyInformationManager;
import th.co.entronica.mjolnir.model.manage.EmploymentManager;
import th.co.entronica.mjolnir.model.manage.EmploymentTypeManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    @Autowired
    private UserInfo userInfo;

    @Autowired
    private UserManager userManager;

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private EmploymentManager employmentManager;

    @Autowired
    private EmploymentTypeManager employmentTypeManager;

    @Autowired
    private CompanyInformationManager companyInformationManager;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String calender(ModelMap model) throws ParseException {
        List<User> userList = userManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formCalendar", "calendar");
        model.put("userList", userList);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
        Date currentDate = new Date();

        Calendar currentCalendar = Calendar.getInstance(Locale.US);
        currentCalendar.setTime(currentDate);

        List<Profile> profileList = profileManager.getAll();
        String birthDayList = "";
        for (Profile profileList1 : profileList) {

            Date birthDate = sdf.parse(profileList1.getBirth());
            String[] sptBirthDate = sdf.format(birthDate).split("-");
            String anniverBirthDay = currentCalendar.get(Calendar.YEAR) + "-" + sptBirthDate[1] + "-" + sptBirthDate[2];
            if (profileList1.getTitle().equals("1")) {
                birthDayList = birthDayList + "นาย " + profileList1.getFirstName() + " " + profileList1.getLastName() + " < " + profileList1.getNickName() + " >" + "|" + anniverBirthDay + ",";
            }
            if (profileList1.getTitle().equals("2")) {
                birthDayList = birthDayList + "นาง " + profileList1.getFirstName() + " " + profileList1.getLastName() + " < " + profileList1.getNickName() + " >" + "|" + anniverBirthDay + ",";
            }
            if (profileList1.getTitle().equals("3")) {
                birthDayList = birthDayList + "นางสาว " + profileList1.getFirstName() + " " + profileList1.getLastName() + " < " + profileList1.getNickName() + " >" + "|" + anniverBirthDay + ",";
            }

        }
        model.put("birthDayList", birthDayList);

//        Evolution
        List<Employment> employmentList = employmentManager.getAll();
        List<EmploymentType> employmentTypeList = employmentTypeManager.getAll();
        model.put("employmentTypeList", employmentTypeList);
        String durationList = "";

        for (Employment employment : employmentList) {
            for (EmploymentType employmentType : employmentTypeList) {
                if (employment.getType().equals(employmentType.getEmploymentTypeName())) {
                    if (employmentType.getTypeName().equals("duration") && !employment.getDulation().equals("")) {
                        Date birthDate = sdf.parse(employment.getDate());
                        String[] sptBirthDate = sdf.format(birthDate).split("-");

                        String anniverBirthDay = sptBirthDate[0] + "-" + sptBirthDate[1] + "-" + sptBirthDate[2];
                        Date durationDueDate = sdf.parse(anniverBirthDay);
                        Calendar durationDueCalendar = Calendar.getInstance(Locale.US);
                        durationDueCalendar.setTime(durationDueDate);
                        durationDueCalendar.add(Calendar.MONTH, Integer.parseInt(employment.getDulation()));

                        String dateFinal = sdf.format(durationDueCalendar.getTime());

                        for (Profile profileItem : profileList) {
                            if (employment.getProfileId().equals(profileItem.getId())) {
                                for (User userItem : userList) {
                                    if (userItem.getId().equals(profileItem.getId())) {
                                        if (profileItem.getTitle().equals("1")) {
                                            durationList = durationList + "นาย " + profileItem.getFirstName() + " " + profileItem.getLastName() + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>" + userItem.getDepartmentName() + "</b>|" + dateFinal + ",";
                                        }
                                        if (profileItem.getTitle().equals("2")) {
                                            durationList = durationList + "นาง " + profileItem.getFirstName() + " " + profileItem.getLastName() + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>" + userItem.getDepartmentName() + "</b>|" + dateFinal + ",";
                                        }
                                        if (profileItem.getTitle().equals("3")) {
                                            durationList = durationList + "นางสาว " + profileItem.getFirstName() + " " + profileItem.getLastName() + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>" + userItem.getDepartmentName() + "</b>|" + dateFinal + ",";
                                        }
                                    }
                                }

                            }
                        }
                    }

                }
            }
        }
        model.put("durationList", durationList);

        //        Insurance
        String insuranceNotice = "";

        for (User userItems : userList) {

            Date workDate = sdf.parse(userItems.getStartWorkDate());
            String[] sptWorkDate = sdf.format(workDate).split("-");

            String anniverWorkDay = sptWorkDate[0] + "-" + sptWorkDate[1] + "-" + sptWorkDate[2];
            Date workDueDate = sdf.parse(anniverWorkDay);
            Calendar workDueCalendar = Calendar.getInstance(Locale.US);
            workDueCalendar.setTime(workDueDate);
            workDueCalendar.add(Calendar.MONTH, 12);

            String dateFinal = sdf.format(workDueCalendar.getTime());

            String name = null;

            for (Iterator<Profile> iteratorProfile = profileList.iterator(); iteratorProfile.hasNext();) {
                Profile next = iteratorProfile.next();
                if (userItems.getId().equals(next.getId())) {
                    if (next.getTitle().equals("1")) {
                        name = "นาย " + next.getFirstName() + " " + next.getLastName();
                    }
                    if (next.getTitle().equals("2")) {
                        name = "นาง " + next.getFirstName() + " " + next.getLastName();
                    }
                    if (next.getTitle().equals("3")) {
                        name = "นางสาว " + next.getFirstName() + " " + next.getLastName();
                    }

                }
            }
            insuranceNotice = insuranceNotice + name + "|" + dateFinal + ",";
        }
        model.put("insuranceList", insuranceNotice);

//        Information
        List<CompanyInformation> companyInformationAll = companyInformationManager.getAll();
        String eventList = "";
        String conferenceList = "";

        for (CompanyInformation companyInfoItems : companyInformationAll) {

            if (companyInfoItems.getStatus().equals("Event")) {
                eventList = eventList + companyInfoItems.getTitle() + "|" + companyInfoItems.getDate() + ",";
            }
            if (companyInfoItems.getStatus().equals("Conference")) {
                conferenceList = conferenceList + companyInfoItems.getTitle() + "|" + companyInfoItems.getDate() + ",";
            }
        }
        model.put("eventList", eventList);
        model.put("conferenceList", conferenceList);

        return "calendar/calendar";
    }
}
