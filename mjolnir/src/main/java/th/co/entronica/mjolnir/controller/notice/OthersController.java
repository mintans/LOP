/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.notice;

import java.io.IOException;
import java.lang.reflect.Array;
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
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.model.db.BirthDay;
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.db.EmploymentType;
import th.co.entronica.mjolnir.model.db.Insurance;
import th.co.entronica.mjolnir.model.db.InsuranceNotice;
import th.co.entronica.mjolnir.model.db.MapEvaluation;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.manage.BirthDayManager;
import th.co.entronica.mjolnir.model.manage.EmploymentManager;
import th.co.entronica.mjolnir.model.manage.EmploymentTypeManager;
import th.co.entronica.mjolnir.model.manage.InsuranceManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.model.reposity.TransferRepository;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping("/others")
public class OthersController {

    @Autowired
    private UserInfo userInfo;

    @Autowired
    private UserManager userManager;

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private BirthDayManager birthDayManager;

    @Autowired
    private EmploymentManager employmentManager;

    @Autowired
    private EmploymentTypeManager employmentTypeManager;

    @Autowired
    private InsuranceManager insuranceManager;

    @Autowired
    private TransferManager transferManager;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) throws ParseException {

        model.addAttribute("userInfo", userInfo);
        model.put("formNotice", "notice");

        List<User> userList = userManager.getAll();
        model.put("userList", userList);

        List<Profile> profileList = profileManager.getAll();
        model.put("profileList", profileList);

//        BirthDay
        List<BirthDay> birthDaydbList = birthDayManager.getAll();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
        Date currentDate = new Date();

        Calendar currentCalendar = Calendar.getInstance(Locale.US);
        currentCalendar.setTime(currentDate);

        List<Profile> birthDayList = new ArrayList<Profile>();

        for (Profile profile : profileList) {
            if (profile.getBirth() != null) {

                Date birthDate = sdf.parse(profile.getBirth());
                String[] sptBirthDate = sdf.format(birthDate).split("-");

                String anniverBirthDay = currentCalendar.get(Calendar.YEAR) + "-" + sptBirthDate[1] + "-" + sptBirthDate[2];
                Date anniverBirthDayDate = sdf.parse(anniverBirthDay);

                long resultDay = TimeUnit.DAYS.convert((anniverBirthDayDate.getTime() - currentDate.getTime()), TimeUnit.MILLISECONDS);
                if (birthDaydbList.isEmpty()) {
                    if (resultDay < 8) {
                        birthDayList.add(profile);
                    }
                } else {
                    String year = String.valueOf(currentCalendar.get(Calendar.YEAR));
                    boolean isFound = false;
                    for (BirthDay birthDay : birthDaydbList) {
                        if (resultDay < 8) {
                            if (profile.getId().equals(birthDay.getProfileId())) {
                                if (birthDay.getYear().equals(year)) {
                                    isFound = true;
                                }
                            }
                        }
                    }
                    if (!isFound) {
                        birthDayList.add(profile);
                    }
                }
            }
        }

        model.put("birthDayList", birthDayList);

//        Evolution
        List<Employment> employmentList = employmentManager.getAll();
        List<Transfer> transferList = transferManager.getAll();

        List<EmploymentType> employmentTypeList = employmentTypeManager.getAll();
        model.put("employmentTypeList", employmentTypeList);

        HashMap<String, MapEvaluation> mapEvaluation = new HashMap<String, MapEvaluation>();

        for (Employment employment : employmentList) {
            for (EmploymentType employmentType : employmentTypeList) {
                if (employment.getType().equals(employmentType.getEmploymentTypeName())) {
                    if (employmentType.getTypeName().equals("duration") && !employment.getDulation().equals("")) {

                        Date birthDate = sdf.parse(employment.getDate());
                        Calendar durationCalendar = Calendar.getInstance(Locale.US);
                        durationCalendar.setTime(birthDate);
                        durationCalendar.add(Calendar.MONTH, Integer.parseInt(employment.getDulation()));

                        long resultDay = TimeUnit.DAYS.convert((durationCalendar.getTimeInMillis() - currentDate.getTime()), TimeUnit.MILLISECONDS);
                        if (resultDay < 30) {
                            String name = null;
                            String position = null;
                            String department = null;
                            String type = employmentType.getEmploymentTypeName();

                            for (Iterator<Profile> iteratorProfile = profileList.iterator(); iteratorProfile.hasNext();) {
                                Profile next = iteratorProfile.next();
                                if (employment.getProfileId().equals(next.getId())) {
                                    name = next.getFirstName() + " " + next.getLastName();
                                }
                            }

                            for (Iterator<Transfer> iteratorPosition = transferList.iterator(); iteratorPosition.hasNext();) {
                                Transfer next = iteratorPosition.next();
                                if (next.getProfileId().equals(employment.getProfileId())) {
                                    position = next.getPosition();
                                }
                            }
                            for (Iterator<User> iteratorUser = userList.iterator(); iteratorUser.hasNext();) {
                                User next = iteratorUser.next();
                                if (next.getId().equals(employment.getProfileId())) {
                                    department = next.getDepartmentName();
                                }

                            }
                            mapEvaluation.put(employment.getProfileId(), new MapEvaluation(type, name, employment.getDate(), position, department));
                        }
                    }
                }
            }
        }
        model.put("evaluationList", mapEvaluation);

//        Insurance
        List<Insurance> insuList = insuranceManager.getAll();
        HashMap<String, InsuranceNotice> mapInsuranceNotice = new HashMap<String, InsuranceNotice>();

        for (User userItems : userList) {

            Date workDate = sdf.parse(userItems.getStartWorkDate());

            long resultDay = TimeUnit.DAYS.convert((currentDate.getTime() - workDate.getTime()), TimeUnit.MILLISECONDS);
            if (resultDay > 330) {

                String name = null;
                String insuranceWorkDate = userItems.getStartWorkDate();
                String insuranceAnniversaryDate;
                boolean isManage = false;
                boolean isDone = false;

                Calendar anniversaryDate = Calendar.getInstance(Locale.US);
                anniversaryDate.setTime(workDate);
                anniversaryDate.add(Calendar.MONTH, 12);
                insuranceAnniversaryDate = sdf.format(anniversaryDate.getTime());

                for (Iterator<Profile> iteratorProfile = profileList.iterator(); iteratorProfile.hasNext();) {
                    Profile next = iteratorProfile.next();
                    if (userItems.getId().equals(next.getId())) {
                        name = next.getFirstName() + " " + next.getLastName();
                    }
                }

                for (Iterator<Insurance> iteratorInsu = insuList.iterator(); iteratorInsu.hasNext();) {
                    Insurance next = iteratorInsu.next();
                    if (userItems.getId().equals(next.getUserId())) {
                        isManage = next.isManage();
                        isDone = next.isDone();
                    }

                }
                if (isManage != true || isDone != true) {
                    mapInsuranceNotice.put(userItems.getId(), new InsuranceNotice(name, insuranceWorkDate, insuranceAnniversaryDate, isManage, isDone));
                }

            }
        }
        model.put("mapInsuranceNotice", mapInsuranceNotice);

        return "notice/others";
    }

    @RequestMapping(value = "acceptBirthDay/{birthDayID}", method = RequestMethod.GET)
    public String acceptBirthDay(ModelMap model, @PathVariable String birthDayID, HttpServletResponse response) throws IOException {

        birthDayManager.acceptDone(birthDayID);
        response.sendRedirect("../../../main/others");
        return null;
    }

    @RequestMapping(value = "manageInsurance/{insuranceID}", method = RequestMethod.GET)
    public String manageInsurance(ModelMap model, @PathVariable String insuranceID, HttpServletResponse response) throws IOException {

        insuranceManager.acceptManage(insuranceID);
        response.sendRedirect("../../../main/others");
        return null;
    }

    @RequestMapping(value = "doneInsurance/{insuranceID}", method = RequestMethod.GET)
    public String doneInsurance(ModelMap model, @PathVariable String insuranceID, HttpServletResponse response) throws IOException {

        insuranceManager.acceptDone(insuranceID);
        response.sendRedirect("../../../main/others");
        return null;
    }

}
