/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.supplement;

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
import th.co.entronica.mjolnir.model.db.Leader;
import th.co.entronica.mjolnir.model.db.OverTime;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.OverTimeForm;
import th.co.entronica.mjolnir.model.manage.LeaderManager;
import th.co.entronica.mjolnir.model.manage.OverTimeManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Gam
 */
@Controller
@RequestMapping("/overtime")
public class OverTimeController {
    
    @Autowired
    private UserInfo userInfo;

    @Autowired
    private OverTimeManager overtimeManager;
    
    @Autowired
    private ProfileManager profileManager;
    
    @Autowired
    private LeaderManager leaderManager;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model, @RequestParam(value="empId", required = false) String empId) {
        List<Profile> profileList = profileManager.getAll();
        model.addAttribute("userInfo", userInfo);
//        model.put("formhome", "home");
        model.put("formOverTime", "overtime");
        model.put("profileList", profileList);
        model.addAttribute("empId", empId);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        List<OverTime> overtimeList = overtimeManager.getAll();
        model.put("overtimeList", overtimeList);
        return "supplement/overtime/overtime";
    }
       
    @RequestMapping(value = "addForm", method = RequestMethod.GET)
    public String useraddForm(ModelMap model, @RequestParam(value="empId", required = true) String empId) {
        OverTimeForm overtimeForm = new OverTimeForm();
        model.addAttribute("userInfo", userInfo);
        model.put("action", "save");
        model.put("overtimeForm", overtimeForm);
        model.addAttribute("empId", empId);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        return "supplement/overtime/overtime_form";
    }
    
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String saveOT(@ModelAttribute("overtimeForm") OverTimeForm OTForm, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = OTForm.getEmpId();
        overtimeManager.save(OTForm);
        response.sendRedirect("../../main/overtime?empId="+empId);
        return null;
    }
    
    @RequestMapping(value = "editForm/{OTId}", method = RequestMethod.GET)
    public String userEdit(ModelMap model, @PathVariable String OTId, @RequestParam(value="empId", required = true) String empId) {
        OverTime overtimeForm = (OverTime) overtimeManager.get(OTId);
        model.addAttribute("id", overtimeForm.getId());
        model.addAttribute("userInfo", userInfo);
        model.put("action", "update");
        model.put("overtimeForm", overtimeForm);
        model.addAttribute("empId", empId);
        OverTime overtimeList = overtimeManager.get(empId);
        model.put("overtimeList", overtimeList);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        return "supplement/overtime/overtime_form";
    }
    
    @RequestMapping(value = "editForm/update", method = RequestMethod.POST)
    public String userUpdate(@ModelAttribute("overtimeForm") OverTimeForm OTForm, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = OTForm.getEmpId();
        overtimeManager.update(OTForm);
        response.sendRedirect("../../../main/overtime?empId="+empId);
        return null;
    }
    
    @RequestMapping(value = "delete/{OTId}", method = RequestMethod.GET)
    public String userDelete(ModelMap model, HttpServletResponse response, @PathVariable String OTId, @RequestParam(value="empId", required = true) String empId) throws IOException {
        overtimeManager.delete(OTId);
        response.sendRedirect("../../../main/overtime?empId="+empId);
        return null;
    }
}
