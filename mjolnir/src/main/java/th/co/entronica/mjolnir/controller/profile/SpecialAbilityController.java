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
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.SpecialAbility;
import th.co.entronica.mjolnir.model.form.FamilyInfoForm;
import th.co.entronica.mjolnir.model.form.SpecialAbilityForm;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.SpecialAbilityManeger;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Asus PC
 */
@Controller
@RequestMapping(value = "/specialability")
public class SpecialAbilityController {

    @Autowired
    private SpecialAbilityManeger specialAbilityManeger;

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private UserInfo userInfo;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        List<SpecialAbility> specialAbilityList = specialAbilityManeger.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        model.put("specialAbilityList", specialAbilityList);
        return "profile/special_ability/specialability_view";
    }

    @RequestMapping(value = "addForm/{profileID}", method = RequestMethod.GET)
    public String SpecialAbilityAddForm(ModelMap model, @PathVariable String profileID) {
        SpecialAbilityForm specialAbilityForm = new SpecialAbilityForm();
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("specialAbilityItem", profileList1);
            }
        }
        model.addAttribute("userInfo", userInfo);
        model.put("profileid", profileID);
        model.addAttribute("id", profileID);
        model.addAttribute("language", profileManager.get(profileID).getLanguage());
        model.addAttribute("family", profileManager.get(profileID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(profileID).getEducation());
        model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
        model.put("formtype", "edit");
        model.put("formProfile", "profile");
        model.put("action", "save");
        model.put("specialabilityForm", specialAbilityForm);
        return "profile/special_ability/specialability_add_update";
    }

    @RequestMapping(value = "editForm/{SpecialAbilityID}", method = RequestMethod.GET)
    public String SpecialAbilityEditForm(ModelMap model, @PathVariable String SpecialAbilityID) {
        SpecialAbility SpecialAbilityForm = (SpecialAbility) profileManager.get(SpecialAbilityID).getSpecialAbility();
        model.addAttribute("id", SpecialAbilityID);
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (SpecialAbilityID.equals(profileList1.getId())) {
                model.put("specialAbilityItem", profileList1);
            }
        }
        model.addAttribute("id2", profileManager.get(SpecialAbilityID).getSpecialAbility().getId());
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("language", profileManager.get(SpecialAbilityID).getLanguage());
        model.addAttribute("family", profileManager.get(SpecialAbilityID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(SpecialAbilityID).getEducation());
        model.addAttribute("special", profileManager.get(SpecialAbilityID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(SpecialAbilityID).getWorkExperiences());
        model.put("formProfile", "profile");
        model.put("formtype", "edit");
        model.put("action", "update");
        model.put("specialabilityForm", SpecialAbilityForm);
        return "profile/special_ability/specialability_add_update";
    }

    @RequestMapping(value = "editForm/update", method = RequestMethod.POST)
    public String SpecialAbilityUpdate(@ModelAttribute("specialabilityForm") SpecialAbilityForm specialAbilityForm, ModelMap model, HttpServletResponse response) throws IOException {
        SpecialAbility specialAbilityTemp = specialAbilityManeger.update(specialAbilityForm);
        response.sendRedirect("../../../main/specialability/view/" + specialAbilityTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "addForm/save", method = RequestMethod.POST)
    public String SpecialAbilitySave(@ModelAttribute("specialabilityForm") SpecialAbilityForm specialAbilityForm, ModelMap model, HttpServletResponse response) throws IOException {
        SpecialAbility specialAbilityTemp = specialAbilityManeger.save(specialAbilityForm);
        response.sendRedirect("../../../main/specialability/view/" + specialAbilityTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String SpecialAbilityView(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("specialAbilityItem", profileList1);
            }
        }
        model.addAttribute("userInfo", userInfo);
        model.put("profileid", profileID);
        model.put("action", "specialability");
        model.put("formProfile", "profile");
        model.put("profileList", profileList);
        model.put("formtype", "view");
        model.addAttribute("language", profileManager.get(profileID).getLanguage());
        model.addAttribute("family", profileManager.get(profileID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(profileID).getEducation());
        model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
        return "profile/special_ability/specialability_view";
    }
}
