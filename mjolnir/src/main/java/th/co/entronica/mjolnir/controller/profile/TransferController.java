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
import th.co.entronica.mjolnir.model.db.Position;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.form.TransferForm;
import th.co.entronica.mjolnir.model.manage.PositionManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping(value = "/transfer")
public class TransferController {

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private TransferManager transferManager;

    @Autowired
    private PositionManager positionManager;
    
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
        return "profile/transfer/transfer_view";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String TransferSave(@ModelAttribute("transferForm") TransferForm transferForm, ModelMap model, HttpServletResponse response) throws IOException {
        Transfer transferTemp = transferManager.save(transferForm);
        response.sendRedirect("../../main/transfer/view/" + transferTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String TransferDelete(ModelMap model, @PathVariable String id, HttpServletResponse response) throws IOException {
        Transfer transferList = transferManager.get(id);
        String profileId = transferList.getProfileId();
        transferManager.delete(id);
        response.sendRedirect("../../transfer/view/" + profileId);
        return null;
    }

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String TransferView(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {
        int ck = 0;
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("transferItem", profileList1);
                ck = 1;
            }
        }
        List<Transfer> transferList = transferManager.getAll();
        if (transferList != null) {
            model.put("transferList", transferList);
        }
        if (ck == 1) {
            List<Position> positionList = positionManager.getAll();
            model.put("positionList", positionList);
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
            return "profile/transfer/transfer_view";
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
