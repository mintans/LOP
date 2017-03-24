package th.co.entronica.mjolnir.controller.supplement;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
import th.co.entronica.mjolnir.model.db.OverTime;
import th.co.entronica.mjolnir.model.db.Payment;
import th.co.entronica.mjolnir.model.db.Position;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.LeaveForm;
import th.co.entronica.mjolnir.model.form.OverTimeForm;
import th.co.entronica.mjolnir.model.form.PaymentForm;
import th.co.entronica.mjolnir.model.manage.LeaderManager;
import th.co.entronica.mjolnir.model.manage.LeaveManager;
import th.co.entronica.mjolnir.model.manage.OverTimeManager;
import th.co.entronica.mjolnir.model.manage.PaymentManager;
import th.co.entronica.mjolnir.model.manage.PositionManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping(value = "/supplement")
public class SupplementController {
    
    @Autowired
    private UserInfo userInfo;

    @Autowired
    private OverTimeManager overtimeManager;
    
    @Autowired
    private ProfileManager profileManager;
    
    @Autowired
    private LeaderManager leaderManager;
    
    @Autowired
    private LeaveManager leavemanager;
    
    @Autowired
    private PaymentManager paymentManager;
    
    @Autowired
    private PositionManager positionManager;
    
    @Autowired
    private UserManager userManager;
    
    @Autowired
    private TransferManager transferManager;
    
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model, @RequestParam(value="empId", required = false) String empId, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.sendRedirect("../main/supplement/overtime");
        return null;
    }
    
    //========================================OverTime================================================
    
    @RequestMapping(value = "overtime", method = RequestMethod.GET)
    public String ShowOverTime(ModelMap model, @RequestParam(value="empId", required = false) String empId) {
        List<Profile> profileList = profileManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formSupplement", "supplement");
        model.put("profileList", profileList);
        model.addAttribute("empId", empId);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        List<OverTime> overtimeList = overtimeManager.getAll();
        model.put("overtimeList", overtimeList);
        List<Position> positionList = positionManager.getAll();
        model.put("positionList", positionList);
        List<Transfer> transferList = transferManager.getAll();
        model.put("transferList", transferList);
        List<User> userList = userManager.getAll();
        model.put("userList", userList);
        return "supplement/overtime/overtime";
    }
       
    @RequestMapping(value = "overtime/addForm", method = RequestMethod.GET)
    public String useraddFormOverTime(ModelMap model, @RequestParam(value="empId", required = true) String empId) {
        OverTimeForm overtimeForm = new OverTimeForm();
        model.addAttribute("userInfo", userInfo);
        model.put("action", "save");
        model.put("overtimeForm", overtimeForm);
        model.addAttribute("empId", empId);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        return "supplement/overtime/overtime_form";
    }
    
    @RequestMapping(value = "overtime/save", method = RequestMethod.POST)
    public String saveOT(@ModelAttribute("overtimeForm") OverTimeForm OTForm, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = OTForm.getEmpId();
        overtimeManager.save(OTForm);
        response.sendRedirect("../../main/supplement/overtime?empId="+empId);
        return null;
    }
    
    @RequestMapping(value = "overtime/editForm/{OTId}", method = RequestMethod.GET)
    public String userEditOverTime(ModelMap model, @PathVariable String OTId, @RequestParam(value="empId", required = true) String empId) {
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
    
    @RequestMapping(value = "overtime/editForm/update", method = RequestMethod.POST)
    public String userUpdateOverTime(@ModelAttribute("overtimeForm") OverTimeForm OTForm, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = OTForm.getEmpId();
        overtimeManager.update(OTForm);
        response.sendRedirect("../../../main/supplement/overtime?empId="+empId);
        return null;
    }
    
    @RequestMapping(value = "overtime/delete/{OTId}", method = RequestMethod.GET)
    public String userDeleteOverTime(ModelMap model, HttpServletResponse response, @PathVariable String OTId, @RequestParam(value="empId", required = true) String empId) throws IOException {
        overtimeManager.delete(OTId);
        response.sendRedirect("../../../main/supplement/overtime?empId="+empId);
        return null;
    }
    
    //================================================================================================
    
    //========================================Leave================================================
    @RequestMapping(value = "leave", method = RequestMethod.GET)
    public String ShowLeave(ModelMap model, @RequestParam(value="empId", required = false) String empId, @RequestParam(value="start", required = false) String start) {
        List<Profile> profileList = profileManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formSupplement", "supplement");
        model.put("profileList", profileList);
        model.addAttribute("empId", empId);
        model.addAttribute("start", start);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        List<Leave> leaveList = leavemanager.getAll();
        model.put("leaveList", leaveList);
        List<Position> positionList = positionManager.getAll();
        model.put("positionList", positionList);
        List<Transfer> transferList = transferManager.getAll();
        model.put("transferList", transferList);
        List<User> userList = userManager.getAll();
        model.put("userList", userList);
        
        return "supplement/leave/leave_of_absence";
    }
    
    @RequestMapping(value = "leave/addForm", method = RequestMethod.GET)
    public String useraddFormLeave(ModelMap model, @RequestParam(value="empId", required = true) String empId, @RequestParam(value="start", required = true) String start) {
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
    
    @RequestMapping(value = "leave/save", method = RequestMethod.POST)
    public String saveLeave(@ModelAttribute("leaveForm")LeaveForm leaveForm, @ModelAttribute("sw") String start, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = leaveForm.getEmpId();
        leavemanager.save(leaveForm);
        response.sendRedirect("../../main/supplement/leave?empId="+empId+"&start="+start);
        return null;
    }
    
    @RequestMapping(value = "leave/editForm/{LeaveID}", method = RequestMethod.GET)
    public String userEditLeave(ModelMap model, @PathVariable String LeaveID, @RequestParam("empId") String empId, @RequestParam("start") String start) {
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
    
    @RequestMapping(value = "leave/editForm/update", method = RequestMethod.POST)
    public String userUpdateLeave(@ModelAttribute("leaveForm") LeaveForm leaveForm, @ModelAttribute("sw") String start, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = leaveForm.getEmpId();
        leavemanager.update(leaveForm);
        response.sendRedirect("../../../main/supplement/leave?empId="+empId+"&start="+start);
        return null;
    }
    
    @RequestMapping(value = "leave/delete/{LeaveID}", method = RequestMethod.GET)
    public String userDeleteLeave(ModelMap model, HttpServletResponse response, @PathVariable String LeaveID, @RequestParam(value="empId", required = true) String empId, @RequestParam(value="start", required = true) String start) throws IOException {
        leavemanager.delete(LeaveID);

        response.sendRedirect("../../../main/supplement/leave?empId="+empId+"&start="+start);
        return null;
    }
    
    //================================================================================================
    
    
    //========================================Payment================================================
    @RequestMapping(value = "payment", method = RequestMethod.GET)
    public String ShowPayment(ModelMap model, @RequestParam(value="empId", required = false) String empId) {
        List<Profile> profileList = profileManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formSupplement", "supplement");
        model.put("profileList", profileList);
        model.addAttribute("empId", empId);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        List<Payment> paymentList = paymentManager.getAll();
        model.put("paymentList", paymentList);
        List<Position> positionList = positionManager.getAll();
        model.put("positionList", positionList);
        List<Transfer> transferList = transferManager.getAll();
        model.put("transferList", transferList);
        List<User> userList = userManager.getAll();
        model.put("userList", userList);
        return "supplement/payment/payment";
    }
    
    @RequestMapping(value = "payment/addForm", method = RequestMethod.GET)
    public String useraddFormPayment(ModelMap model, @RequestParam(value="empId", required = true) String empId) {
        PaymentForm paymentForm = new PaymentForm();
        model.addAttribute("userInfo", userInfo);
        model.put("action", "save");
        model.put("paymentForm", paymentForm);
        model.addAttribute("empId", empId);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        return "supplement/payment/payment_form";
    }
    
    @RequestMapping(value = "payment/save", method = RequestMethod.POST)
    public String saveOTPayment(@ModelAttribute("paymentForm") PaymentForm paymentForm, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = paymentForm.getEmpId();
        paymentManager.save(paymentForm);
        response.sendRedirect("../../main/supplement/payment?empId="+empId);
        return null;
    }
    
    @RequestMapping(value = "payment/editForm/{paymentId}", method = RequestMethod.GET)
    public String userEditPayment(ModelMap model, @PathVariable String paymentId, @RequestParam(value="empId", required = true) String empId) {
        Payment paymentForm = (Payment) paymentManager.get(paymentId);
        model.addAttribute("id", paymentForm.getId());
        model.addAttribute("userInfo", userInfo);
        model.put("action", "update");
        model.put("paymentForm", paymentForm);
        model.addAttribute("empId", empId);
        Payment paymentList = paymentManager.get(empId);
        model.put("paymentList", paymentList);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        return "supplement/payment/payment_form";
    }
    
    @RequestMapping(value = "payment/editForm/update", method = RequestMethod.POST)
    public String userUpdatePayment(@ModelAttribute("paymentForm") PaymentForm paymentForm, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = paymentForm.getEmpId();
        paymentManager.update(paymentForm);
        response.sendRedirect("../../../main/supplement/payment?empId="+empId);
        return null;
    }
    
    @RequestMapping(value = "payment/delete/{paymentId}", method = RequestMethod.GET)
    public String userDeletePayment(ModelMap model, HttpServletResponse response, @PathVariable String paymentId, @RequestParam(value="empId", required = true) String empId) throws IOException {
        paymentManager.delete(paymentId);

        response.sendRedirect("../../../main/supplement/payment?empId="+empId);
        return null;
    }
    
    //================================================================================================
}
