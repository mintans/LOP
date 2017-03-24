/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.document;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.model.db.Documention;
import th.co.entronica.mjolnir.model.manage.DocumentionManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping("/document")
public class DocumentController {
    @Autowired
    private UserInfo userInfo;

    @Autowired
    private UserManager userManager;
    
    @Autowired
    private DocumentionManager documentionManager;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Department(ModelMap model) {
        
        model.addAttribute("userInfo", userInfo);
        model.put("formDocument", "document");
        return "document/document";
    }
    
    @RequestMapping(value = "addDocument", method = RequestMethod.POST)
    public String addBenefits(@ModelAttribute Documention documention,ModelMap model,HttpServletResponse response, HttpServletRequest request) throws IOException {
        
        documentionManager.save(documention);
        response.sendRedirect("../../main/document");
        return null;
        
    }
}
