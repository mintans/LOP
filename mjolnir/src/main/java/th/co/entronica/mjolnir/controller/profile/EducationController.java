/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import th.co.entronica.mjolnir.model.db.Education;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.form.EducationForm;

import th.co.entronica.mjolnir.model.manage.EducationManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;

import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Pop
 */
@Controller
@RequestMapping("/education")
public class EducationController {

    @Autowired
    private EducationManager educationManager;
    @Autowired
    private UserInfo userInfo;
    @Autowired
    private ProfileManager profileManager;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String show(ModelMap model) {
        List<Education> educationList = educationManager.getAll();
        model.put("form", "education");
        model.put("formProfile", "profile");
        model.addAttribute("userInfo", userInfo);
        model.put("action", "education");
        model.put("educationList", educationList);
        return "profile/education/education";
    }

    @RequestMapping(value = "educationForm/{profileID}", method = RequestMethod.GET)
    public String educationForm(ModelMap model, @PathVariable String profileID) {
        EducationForm educationForm = new EducationForm();
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("educationItem", profileList1);
            }
        }
        model.addAttribute("id", profileID);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("language", profileManager.get(profileID).getLanguage());
        model.addAttribute("family", profileManager.get(profileID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(profileID).getEducation());
        model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
        model.addAttribute("profileList", profileList);   
        model.put("formtype", "edit");
        model.put("formProfile", "profile");
        model.put("action", "save");
        model.put("educationForm", educationForm);

        return "profile/education/education_add_update";
    }

    @RequestMapping(value = "educationForm/save", method = RequestMethod.POST)
    public String educationSavelanguage(@ModelAttribute("educationForm") EducationForm educationForm, ModelMap model,
            HttpServletResponse response) throws IOException {

        Education educationTemp = educationManager.save(educationForm);
        response.sendRedirect("../../../main/education/view/"+educationTemp.getProfileId());

        return null;
    }

    @RequestMapping(value = "educationForm/save", method = RequestMethod.POST, params = "save")
    public String educationSaveDefault(@ModelAttribute("educationForm") EducationForm educationForm, ModelMap model,
            HttpServletResponse response) throws IOException {

        Education educationTemp = educationManager.save(educationForm);
        response.sendRedirect("../../../main/education/editForm/" + educationTemp.getProfileId());

        return null;
    }

    @RequestMapping(value = "editForm/{educationId}", method = RequestMethod.GET)
    public String educationEdit(ModelMap model, HttpServletResponse response, @PathVariable String educationId) {
        Education educationForm = (Education) profileManager.get(educationId).getEducation();
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (educationId.equals(profileList1.getId())) {
                model.put("educationItem", profileList1);
            }
        }
        model.addAttribute("profileList", profileList);
        List<Education> educationList = educationManager.getAll();
        model.put("educationList", educationList);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("educationItem", profileManager.get(educationId));
        model.addAttribute("language", profileManager.get(educationId).getLanguage());
        model.addAttribute("family",profileManager.get(educationId).getFamilyinfo());
        model.addAttribute("education", profileManager.get(educationId).getEducation());
        model.addAttribute("special", profileManager.get(educationId).getSpecialAbility());
        model.addAttribute("work", profileManager.get(educationId).getWorkExperiences());
        model.put("formProfile", "profile");
        model.addAttribute("id", educationId);
        model.addAttribute("id2", profileManager.get(educationId).getEducation().getId());
        model.addAttribute("id3", profileManager.get(educationId).getEducation().getProfileId());
        model.put("action", "update");
        model.put("educationForm", educationForm);
        model.put("formtype", "edit");
        return "profile/education/education_add_update";
    }

    @RequestMapping(value = "editForm/update", method = RequestMethod.POST)
    public String educationUpdate(@ModelAttribute("educationForm") EducationForm educationForm, ModelMap model,
            HttpServletResponse response) throws IOException {

        Education educationTemp = educationManager.update(educationForm);
        response.sendRedirect("../../../main/education/view/" + educationTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String educationView(ModelMap model, HttpServletResponse response, @PathVariable String profileID) {
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("profileItem1", profileList1);
            }
        }
        List<Education> educationList = educationManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formProfile", "profile");
        model.put("profileid", profileID);
        model.put("profileList", profileList);
        model.put("educationList", educationList);
        model.put("action", "education");
        model.put("formtype", "view");
        model.addAttribute("language", profileManager.get(profileID).getLanguage());
        model.addAttribute("family",profileManager.get(profileID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(profileID).getEducation());
        model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
        return "profile/education/education_view";
    }
}
