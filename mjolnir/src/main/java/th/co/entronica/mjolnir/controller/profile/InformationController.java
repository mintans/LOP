package th.co.entronica.mjolnir.controller.profile;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.model.db.EducationInfo;
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Salary;
import th.co.entronica.mjolnir.model.db.TrainingRecord;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.manage.EmploymentManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.SalaryManager;
import th.co.entronica.mjolnir.model.manage.TrainingRecordManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping(value = "/information")
public class InformationController {

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private EmploymentManager employmentManager;

    @Autowired
    private SalaryManager salaryManager;

    @Autowired
    private TransferManager transferManager;

    @Autowired
    private TrainingRecordManager trainingRecordManager;

    @Autowired
    private UserManager userManager;

    @Autowired
    private UserInfo userInfo;

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String informationView(ModelMap model, HttpServletResponse response, @PathVariable String profileID) {
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("profileItem", profileList1);
                if (profileList1.getEducation() != null) {
                    List<EducationInfo> educationList = profileList1.getEducation().getEducationInfo();
                    if (educationList != null) {
                        int tmp = 0, educationTo = 0;
                        String to;
                        for (EducationInfo educationList1 : educationList) {
                            educationTo = Integer.parseInt(educationList1.getTo());
                            tmp = tmp > educationTo ? tmp : educationTo;
                            to = Integer.toString(tmp);
                            if (to.equals(educationList1.getTo())) {
                                model.put("educationMajor", educationList1.getMajor());
                            }
                        }
                    }
                }
            }
        }
        List<User> userList = userManager.getAll();
        for (User userList1 : userList) {
            if (profileID.equals(userList1.getId())) {
                model.put("userItem", userList1);
            }
        }
        List<Employment> employmentList = employmentManager.getAll();
        if (employmentList != null) {
            model.put("employmentList", employmentList);
            for (Employment employmentList1 : employmentList) {
                if (employmentList1.getProfileId().equals(profileID)) {
                    model.put("employmentStatus", employmentList1.getAction());
                    model.put("employmentType", employmentList1.getType());
                }
            }
        }

        List<Transfer> transferList = transferManager.getAll();
        if (transferList != null) {
            model.put("transferList", transferList);
            for (Transfer transferList1 : transferList) {
                if (transferList1.getProfileId().equals(profileID)) {
                    model.put("position", transferList1.getPosition());
                }
            }
        }

        List<TrainingRecord> trainingRecordList = trainingRecordManager.getAll();
        if (trainingRecordList != null) {
            model.put("trainingRecordList", trainingRecordList);
        }

        List<Salary> salaryList = salaryManager.getAll();
        if (salaryList != null) {
            for (Salary salaryList1 : salaryList) {
                model.put("salary", salaryList1.getSalary());
            }
        }

        User user = userManager.get(profileID);
        String startWorkDate = user.getStartWorkDate();
        model.put("startWorkDate", startWorkDate);
        model.put("userList", userList);
        model.addAttribute("userInfo", userInfo);
        model.put("formProfile", "profile");
        model.put("profileid", profileID);
        model.put("profileList", profileList);
        model.put("action", "information");
        model.put("formtype", "view");
        model.addAttribute("language", profileManager.get(profileID).getLanguage());
        model.addAttribute("family", profileManager.get(profileID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(profileID).getEducation());
        model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
        return "profile/information/information_view";
    }
}
