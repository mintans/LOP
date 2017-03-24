/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.profile;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.db.EmploymentType;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.manage.EmploymentManager;
import th.co.entronica.mjolnir.model.manage.EmploymentTypeManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Asus PC
 */
@Controller
@RequestMapping(value = "/profile")
public class ProfileController {

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private UserManager userManager;
    
    @Autowired
    private TransferManager transferManager;
    
    @Autowired
    private EmploymentManager employmentManager;
    
    @Autowired
    private EmploymentTypeManager employmentTypeManager;

    @Autowired
    private UserInfo userInfo;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        List<User> userList = userManager.getAll();
        List<Profile> profileList = profileManager.getAll();
        List<Transfer> transferList = transferManager.getAll();
        List<Employment> employmentList = employmentManager.getAll();
        List<EmploymentType> employmentTypeList = employmentTypeManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        model.put("profileList", profileList);
        model.put("userList", userList);
        model.put("transferList", transferList);
        model.put("employmentList", employmentList);
        model.put("employmentTypeList", employmentTypeList);
        return "profile/profile_form";
    }

    @RequestMapping(value = "addFormTH", method = RequestMethod.GET)
    public String ProfileAddFormTH(ModelMap model, @RequestParam(value = "uId") String uId) {
        ProfileForm profileForm = new ProfileForm();
        User user = userManager.get(uId);
        String startWorkDate = user.getStartWorkDate();
        model.put("startWorkDate", startWorkDate);
        model.addAttribute("userInfo", userInfo);
        model.put("uId", uId);
        model.put("formProfile", "profile");
        model.put("formtype", "add");
        model.put("action", "save");
        model.put("profileForm", profileForm);
        List<String> privinceListTH = getJsonProvinceAllTH();
        model.put("provinceTH", privinceListTH);
        return "profile/profile_add_update_TH";
    }

    @RequestMapping(value = "addFormEN", method = RequestMethod.GET)
    public String ProfileAddFormEN(ModelMap model, @RequestParam(value = "uId") String uId) {
        ProfileForm profileForm = new ProfileForm();
        User user = userManager.get(uId);
        String startWorkDate = user.getStartWorkDate();
        model.put("startWorkDate", startWorkDate);
        model.addAttribute("userInfo", userInfo);
        model.put("uId", uId);
        model.put("formProfile", "profile");
        model.put("formtype", "add");
        model.put("action", "save");
        model.put("profileForm", profileForm);
        List<String> privinceListEN = getJsonProvinceAllEN();
        model.put("provinceEN", privinceListEN);
        return "profile/profile_add_update_EN";
    }

    @RequestMapping(value = "editFormTH/{profileID}", method = RequestMethod.GET)
    public String ProfileEditFormTH(ModelMap model, @PathVariable String profileID) {
        User user = userManager.get(profileID);
        String startWorkDate = user.getStartWorkDate();
        model.put("startWorkDate", startWorkDate);

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
        List<String> privinceListTH = getJsonProvinceAllTH();
        model.put("provinceTH", privinceListTH);
        return "profile/profile_add_update_TH";
    }

    @RequestMapping(value = "editFormEN/{profileID}", method = RequestMethod.GET)
    public String ProfileEditFormEN(ModelMap model, @PathVariable String profileID) {
        User user = userManager.get(profileID);
        String startWorkDate = user.getStartWorkDate();
        model.put("startWorkDate", startWorkDate);

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
        List<String> privinceListEN = getJsonProvinceAllEN();
        model.put("provinceEN", privinceListEN);
        return "profile/profile_add_update_EN";
    }

    @RequestMapping(value = "editFormTH/update", method = RequestMethod.POST)
    public String ProfileUpdateTH(@ModelAttribute("profileForm") ProfileForm profileForm, ModelMap model, HttpServletResponse response) throws IOException {
        Profile profileTemp = profileManager.update(profileForm);
        response.sendRedirect("../../../main/profile/viewTH/" + profileTemp.getId());
        return null;
    }

    @RequestMapping(value = "editFormEN/update", method = RequestMethod.POST)
    public String ProfileUpdateEN(@ModelAttribute("profileForm") ProfileForm profileForm, ModelMap model, HttpServletResponse response) throws IOException {
        Profile profileTemp = profileManager.updateEN(profileForm);
        response.sendRedirect("../../../main/profile/viewEN/" + profileTemp.getId());
        return null;
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String ProfileSaveTH(@ModelAttribute("profileForm") ProfileForm profileForm, ModelMap model, HttpServletResponse response) throws IOException {
        Profile profileTemp = profileManager.save(profileForm);
        response.sendRedirect("../../main/profile/viewTH/" + profileTemp.getId());
        return null;
    }

    @RequestMapping(value = "save", method = RequestMethod.POST, params = "saveprofile")
    public String ProfileSaveFamily(@ModelAttribute("profileForm") ProfileForm profileForm, ModelMap model, HttpServletResponse response) throws IOException {
        Profile profileTemp = profileManager.save(profileForm);
        response.sendRedirect("../../main/familyinfo/addForm/" + profileTemp.getId());
        return null;
    }

    @RequestMapping(value = "delete/{profileID}", method = RequestMethod.GET)
    public String ProfileDelete(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {

        profileManager.delete(profileID);
        response.sendRedirect("../../../main/profile");
        return null;
    }

    @RequestMapping(value = "json/provinceTH-all", method = RequestMethod.GET)
    public @ResponseBody
    List<String> getJsonProvinceAllTH() {
        ArrayList<String> listProvince = new ArrayList<>();
        listProvince.add("กรุงเทพมหานคร");
        listProvince.add("กระบี่");
        listProvince.add("กาญจนบุรี");
        listProvince.add("กาฬสินธุ์");
        listProvince.add("กำแพงเพชร");
        listProvince.add("ขอนแก่น");
        listProvince.add("จันทบุรี");
        listProvince.add("ฉะเชิงเทรา");
        listProvince.add("ชัยนาท");
        listProvince.add("ชัยภูมิ");
        listProvince.add("ชุมพร");
        listProvince.add("ชลบุรี");
        listProvince.add("เชียงใหม่");
        listProvince.add("เชียงราย");
        listProvince.add("ตรัง");
        listProvince.add("ตราด");
        listProvince.add("ตาก");
        listProvince.add("นครนายก");
        listProvince.add("นครปฐม");
        listProvince.add("นครพนม");
        listProvince.add("นครราชสีมา");
        listProvince.add("นครศรีธรรมราช");
        listProvince.add("นครสวรรค์");
        listProvince.add("นราธิวาส");
        listProvince.add("น่าน");
        listProvince.add("นนทบุรี");
        listProvince.add("บึงกาฬ");
        listProvince.add("บุรีรัมย์");
        listProvince.add("ประจวบคีรีขันธ์");
        listProvince.add("ปทุมธานี");
        listProvince.add("ปราจีนบุรี");
        listProvince.add("ปัตตานี");
        listProvince.add("พะเยา");
        listProvince.add("พระนครศรีอยุธยา");
        listProvince.add("พังงา");
        listProvince.add("พิจิตร");
        listProvince.add("พิษณุโลก");
        listProvince.add("เพชรบุรี");
        listProvince.add("เพชรบูรณ์");
        listProvince.add("แพร่");
        listProvince.add("พัทลุง");
        listProvince.add("ภูเก็ต");
        listProvince.add("มหาสารคาม");
        listProvince.add("มุกดาหาร");
        listProvince.add("แม่ฮ่องสอน");
        listProvince.add("ยโสธร");
        listProvince.add("ยะลา");
        listProvince.add("ร้อยเอ็ด");
        listProvince.add("ระนอง");
        listProvince.add("ระยอง");
        listProvince.add("ราชบุรี");
        listProvince.add("ลพบุรี");
        listProvince.add("ลำปาง");
        listProvince.add("ลำพูน");
        listProvince.add("เลย");
        listProvince.add("ศรีสะเกษ");
        listProvince.add("สกลนคร");
        listProvince.add("สงขลา");
        listProvince.add("สมุทรสาคร");
        listProvince.add("สมุทรปราการ");
        listProvince.add("สมุทรสงคราม");
        listProvince.add("สระแก้ว");
        listProvince.add("สระบุรี");
        listProvince.add("สิงห์บุรี");
        listProvince.add("สุโขทัย");
        listProvince.add("สุพรรณบุรี");
        listProvince.add("สุราษฎร์ธานี");
        listProvince.add("สุรินทร์");
        listProvince.add("สตูล");
        listProvince.add("หนองคาย");
        listProvince.add("หนองบัวลำภู");
        listProvince.add("อำนาจเจริญ");
        listProvince.add("อุดรธานี");
        listProvince.add("อุตรดิตถ์");
        listProvince.add("อุทัยธานี");
        listProvince.add("อุบลราชธานี");
        listProvince.add("อ่างทอง");
        return listProvince;
    }

    @RequestMapping(value = "json/provinceEN-all", method = RequestMethod.GET)
    public @ResponseBody
    List<String> getJsonProvinceAllEN() {
        ArrayList<String> listProvince = new ArrayList<>();
        listProvince.add("Bangkok");
        listProvince.add("Krabi");
        listProvince.add("Kanchanaburi");
        listProvince.add("Kalasin");
        listProvince.add("Kamphaengpet");
        listProvince.add("Khonkaen");
        listProvince.add("Chanthaburi");
        listProvince.add("Chachoengsao");
        listProvince.add("Chainat");
        listProvince.add("Chaiyaphum");
        listProvince.add("Chumphon");
        listProvince.add("Chonburi");
        listProvince.add("Chiang mai");
        listProvince.add("Chiang rai");
        listProvince.add("Trang");
        listProvince.add("Trad");
        listProvince.add("Tak");
        listProvince.add("Nakhonnayok");
        listProvince.add("Nakhonpathom");
        listProvince.add("Nakhonphanom");
        listProvince.add("Nakhonratchasima");
        listProvince.add("Nakhonsithummarat");
        listProvince.add("Nakhonsawan");
        listProvince.add("Narathiwat");
        listProvince.add("Nan");
        listProvince.add("Nonthaburi");
        listProvince.add("Buengkan");
        listProvince.add("Burirum");
        listProvince.add("Prachuabkhirikhan");
        listProvince.add("Phatumthani");
        listProvince.add("Prachinburi");
        listProvince.add("Pattani");
        listProvince.add("Phayao");
        listProvince.add("Ayuthaya");
        listProvince.add("Phangnga");
        listProvince.add("Phichit");
        listProvince.add("Phitsanulok");
        listProvince.add("Petchaburi");
        listProvince.add("Petchabun");
        listProvince.add("Phrae");
        listProvince.add("Phatthalung");
        listProvince.add("Phuket");
        listProvince.add("Mahasarakham");
        listProvince.add("Mukdahan");
        listProvince.add("Maehongson");
        listProvince.add("Yasothon");
        listProvince.add("Yala");
        listProvince.add("Roi-Et");
        listProvince.add("Ranong");
        listProvince.add("Rayong");
        listProvince.add("Ratchaburi");
        listProvince.add("Lopburi");
        listProvince.add("Lampang");
        listProvince.add("Lampoon");
        listProvince.add("Loei");
        listProvince.add("Sisaket");
        listProvince.add("Sakhonnakorn");
        listProvince.add("Songkhla");
        listProvince.add("Samutsakhon");
        listProvince.add("Samutprakan");
        listProvince.add("Samutsongkhram");
        listProvince.add("Srakaeo");
        listProvince.add("Saraburi");
        listProvince.add("Singburi");
        listProvince.add("Sukhothai");
        listProvince.add("Suphanburi");
        listProvince.add("Suratthani");
        listProvince.add("Surin");
        listProvince.add("Satun");
        listProvince.add("Nongkhai");
        listProvince.add("Nongbualamphu");
        listProvince.add("Amnatcharoen");
        listProvince.add("Udonthani");
        listProvince.add("Uttaradit");
        listProvince.add("Uthaithani");
        listProvince.add("Ubonratchathani");
        listProvince.add("Ang Thong");
        return listProvince;
    }

    @RequestMapping(value = "viewTH/{profileID}", method = RequestMethod.GET)
    public String ProfileViewTH(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {
        int ck = 0;
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("profileItem", profileList1);
                model.put("provinceRegistrationTH", findProvinceTH(profileList1.getProvinceRegistration()));
                model.put("provinceCurrentTH", findProvinceTH(profileList1.getProvinceCurrent()));
                ck = 1;
            }
        }

        if (ck == 1) {
            User user = userManager.get(profileID);
            String startWorkDate = user.getStartWorkDate();
            model.put("startWorkDate", startWorkDate);
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
            return "profile/profile_view_TH";
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

    @RequestMapping(value = "viewEN/{profileID}", method = RequestMethod.GET)
    public String ProfileViewEN(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {
        int ck = 0;
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("profileItem", profileList1);
                model.put("provinceRegistrationEN", findProvinceEN(profileList1.getProvinceRegistration()));
                model.put("provinceCurrentEN", findProvinceEN(profileList1.getProvinceCurrent()));
                ck = 1;
            }
        }

        if (ck == 1) {
            User user = userManager.get(profileID);
            String startWorkDate = user.getStartWorkDate();
            model.put("startWorkDate", startWorkDate);
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
            return "profile/profile_view_EN";
        } else {
//            ProfileForm profileForm = new ProfileForm();
//            model.addAttribute("userInfo", userInfo);
//            model.put("uId", profileID);
//            model.put("formProfile", "profile");
//            model.put("formtype", "add");
//            model.put("action", "save");
//            model.put("profileForm", profileForm);
            response.sendRedirect("../addFormEN?uId=" + profileID);
            return null;
        }
    }

    @RequestMapping(value = "json/findProvinceTH-all", method = RequestMethod.GET)
    public @ResponseBody
    String findProvinceTH(String provinceValue) {
        HashMap<String, String> mapProvinceList = new HashMap<>();
        mapProvinceList.put("1", "กรุงเทพมหานคร");
        mapProvinceList.put("2", "กระบี่");
        mapProvinceList.put("3", "กาญจนบุรี");
        mapProvinceList.put("4", "กาฬสินธุ์");
        mapProvinceList.put("5", "กำแพงเพชร");
        mapProvinceList.put("6", "ขอนแก่น");
        mapProvinceList.put("7", "จันทบุรี");
        mapProvinceList.put("8", "ฉะเชิงเทรา");
        mapProvinceList.put("9", "ชัยนาท");
        mapProvinceList.put("10", "ชัยภูมิ");
        mapProvinceList.put("11", "ชุมพร");
        mapProvinceList.put("12", "ชลบุรี");
        mapProvinceList.put("13", "เชียงใหม่");
        mapProvinceList.put("14", "เชียงราย");
        mapProvinceList.put("15", "ตรัง");
        mapProvinceList.put("16", "ตราด");
        mapProvinceList.put("17", "ตาก");
        mapProvinceList.put("18", "นครนายก");
        mapProvinceList.put("19", "นครปฐม");
        mapProvinceList.put("20", "นครพนม");
        mapProvinceList.put("21", "นครราชสีมา");
        mapProvinceList.put("22", "นครศรีธรรมราช");
        mapProvinceList.put("23", "นครสวรรค์");
        mapProvinceList.put("24", "นราธิวาส");
        mapProvinceList.put("25", "น่าน");
        mapProvinceList.put("26", "นนทบุรี");
        mapProvinceList.put("27", "บึงกาฬ");
        mapProvinceList.put("28", "บุรีรัมย์");
        mapProvinceList.put("29", "ประจวบคีรีขันธ์");
        mapProvinceList.put("30", "ปทุมธานี");
        mapProvinceList.put("31", "ปราจีนบุรี");
        mapProvinceList.put("32", "ปัตตานี");
        mapProvinceList.put("33", "พะเยา");
        mapProvinceList.put("34", "พระนครศรีอยุธยา");
        mapProvinceList.put("35", "พังงา");
        mapProvinceList.put("36", "พิจิตร");
        mapProvinceList.put("37", "พิษณุโลก");
        mapProvinceList.put("38", "เพชรบุรี");
        mapProvinceList.put("39", "เพชรบูรณ์");
        mapProvinceList.put("40", "แพร่");
        mapProvinceList.put("41", "พัทลุง");
        mapProvinceList.put("42", "ภูเก็ต");
        mapProvinceList.put("43", "มหาสารคาม");
        mapProvinceList.put("44", "มุกดาหาร");
        mapProvinceList.put("45", "แม่ฮ่องสอน");
        mapProvinceList.put("46", "ยโสธร");
        mapProvinceList.put("47", "ยะลา");
        mapProvinceList.put("48", "ร้อยเอ็ด");
        mapProvinceList.put("49", "ระนอง");
        mapProvinceList.put("50", "ระยอง");
        mapProvinceList.put("51", "ราชบุรี");
        mapProvinceList.put("52", "ลพบุรี");
        mapProvinceList.put("53", "ลำปาง");
        mapProvinceList.put("54", "ลำพูน");
        mapProvinceList.put("55", "เลย");
        mapProvinceList.put("56", "ศรีสะเกษ");
        mapProvinceList.put("57", "สกลนคร");
        mapProvinceList.put("58", "สงขลา");
        mapProvinceList.put("59", "สมุทรสาคร");
        mapProvinceList.put("60", "สมุทรปราการ");
        mapProvinceList.put("61", "สมุทรสงคราม");
        mapProvinceList.put("62", "สระแก้ว");
        mapProvinceList.put("63", "สระบุรี");
        mapProvinceList.put("64", "สิงห์บุรี");
        mapProvinceList.put("65", "สุโขทัย");
        mapProvinceList.put("66", "สุพรรณบุรี");
        mapProvinceList.put("67", "สุราษฎร์ธานี");
        mapProvinceList.put("68", "สุรินทร์");
        mapProvinceList.put("69", "สตูล");
        mapProvinceList.put("70", "หนองคาย");
        mapProvinceList.put("71", "หนองบัวลำภู");
        mapProvinceList.put("72", "อำนาจเจริญ");
        mapProvinceList.put("73", "อุดรธานี");
        mapProvinceList.put("74", "อุตรดิตถ์");
        mapProvinceList.put("75", "อุทัยธานี");
        mapProvinceList.put("76", "อุบลราชธานี");
        mapProvinceList.put("77", "อ่างทอง");
        String province = mapProvinceList.get(provinceValue);
        return province;
    }

    @RequestMapping(value = "json/findProvinceEN-all", method = RequestMethod.GET)
    public @ResponseBody
    String findProvinceEN(String provinceValue) {
        HashMap<String, String> mapProvinceList = new HashMap<>();
        mapProvinceList.put("1", "Bangkok");
        mapProvinceList.put("2", "Krabi");
        mapProvinceList.put("3", "Kanchanaburi");
        mapProvinceList.put("4", "Kalasin");
        mapProvinceList.put("5", "Kamphaengpet");
        mapProvinceList.put("6", "Khonkaen");
        mapProvinceList.put("7", "Chanthaburi");
        mapProvinceList.put("8", "Chachoengsao");
        mapProvinceList.put("9", "Chainat");
        mapProvinceList.put("10", "Chaiyaphum");
        mapProvinceList.put("11", "Chumphon");
        mapProvinceList.put("12", "Chonburi");
        mapProvinceList.put("13", "Chiang mai");
        mapProvinceList.put("14", "Chiang rai");
        mapProvinceList.put("15", "Trang");
        mapProvinceList.put("16", "Trad");
        mapProvinceList.put("17", "Tak");
        mapProvinceList.put("18", "Nakhonnayok");
        mapProvinceList.put("19", "Nakhonpathom");
        mapProvinceList.put("20", "Nakhonphanom");
        mapProvinceList.put("21", "Nakhonratchasima");
        mapProvinceList.put("22", "Nakhonsithummarat");
        mapProvinceList.put("23", "Nakhonsawan");
        mapProvinceList.put("24", "Narathiwat");
        mapProvinceList.put("25", "Nan");
        mapProvinceList.put("26", "Nonthaburi");
        mapProvinceList.put("27", "Buengkan");
        mapProvinceList.put("28", "Burirum");
        mapProvinceList.put("29", "Prachuabkhirikhan");
        mapProvinceList.put("30", "Phatumthani");
        mapProvinceList.put("31", "Prachinburi");
        mapProvinceList.put("32", "Pattani");
        mapProvinceList.put("33", "Phayao");
        mapProvinceList.put("34", "Ayuthaya");
        mapProvinceList.put("35", "Phangnga");
        mapProvinceList.put("36", "Phichit");
        mapProvinceList.put("37", "Phitsanulok");
        mapProvinceList.put("38", "Petchaburi");
        mapProvinceList.put("39", "Petchabun");
        mapProvinceList.put("40", "Phrae");
        mapProvinceList.put("41", "Phatthalung");
        mapProvinceList.put("42", "Phuket");
        mapProvinceList.put("43", "Mahasarakham");
        mapProvinceList.put("44", "Mukdahan");
        mapProvinceList.put("45", "Maehongson");
        mapProvinceList.put("46", "Yasothon");
        mapProvinceList.put("47", "Yala");
        mapProvinceList.put("48", "Roi-Et");
        mapProvinceList.put("49", "Ranong");
        mapProvinceList.put("50", "Rayong");
        mapProvinceList.put("51", "Ratchaburi");
        mapProvinceList.put("52", "Lopburi");
        mapProvinceList.put("53", "Lampang");
        mapProvinceList.put("54", "Lampoon");
        mapProvinceList.put("55", "Loei");
        mapProvinceList.put("56", "Sisaket");
        mapProvinceList.put("57", "Sakhonnakorn");
        mapProvinceList.put("58", "Songkhla");
        mapProvinceList.put("59", "Samutsakhon");
        mapProvinceList.put("60", "Samutprakan");
        mapProvinceList.put("61", "Samutsongkhram");
        mapProvinceList.put("62", "Srakaeo");
        mapProvinceList.put("63", "Saraburi");
        mapProvinceList.put("64", "Singburi");
        mapProvinceList.put("65", "Sukhothai");
        mapProvinceList.put("66", "Suphanburi");
        mapProvinceList.put("67", "Suratthani");
        mapProvinceList.put("68", "Surin");
        mapProvinceList.put("69", "Satun");
        mapProvinceList.put("70", "Nongkhai");
        mapProvinceList.put("71", "Nongbualamphu");
        mapProvinceList.put("72", "Amnatcharoen");
        mapProvinceList.put("73", "Udonthani");
        mapProvinceList.put("74", "Uttaradit");
        mapProvinceList.put("75", "Uthaithani");
        mapProvinceList.put("76", "Ubonratchathani");
        mapProvinceList.put("77", "Ang Thong");
        String province = mapProvinceList.get(provinceValue);
        return province;
    }
}
