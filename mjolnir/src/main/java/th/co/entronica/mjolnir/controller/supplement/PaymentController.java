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
import th.co.entronica.mjolnir.model.db.Payment;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.form.OverTimeForm;
import th.co.entronica.mjolnir.model.form.PaymentForm;
import th.co.entronica.mjolnir.model.manage.LeaderManager;
import th.co.entronica.mjolnir.model.manage.PaymentManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Gam
 */
@Controller
@RequestMapping("/payment")
public class PaymentController {
        
    @Autowired
    private UserInfo userInfo;
        
    @Autowired
    private ProfileManager profileManager;
            
    @Autowired
    private PaymentManager paymentManager;
    
    @Autowired
    private LeaderManager leaderManager;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model, @RequestParam(value="empId", required = false) String empId) {
        List<Profile> profileList = profileManager.getAll();
        model.addAttribute("userInfo", userInfo);
//        model.put("formhome", "home");
        model.put("formPayment", "payment");
        model.put("profileList", profileList);
        model.addAttribute("empId", empId);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        List<Payment> paymentList = paymentManager.getAll();
        model.put("paymentList", paymentList);
        return "supplement/payment/payment";
    }
    
    @RequestMapping(value = "addForm", method = RequestMethod.GET)
    public String useraddForm(ModelMap model, @RequestParam(value="empId", required = true) String empId) {
        PaymentForm paymentForm = new PaymentForm();
        model.addAttribute("userInfo", userInfo);
        model.put("action", "save");
        model.put("paymentForm", paymentForm);
        model.addAttribute("empId", empId);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        return "supplement/payment/payment_form";
    }
    
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String saveOT(@ModelAttribute("paymentForm") PaymentForm paymentForm, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = paymentForm.getEmpId();
        paymentManager.save(paymentForm);
        response.sendRedirect("../../main/payment?empId="+empId);
        return null;
    }
    
    @RequestMapping(value = "editForm/{paymentId}", method = RequestMethod.GET)
    public String userEdit(ModelMap model, @PathVariable String paymentId, @RequestParam(value="empId", required = true) String empId) {
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
    
    @RequestMapping(value = "editForm/update", method = RequestMethod.POST)
    public String userUpdate(@ModelAttribute("paymentForm") PaymentForm paymentForm, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = paymentForm.getEmpId();
        paymentManager.update(paymentForm);
        response.sendRedirect("../../../main/payment?empId="+empId);
        return null;
    }
    
    @RequestMapping(value = "delete/{paymentId}", method = RequestMethod.GET)
    public String userDelete(ModelMap model, HttpServletResponse response, @PathVariable String paymentId, @RequestParam(value="empId", required = true) String empId) throws IOException {
        paymentManager.delete(paymentId);

        response.sendRedirect("../../../main/payment?empId="+empId);
        return null;
    }
}
