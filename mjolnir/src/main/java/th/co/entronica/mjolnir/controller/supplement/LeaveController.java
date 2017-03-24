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
import th.co.entronica.mjolnir.model.db.Leave;
import th.co.entronica.mjolnir.model.db.Position;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.form.LeaveForm;
import th.co.entronica.mjolnir.model.manage.LeaderManager;
import th.co.entronica.mjolnir.model.manage.LeaveManager;
import th.co.entronica.mjolnir.model.manage.PositionManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author beer
 */
@Controller
@RequestMapping("/leave")
public class LeaveController {
    @Autowired
    private UserInfo userInfo;
    
    @Autowired
    private ProfileManager profileManager;
    
    @Autowired
    private LeaveManager leavemanager;

    @Autowired
    private LeaderManager leaderManager;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model, @RequestParam(value="empId", required = false) String empId, @RequestParam(value="start", required = false) String start) {
        List<Profile> profileList = profileManager.getAll();
        model.addAttribute("userInfo", userInfo);
//        model.put("formhome", "home");
        model.put("formLeave", "leave");
        model.put("profileList", profileList);
        model.addAttribute("empId", empId);
        model.addAttribute("start", start);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        List<Leave> leaveList = leavemanager.getAll();
        model.put("leaveList", leaveList);
        return "supplement/leave/leave_of_absence";
    }
    
    @RequestMapping(value = "addForm", method = RequestMethod.GET)
    public String useraddForm(ModelMap model, @RequestParam(value="empId", required = true) String empId, @RequestParam(value="start", required = true) String start) {
        LeaveForm leaveForm = new LeaveForm();
        model.addAttribute("userInfo", userInfo);
        model.put("action", "save");
        model.put("leaveForm", leaveForm);
        model.addAttribute("empId", empId);
        model.addAttribute("start", start);
        model.put("sw", "start");
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        return "supplement/leave/leave_form";
    }
    
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String saveOT(@ModelAttribute("leaveForm")LeaveForm leaveForm, @ModelAttribute("sw") String start, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = leaveForm.getEmpId();
        leavemanager.save(leaveForm);
        response.sendRedirect("../../main/leave?empId="+empId+"&start="+start);
        return null;
    }
    
    @RequestMapping(value = "editForm/{LeaveID}", method = RequestMethod.GET)
    public String userEdit(ModelMap model, @PathVariable String LeaveID, @RequestParam("empId") String empId, @RequestParam("start") String start) {
        Leave leaveForm = (Leave) leavemanager.get(LeaveID);
        model.addAttribute("id", leaveForm.getId());
        model.addAttribute("userInfo", userInfo);
        model.put("action", "update");
        model.put("leaveForm", leaveForm);
        model.addAttribute("empId", empId);
        model.addAttribute("start", start);
        model.put("sw", start);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        return "supplement/leave/leave_form";
    }
    
    @RequestMapping(value = "editForm/update", method = RequestMethod.POST)
    public String userUpdate(@ModelAttribute("leaveForm") LeaveForm leaveForm, @ModelAttribute("sw") String start, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = leaveForm.getEmpId();
        leavemanager.update(leaveForm);
        response.sendRedirect("../../../main/leave?empId="+empId+"&start="+start);
        return null;
    }
    
    @RequestMapping(value = "delete/{LeaveID}", method = RequestMethod.GET)
    public String userDelete(ModelMap model, HttpServletResponse response, @PathVariable String LeaveID, @RequestParam(value="empId", required = true) String empId, @RequestParam(value="start", required = true) String start) throws IOException {
        leavemanager.delete(LeaveID);

        response.sendRedirect("../../../main/leave?empId="+empId+"&start="+start);
        return null;
    }
}
