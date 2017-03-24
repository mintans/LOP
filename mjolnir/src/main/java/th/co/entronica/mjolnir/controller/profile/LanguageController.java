/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.profile;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.model.db.Education;
import th.co.entronica.mjolnir.model.db.Language;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.form.EducationForm;
import th.co.entronica.mjolnir.model.form.LanguageForm;

import th.co.entronica.mjolnir.model.manage.EducationManager;
import th.co.entronica.mjolnir.model.manage.LanguageManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;

import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Pop
 */
@Controller
@RequestMapping("/language")
public class LanguageController {

    @Autowired
    private LanguageManager languageManager;
    @Autowired
    private ProfileManager profileManager;
    @Autowired
    private UserInfo userInfo;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String show(ModelMap model) {
        List<Language> languageList = languageManager.getAll();
        model.put("form", "language");

        model.addAttribute("userInfo", userInfo);
        model.put("action", "language");
        model.put("languageList", languageList);
        return "profile/language/language";
    }

    @RequestMapping(value = "languageForm/{profileID}", method = RequestMethod.GET)
    public String languageForm(ModelMap model, @PathVariable String profileID) {
        int sizeOtherLanguage = 0;
        LanguageForm languageForm = new LanguageForm();
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("languageItem", profileList1);
                if (profileList1.getLanguage() != null) {
                    sizeOtherLanguage = profileList1.getLanguage().getOtherLanguage().size();
                }
            }
        }
        model.put("sizeOtherLanguage", sizeOtherLanguage);
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
        model.put("languageForm", languageForm);
        return "profile/language/language_add_update";
    }

    @RequestMapping(value = "languageForm/save", method = RequestMethod.POST)
    public String languageSave(@ModelAttribute("languageForm") LanguageForm languageForm, ModelMap model,
            HttpServletResponse response) throws IOException {

        Language languageTemp = languageManager.save(languageForm);
        response.sendRedirect("../../../main/language/view/" + languageTemp.getProfileId());

        return null;
    }

    @RequestMapping(value = "languageForm/save", method = RequestMethod.POST, params = "save language")
    public String languageSaveda(@ModelAttribute("languageForm") LanguageForm languageForm, ModelMap model,
            HttpServletResponse response) throws IOException {

        Language languageTemp = languageManager.save(languageForm);
        response.sendRedirect("../../../main/specialability/addForm/" + languageTemp.getProfileId());

        return null;
    }

    @RequestMapping(value = "editForm/{languageId}", method = RequestMethod.GET)
    public String languageEdit(ModelMap model, HttpServletResponse response, @PathVariable String languageId) {
        int sizeOtherLanguage = 0;
        Language languageForm = (Language) profileManager.get(languageId).getLanguage();
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (languageId.equals(profileList1.getId())) {
                model.put("languageItem", profileList1);
                sizeOtherLanguage = profileList1.getLanguage().getOtherLanguage().size();
            }
        }
        model.put("sizeOtherLanguage", sizeOtherLanguage);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("id", languageId);
        model.addAttribute("id2", profileManager.get(languageId).getLanguage().getId());
        model.put("formProfile", "profile");
        model.addAttribute("language", profileManager.get(languageId).getLanguage());
        model.addAttribute("family", profileManager.get(languageId).getFamilyinfo());
        model.addAttribute("education", profileManager.get(languageId).getEducation());
        model.addAttribute("special", profileManager.get(languageId).getSpecialAbility());
        model.addAttribute("work", profileManager.get(languageId).getWorkExperiences());
        model.addAttribute("formtype", "edit");
        model.put("action", "update");
        model.put("languageForm", languageForm);
        return "profile/language/language_add_update";
    }

    @RequestMapping(value = "editForm/update", method = RequestMethod.POST)
    public String languageUpdate(@ModelAttribute("languageForm") LanguageForm languageForm, ModelMap model,
            HttpServletResponse response) throws IOException {

        Language languageTemp = languageManager.update(languageForm);
        response.sendRedirect("../../../main/language/view/" + languageTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "delete/{languageId}", method = RequestMethod.GET)
    public String languageDelete(ModelMap model, HttpServletResponse response, @PathVariable String languageId) throws IOException {
        languageManager.delete(languageId);

        response.sendRedirect("../../../main/profile");
        return null;
    }

    @RequestMapping(value = "deleteOtherLanguage/{languageId}&{languageName}", method = RequestMethod.GET)
    public String otherLanguageDelete(ModelMap model, HttpServletResponse response, @PathVariable String languageName, @PathVariable String languageId) throws IOException {
        languageManager.deleteOtherLanguage(languageId, languageName);
        response.sendRedirect("../../../main/language/editForm/" + languageId);
        return null;
    }

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String languageView(ModelMap model, HttpServletResponse response, @PathVariable String profileID) {
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("languageItem", profileList1);
            }
        }
        model.addAttribute("userInfo", userInfo);
        model.put("formProfile", "profile");
        model.put("profileid", profileID);
        model.put("profileList", profileList);
        model.put("action", "language");
        model.put("formtype", "view");
        model.addAttribute("language", profileManager.get(profileID).getLanguage());
        model.addAttribute("family", profileManager.get(profileID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(profileID).getEducation());
        model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
        return "profile/language/language_view";
    }
}
