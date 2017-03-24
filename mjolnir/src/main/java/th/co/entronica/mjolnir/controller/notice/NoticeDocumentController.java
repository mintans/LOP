/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.notice;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.model.db.Documention;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.manage.DocumentionManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping("/noticeDocument")
public class NoticeDocumentController {
    @Autowired
    private UserInfo userInfo;

    @Autowired
    private UserManager userManager;
    
    @Autowired
    private DocumentionManager documentionManager;
    
    @Autowired
    private ProfileManager profileManager;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        List<User> userList = userManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formNotice", "notice");
        model.put("userList", userList);
        
        List<Documention> documentList = documentionManager.getAll();
        model.put("documentList", documentList);
        
        List<Profile> profileList = profileManager.getAll();
        model.put("profileList", profileList);
        
        return "notice/notice_document";
    }
    
    @RequestMapping(value = "acceptDocument/{documentId}", method = RequestMethod.GET)
    public String adminApproveLeave(@PathVariable String documentId, ModelMap model, HttpServletResponse response) throws IOException {
        
        documentionManager.update(documentId);
        response.sendRedirect("../../../main/noticeDocument");
        return null;
    }
    
}
