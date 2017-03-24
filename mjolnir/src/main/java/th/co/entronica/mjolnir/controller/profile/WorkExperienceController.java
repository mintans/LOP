/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.profile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.WorkExperience;
import th.co.entronica.mjolnir.model.db.WorkingInfo;
import th.co.entronica.mjolnir.model.form.SpecialAbilityForm;
import th.co.entronica.mjolnir.model.form.WorkExperienceForm;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.WorkExperienceManager;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Asus PC
 */
@Controller
@RequestMapping(value = "/workexperience")
public class WorkExperienceController {

    @Autowired
    private WorkExperienceManager workExperienceManager;
    @Autowired
    private ProfileManager profileManager;
    @Autowired
    private UserInfo userInfo;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        List<WorkExperience> workExperiencesList = workExperienceManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        model.put("workExperiencesList", workExperiencesList);
        return "profile/work_experience/work-experience_form";
    }

    @RequestMapping(value = "addForm/{profileID}", method = RequestMethod.GET)
    public String WorkExperienceAddForm(ModelMap model, @PathVariable String profileID) {
        WorkExperienceForm workExperienceForm = new WorkExperienceForm();
        model.addAttribute("id", profileID);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("language", profileManager.get(profileID).getLanguage());
        model.addAttribute("family", profileManager.get(profileID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(profileID).getEducation());
        model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("workExperienceItem", profileList1);
            }
        }
        model.put("workList", profileList);
        model.put("profileid", profileID);
        model.put("formProfile", "profile");
        model.put("action", "save");
        model.put("formtype", "edit");
        model.put("workexperienceForm", workExperienceForm);
        return "profile/work_experience/work_experience_add_update";
    }

    @RequestMapping(value = "editForm/{workexperienceID}", method = RequestMethod.GET)
    public String WorkExperienceEditForm(ModelMap model, @PathVariable String workexperienceID) {
        WorkExperience workExperienceForm = (WorkExperience) profileManager.get(workexperienceID).getWorkExperiences();
        model.addAttribute("id", workexperienceID);
        model.addAttribute("id2", profileManager.get(workexperienceID).getWorkExperiences().getId());
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("work", workExperienceForm.getId());
        model.addAttribute("special", profileManager.get(workexperienceID).getSpecialAbility());
        model.addAttribute("language", profileManager.get(workexperienceID).getLanguage());
        model.put("family", profileManager.get(workexperienceID).getFamilyinfo());
        model.put("education", profileManager.get(workexperienceID).getEducation());
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (workexperienceID.equals(profileList1.getId())) {
                model.put("workExperienceItem", profileList1);
            }
        }
        model.put("workList", profileList);

        model.put("formProfile", "profile");
        model.put("action", "update");
        model.put("formtype", "edit");
        model.put("workexperienceForm", workExperienceForm);
        return "profile/work_experience/work_experience_add_update";
    }

    @RequestMapping(value = "editForm/update", method = RequestMethod.POST)
    public String WorkExperienceUpdate(@ModelAttribute("workexperienceForm") WorkExperienceForm workExperienceForm, ModelMap model, HttpServletResponse response) throws IOException {
        WorkExperience workExperienceTemp = workExperienceManager.update(workExperienceForm);
        response.sendRedirect("../../../main/workexperience/view/" + workExperienceTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "addForm/save", method = RequestMethod.POST)
    public String WorkExperienceSavede(@ModelAttribute("workexperienceForm") WorkExperienceForm workExperienceForm, ModelMap model, HttpServletResponse response) throws IOException {
        WorkExperience workExperienceTemp = workExperienceManager.save(workExperienceForm);
        model.put("workExperience", workExperienceTemp);

        response.sendRedirect("../../../main/workexperience/editForm/" + workExperienceTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "addForm/save", method = RequestMethod.POST, params = "save workexperience")
    public String WorkExperienceSave(@ModelAttribute("workexperienceForm") WorkExperienceForm workExperienceForm, ModelMap model, HttpServletResponse response) throws IOException {
        WorkExperience workExperienceTemp = workExperienceManager.save(workExperienceForm);
        response.sendRedirect("../../../main/language/languageForm/" + workExperienceTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String WorkExperienceView(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("workExperienceItem", profileList1);
            }
        }
        model.addAttribute("userInfo", userInfo);
        model.put("profileid", profileID);
        model.put("action", "Work-Experiences");
        model.put("formProfile", "profile");
        model.put("profileList", profileList);
        model.put("formtype", "view");
        model.addAttribute("language", profileManager.get(profileID).getLanguage());
        model.addAttribute("family", profileManager.get(profileID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(profileID).getEducation());
        model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
        return "profile/work_experience/work_experience_view";
    }

}
