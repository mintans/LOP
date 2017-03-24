/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Mintans
 */
@Controller
@RequestMapping("/structure")
public class Structure {
    
    @Autowired
    private UserInfo userInfo;
    
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String getStructure(ModelMap model){
        model.addAttribute("userInfo", userInfo);
        model.put("formStructure", "structure");
        

        return "structure/structure";
    }
    }
