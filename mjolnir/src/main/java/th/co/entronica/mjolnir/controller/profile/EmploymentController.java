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
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.db.EmploymentType;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.EmploymentForm;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.manage.EmploymentManager;
import th.co.entronica.mjolnir.model.manage.EmploymentTypeManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping(value = "/employment")
public class EmploymentController {

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private EmploymentManager employmentManager;

    @Autowired
    private EmploymentTypeManager employmentTypeManager;

    @Autowired
    private UserManager userManager;

    @Autowired
    private UserInfo userInfo;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        List<User> userList = userManager.getAll();
        List<Profile> profileList = profileManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        model.put("profileList", profileList);
        model.put("userList", userList);
        return "profile/employment/employment_view";
    }

    @RequestMapping(value = "addForm", method = RequestMethod.GET)
    public String EmploymentAddForm(ModelMap model, @RequestParam(value = "uId") String uId) {
        ProfileForm profileForm = new ProfileForm();
        model.addAttribute("userInfo", userInfo);
        model.put("uId", uId);
        model.put("formProfile", "profile");
        model.put("formtype", "add");
        model.put("action", "save");
        model.put("profileForm", profileForm);
        return "profile_add_update";
    }

    @RequestMapping(value = "editForm/{profileID}", method = RequestMethod.GET)
    public String EmploymentEditForm(ModelMap model, @PathVariable String profileID) {
        Profile profileForm = (Profile) profileManager.get(profileID);
        model.addAttribute("id", profileForm.getId());
        model.addAttribute("userInfo", userInfo);
        model.put("family", profileForm.getFamilyinfo());

        model.put("education", profileForm.getEducation());
        model.put("language", profileForm.getLanguage());
        model.put("special", profileForm.getSpecialAbility());
        model.put("work", profileForm.getWorkExperiences());
        model.put("formProfile", "profile");
        model.put("formtype", "edit");
        model.put("action", "update");
        model.put("profileForm", profileForm);
        return "profile_add_update";
    }

    @RequestMapping(value = "editForm/update", method = RequestMethod.POST)
    public String EmploymentUpdate(@ModelAttribute("profileForm") ProfileForm profileForm, ModelMap model, HttpServletResponse response) throws IOException {
        Profile profileTemp = profileManager.update(profileForm);
        response.sendRedirect("../../../main/profile/editForm/" + profileTemp.getId());
        return null;
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String EmploymentSave(@ModelAttribute("employmentForm") EmploymentForm employmentForm, ModelMap model, HttpServletResponse response) throws IOException {
        Employment employmentTemp = employmentManager.save(employmentForm);
        response.sendRedirect("../../main/employment/view/" + employmentTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String EmploymentDelete(ModelMap model, @PathVariable String id, HttpServletResponse response) throws IOException {
        Employment employmentList = employmentManager.get(id);
        String profileId = employmentList.getProfileId();
        employmentManager.delete(id);
        response.sendRedirect("../../employment/view/" + profileId);
        return null;
    }

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String EmploymentView(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {
        int ck = 0;
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                ck = 1;
                model.put("employmentItem", profileList1);
            }
        }
        List<Employment> employmentList = employmentManager.getAll();
        if (employmentList != null) {
            model.put("employmentList", employmentList);
            for (Employment employmentList1 : employmentList) {
                model.put("employmentStatus", employmentList1.getAction());
            }
        }

        List<EmploymentType> employmentTypeList = employmentTypeManager.getAll();
        if (employmentTypeList != null) {
            model.put("employmentTypeList", employmentTypeList);
        }

        if (ck == 1) {
            User userItem = userManager.get(profileID);
            model.put("userItem", userItem);
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
            return "profile/employment/employment_view";
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

    @RequestMapping(value = "change", method = RequestMethod.POST)
    public String Employmentchange(@ModelAttribute("employmentForm") EmploymentForm employmentForm, ModelMap model, HttpServletResponse response) throws IOException {

        Employment employmentTemp = employmentManager.save(employmentForm);
        response.sendRedirect("../../main/others");
        return null;
    }
}
