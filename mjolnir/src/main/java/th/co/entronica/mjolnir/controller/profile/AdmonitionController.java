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
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.AdmonitionForm;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.manage.AdmonitionManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping(value = "/admonition")
public class AdmonitionController {

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private AdmonitionManager admonitionManager;

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
        return "profile/admonition/admonition_view";
    }

    @RequestMapping(value = "addForm", method = RequestMethod.GET)
    public String AdmonitionAddForm(ModelMap model, @RequestParam(value = "uId") String uId) {
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
    public String AdmonitionEditForm(ModelMap model, @PathVariable String profileID) {
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
    public String ProfileUpdate(@ModelAttribute("profileForm") ProfileForm profileForm, ModelMap model, HttpServletResponse response) throws IOException {
        Profile profileTemp = profileManager.update(profileForm);
        response.sendRedirect("../../../main/profile/editForm/" + profileTemp.getId());
        return null;
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String AdmonitionSave(@ModelAttribute("admonitionForm") AdmonitionForm admonitionForm, ModelMap model, HttpServletResponse response) throws IOException {
        Admonition admonitionTemp = admonitionManager.save(admonitionForm);
        response.sendRedirect("../../main/admonition/view/" + admonitionTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String AdmonitionDelete(ModelMap model, @PathVariable String id, HttpServletResponse response) throws IOException {
        Admonition admonitionList = admonitionManager.get(id);
        String profileId = admonitionList.getProfileId();
        admonitionManager.delete(id);
        response.sendRedirect("../../admonition/view/" + profileId);
        return null;
    }

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String AdmonitionView(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {
        int ck = 0;
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("admonitionItem", profileList1);
                ck = 1;
            }
        }
        List<Admonition> admonitionList = admonitionManager.getAll();
        if (admonitionList != null) {
            model.put("admonitionList", admonitionList);
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
            return "profile/admonition/admonition_view";
        } else {
//            ProfileForm profileForm = new ProfileForm();
//            model.addAttribute("userInfo", userInfo);
//            model.put("uId", profileID);
//            model.put("formProfile", "profile");
//            model.put("formtype", "add");
//            model.put("action", "save");
//            model.put("profileForm", profileForm);
            response.sendRedirect("../addFormTH?uId=" + profileID);
            return null;
        }
    }
}
