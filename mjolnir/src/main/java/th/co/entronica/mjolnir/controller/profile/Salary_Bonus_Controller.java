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
import th.co.entronica.mjolnir.model.db.Bonus;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Salary;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.BonusForm;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.form.SalaryForm;
import th.co.entronica.mjolnir.model.manage.BonusManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.SalaryManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping(value = "/salary_bonus")
public class Salary_Bonus_Controller {

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private SalaryManager salaryManager;

    @Autowired
    private BonusManager bonusManager;
    
    @Autowired
    private TransferManager transferManager;

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

    @RequestMapping(value = "salarySave", method = RequestMethod.POST)
    public String SalarySave(@ModelAttribute("salaryForm") SalaryForm salaryForm, ModelMap model, HttpServletResponse response) throws IOException {
        Salary salaryTemp = salaryManager.save(salaryForm);
        response.sendRedirect("../../main/salary_bonus/view/" + salaryTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "bonusSave", method = RequestMethod.POST)
    public String BonusSave(@ModelAttribute("bonusForm") BonusForm bonusForm, ModelMap model, HttpServletResponse response) throws IOException {
        Bonus bonusTemp = bonusManager.save(bonusForm);
        response.sendRedirect("../../main/salary_bonus/view/" + bonusTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "salaryDelete/{id}", method = RequestMethod.GET)
    public String SalaryDelete(ModelMap model, @PathVariable String id, HttpServletResponse response) throws IOException {
        Salary salaryList = salaryManager.get(id);
        String profileId = salaryList.getProfileId();
        salaryManager.delete(id);
        response.sendRedirect("../../salary_bonus/view/" + profileId);
        return null;
    }

    @RequestMapping(value = "bonusDelete/{id}", method = RequestMethod.GET)
    public String BonusDelete(ModelMap model, @PathVariable String id, HttpServletResponse response) throws IOException {
        Bonus bonusList = bonusManager.get(id);
        String profileId = bonusList.getProfileId();
        bonusManager.delete(id);
        response.sendRedirect("../../salary_bonus/view/" + profileId);
        return null;
    }

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String SalaryAndBonusView(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {
        int ck = 0;
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("profileItem1", profileList1);
                ck = 1;
            }
        }
        List<Transfer> transferList = transferManager.getAll();
        for (Transfer transferList1 : transferList) {
            if (profileID.equals(transferList1.getProfileId())) {
                model.put("userPosition", transferList1.getPosition());
                ck = 1;
            }
        }
        List<Salary> salaryList = salaryManager.getAll();
        if (salaryList != null) {
            model.put("salaryList", salaryList);
            for (Salary salaryList1 : salaryList) {
                model.put("salaryMoney", salaryList1.getSalary());
            }
        }
        List<Bonus> bonusList = bonusManager.getAll();
        if (bonusList != null) {
            model.put("bonusList", bonusList);
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
            return "profile/salary_bonus/salary_bonus_view";
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
