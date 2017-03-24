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
import org.springframework.web.bind.annotation.RequestParam;
import th.co.entronica.mjolnir.model.db.Documention;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.manage.DocumentionManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping(value = "/documentinfo")
public class DocumentInfoController {

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private UserManager userManager;

    @Autowired
    private DocumentionManager documentionManager;

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
        return "profile/document/document_view";
    }

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String DocumentionInfoView(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {
        int ck = 0;
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                ck = 1;
            }
        }
        List<Documention> documentionList = documentionManager.getAll();
        if (documentionList != null) {
            int salaryCertificate = 0, staffCertificate = 0, behaviorCertificate = 0;
            model.put("documentionAllList", documentionList);
            List<Documention> documentionInfoList = new ArrayList<>();
            for (Documention documentionList1 : documentionList) {
                if ((profileID.equals(documentionList1.getUserId())) && (documentionList1.isAdmin() == true)) {
                    documentionInfoList.add(documentionList1);
                    if(documentionList1.getRequestedDocuments().equals("หนังสือรับรองเงินเดือน")){
                        salaryCertificate += Integer.parseInt(documentionList1.getAmount());
                    }
                    if(documentionList1.getRequestedDocuments().equals("หนังสือรับรองเป็นพนักงาน")){
                        staffCertificate += Integer.parseInt(documentionList1.getAmount());
                    }
                    if(documentionList1.getRequestedDocuments().equals("หนังสือรับรองความประพฤติ")){
                        behaviorCertificate += Integer.parseInt(documentionList1.getAmount());
                    }
                }
            }
            model.put("salaryCertificate", salaryCertificate);
            model.put("staffCertificate", staffCertificate);
            model.put("behaviorCertificate", behaviorCertificate);
            model.put("documentionInfoList", documentionInfoList);
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
            return "profile/document/document_view";
        } else {
            response.sendRedirect("../addForm?uId=" + profileID);
            return null;
        }
    }
}
