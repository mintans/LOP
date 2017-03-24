package th.co.entronica.mjolnir.controller.profile;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import th.co.entronica.mjolnir.model.db.Admonition;
import th.co.entronica.mjolnir.model.db.EducationInfo;
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.TrainingRecord;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.manage.AdmonitionManager;
import th.co.entronica.mjolnir.model.manage.EmploymentManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TrainingRecordManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping(value = "/history")
public class HistoryController {

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private TrainingRecordManager trainingRecordManager;
    
    @Autowired
    private EmploymentManager employmentManager;
    
    @Autowired
    private AdmonitionManager admonitionManager;
    
    @Autowired
    private TransferManager transferManager;

    @Autowired
    private UserManager userManager;

    @Autowired
    private UserInfo userInfo;

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String HistoryView(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {
        int ck = 0;
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                ck = 1;
                if (profileList1.getEducation() != null) {
                    List<EducationInfo> educationList = profileList1.getEducation().getEducationInfo();
                    model.put("educationList", educationList);
                }
            }
        }
        List<TrainingRecord> trainingRecordList = trainingRecordManager.getAll();
        if (trainingRecordList != null) {
            model.put("trainingRecordList", trainingRecordList);
        }
        List<Admonition> admonitionList = admonitionManager.getAll();
        if (admonitionList != null) {
            model.put("admonitionList", admonitionList);
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
        if (ck == 1) {
            model.put("action", "profile");
            model.addAttribute("userInfo", userInfo);
            model.put("profileid", profileID);
            model.put("formProfile", "profile");
            model.put("profileList", profileList);
            model.addAttribute("language", profileManager.get(profileID).getLanguage());
            model.addAttribute("family", profileManager.get(profileID).getFamilyinfo());
            model.addAttribute("education", profileManager.get(profileID).getEducation());
            model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
            model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
            return "profile/history/history_view";
        } else {
//            ProfileForm profileForm = new ProfileForm();
//            model.addAttribute("userInfo", userInfo);
//            model.put("uId", profileID);
//            model.put("formProfile", "profile");
//            model.put("formtype", "add");
//            model.put("action", "save");
//            model.put("profileForm", profileForm);
            response.sendRedirect("../addForm?uId=" + profileID);
            return null;
        }
    }
}
