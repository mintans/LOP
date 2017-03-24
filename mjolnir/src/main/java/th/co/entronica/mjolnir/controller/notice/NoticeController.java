/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.notice;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.model.db.Leave;
import th.co.entronica.mjolnir.model.db.OverTime;
import th.co.entronica.mjolnir.model.db.Payment;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.manage.LeaveManager;
import th.co.entronica.mjolnir.model.manage.OverTimeManager;
import th.co.entronica.mjolnir.model.manage.PaymentManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private UserInfo userInfo;

    @Autowired
    private UserManager userManager;
    
    @Autowired
    private LeaveManager leaveManager;
    
    @Autowired
    private OverTimeManager overtimeManager;
    
    @Autowired
    private PaymentManager paymentManager;
    
    @Autowired
    private ProfileManager profileManager;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        model.addAttribute("userInfo", userInfo);
        model.put("formNotice", "notice");
        List<OverTime> overtimeList = overtimeManager.getAll();
        model.put("overtimeList", overtimeList);
        List<Profile> profileList = profileManager.getAll();
        model.put("profileList", profileList);
        return "notice/notice_overtime";
    }
    
    @RequestMapping(value = "leave", method = RequestMethod.GET)
    public String Showleave(ModelMap model) {
        model.addAttribute("userInfo", userInfo);
        model.put("formNotice", "notice");
        List<Leave> leaveList = leaveManager.getAll();
        model.put("leaveList", leaveList);
        List<Profile> profileList = profileManager.getAll();
        model.put("profileList", profileList);
        return "notice/notice_leave";
    }
    
    @RequestMapping(value = "payment", method = RequestMethod.GET)
    public String Showpayment(ModelMap model) {
        model.addAttribute("userInfo", userInfo);
        model.put("formNotice", "notice");
         List<Payment> paymentList = paymentManager.getAll();
        model.put("paymentList", paymentList);
        List<Profile> profileList = profileManager.getAll();
        model.put("profileList", profileList);
        return "notice/notice_payment";
    }
}
