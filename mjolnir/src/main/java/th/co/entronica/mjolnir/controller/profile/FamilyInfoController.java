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
import th.co.entronica.mjolnir.model.db.FamilyInfo;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.form.FamilyInfoForm;
import th.co.entronica.mjolnir.model.manage.FamilyInfoManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Asus PC
 */
@Controller
@RequestMapping(value = "/familyinfo")
public class FamilyInfoController {

    @Autowired
    private ProfileManager profileManager;
    @Autowired
    private FamilyInfoManager familyInfoManager;

    @Autowired
    private UserInfo userInfo;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        List<FamilyInfo> familyInfoList = familyInfoManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        model.put("familyInfoList", familyInfoList);
        return "profile/family/familyInfo_view";
    }

    @RequestMapping(value = "addForm/{profileID}", method = RequestMethod.GET)
    public String FamilyInfoAddForm(ModelMap model, @PathVariable String profileID) {
        model.addAttribute("id", profileID);
        model.addAttribute("profileid", profileID);
        FamilyInfoForm familyInfoForm = new FamilyInfoForm();
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("language", profileManager.get(profileID).getLanguage());
        model.addAttribute("family", profileManager.get(profileID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(profileID).getEducation());
        model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("familyItem", profileList1);
            }
        }
        model.put("workList", profileList);
        model.put("formtype", "edit");
        model.put("formProfile", "profile");
        model.put("action", "save");
        model.put("familyInfoForm", familyInfoForm);
        return "profile/family/familyInfo_add_update";
    }

    @RequestMapping(value = "editForm/{familyInfoID}", method = RequestMethod.GET)
    public String FamilyInfoEditForm(ModelMap model, @PathVariable String familyInfoID) {

        FamilyInfo familyinfoForm = (FamilyInfo) profileManager.get(familyInfoID).getFamilyinfo();

        model.addAttribute("id", familyInfoID);
        model.addAttribute("id2", profileManager.get(familyInfoID).getFamilyinfo().getId());
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("language", profileManager.get(familyInfoID).getLanguage());
        model.addAttribute("family", profileManager.get(familyInfoID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(familyInfoID).getEducation());
        model.addAttribute("special", profileManager.get(familyInfoID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(familyInfoID).getWorkExperiences());
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (familyInfoID.equals(profileList1.getId())) {
                model.put("familyItem", profileList1);
            }
        }
        model.put("workList", profileList);
        model.put("formProfile", "profile");
        model.put("action", "update");
        model.put("familyInfoForm", familyinfoForm);
        model.put("formtype", "edit");
        return "profile/family/familyInfo_add_update";
    }

    @RequestMapping(value = "editForm/update", method = RequestMethod.POST)
    public String FamilyInfoUpdate(@ModelAttribute("familyInfoForm") FamilyInfoForm familyInfoForm, ModelMap model, HttpServletResponse response) throws IOException {
        FamilyInfo familyInfoTemp = familyInfoManager.update(familyInfoForm);
        response.sendRedirect("../../../main/familyinfo/view/" + familyInfoTemp.getProfileId());
        return "profile/family/familyInfo_add_update";
    }

    @RequestMapping(value = "addForm/save", method = RequestMethod.POST)
    public String FamilyInfoSave(@ModelAttribute("familyInfoForm") FamilyInfoForm familyInfoForm, ModelMap model, HttpServletResponse response) throws IOException {
        FamilyInfo familyInfoTemp = familyInfoManager.save(familyInfoForm);
        response.sendRedirect("../../../main/familyinfo/view/" + familyInfoTemp.getProfileId());
        return null;
    }

//    @RequestMapping(value = "addForm/save", method = RequestMethod.POST, params = "savefamily")
//    public String FamilyInfoSaveEducation(@ModelAttribute("familyInfoForm") FamilyInfoForm familyInfoForm, ModelMap model, HttpServletResponse response) throws IOException {
//        FamilyInfo familyInfoTemp = familyInfoManager.save(familyInfoForm);
//        response.sendRedirect("../../../main/education/educationForm/" + familyInfoTemp.getProfileId());
//        return null;
//    }
    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String ProfileView(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {

        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("familyItem", profileList1);
            }
        }
        model.addAttribute("userInfo", userInfo);
        model.put("profileid", profileID);
        model.put("action", "familyInfo");
        model.put("formProfile", "profile");
        model.put("profileList", profileList);
        model.addAttribute("language", profileManager.get(profileID).getLanguage());
        model.addAttribute("family", profileManager.get(profileID).getFamilyinfo());
        model.addAttribute("education", profileManager.get(profileID).getEducation());
        model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
        model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
        return "profile/family/familyInfo_view";
    }

}
