/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.home;

import com.mongodb.gridfs.GridFSDBFile;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import th.co.entronica.mjolnir.model.db.CompanyInformation;
import th.co.entronica.mjolnir.model.db.DepartmentInformation;
import th.co.entronica.mjolnir.model.db.Leader;
import th.co.entronica.mjolnir.model.db.Leave;
import th.co.entronica.mjolnir.model.db.Member;
import th.co.entronica.mjolnir.model.db.OverTime;
import th.co.entronica.mjolnir.model.db.Payment;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Team;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.LeaveForm;
import th.co.entronica.mjolnir.model.form.LoginForm;
import th.co.entronica.mjolnir.model.form.OverTimeForm;
import th.co.entronica.mjolnir.model.form.PaymentForm;
import th.co.entronica.mjolnir.model.form.UserForm;
import th.co.entronica.mjolnir.model.manage.CompanyInformationManager;
import th.co.entronica.mjolnir.model.manage.DepartmentInformationManager;
import th.co.entronica.mjolnir.model.manage.LeaderManager;
import th.co.entronica.mjolnir.model.manage.LeaveManager;
import th.co.entronica.mjolnir.model.manage.MemberManager;
import th.co.entronica.mjolnir.model.manage.OverTimeManager;
import th.co.entronica.mjolnir.model.manage.PaymentManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TeamManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Pop
 */
@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    private UserInfo userInfo;

    @Autowired
    private UserManager userManager;

    @Autowired
    private OverTimeManager overtimeManager;

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private PaymentManager paymentManager;

    @Autowired
    private LeaveManager leaveManager;

    @Autowired
    private LeaderManager leaderManager;

    @Autowired
    private MemberManager memberManager;

    @Autowired
    private TeamManager teamManager;

    @Autowired
    private CompanyInformationManager companyInformationManager;

    @Autowired
    private DepartmentInformationManager departmentInformationManager;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap model) {

        return home(model);
    }

    @RequestMapping(value = "header", method = RequestMethod.GET)
    public String getHeader(ModelMap model) {

        model.addAttribute("userInfo", userInfo);
        return "header";
    }

    @RequestMapping(value = "header_html", method = RequestMethod.GET)
    public String getHeaderHtml(ModelMap model) {

        return "header_html";
    }

    @RequestMapping(value = "home", method = RequestMethod.GET)
    public String home(ModelMap model) {
        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        List<Profile> profileList = profileManager.getAll();
        model.put("profileList", profileList);
        List<OverTime> overtimeList = overtimeManager.getAll();
        model.put("overtimeList", overtimeList);
        List<Payment> paymentList = paymentManager.getAll();
        model.put("paymentList", paymentList);
        List<Leave> leaveList = leaveManager.getAll();
        model.put("leaveList", leaveList);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        List<Member> memberList = memberManager.getAll();
        model.put("memberList", memberList);
        List<Team> teamList = teamManager.getAll();
        model.put("teamList", teamList);

        List<CompanyInformation> companyInformationList = companyInformationManager.getAll();
        Collections.reverse(companyInformationList);

        Iterator itr = companyInformationList.iterator();
        int i = 0;
        while (itr.hasNext()) {
            Object element = itr.next();
            if (i > 2) {
                itr.remove();
            }
            i++;
        }

        model.put("CompanyInformationList", companyInformationList);

        List<DepartmentInformation> departmentsInformationList = departmentInformationManager.getAll();
        Collections.reverse(departmentsInformationList);

        Iterator itr2 = departmentsInformationList.iterator();
        int j = 0;
        while (itr2.hasNext()) {

            Object element = itr2.next();
            if (j > 2) {

                itr2.remove();
            }
            j++;
        }

        model.put("DepartmentsInformationList", departmentsInformationList);

        return "home/index";
    }

    @RequestMapping(value = "login-form", method = RequestMethod.GET)
    public String loginForm(ModelMap model) throws IOException {

        model.put("loginForm", new LoginForm());
        model.addAttribute("userInfo", userInfo);
//        response.sendRedirect("../main/home");
        return "home/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(ModelMap model, @ModelAttribute("loginForm") LoginForm loginForm, HttpServletResponse response, HttpServletRequest request) throws IOException {

        User user = userManager.checkLogin(loginForm);

        if (user == null) {

//            return login(model, loginForm, response, request);
            userInfo.setLogin(false);
            model.put("errorMsg", "Username or password is invalid.");
//            response.sendRedirect("../main/login-form");
            return loginForm(model);
        }
        HttpSession session = request.getSession();
        session.setAttribute("status", loginForm.getUsername());
        userInfo.setLogin(true);
        userInfo.setUser(user);
        model.addAttribute("userInfo", userInfo);
        model.put("loginForm", new LoginForm());
        response.sendRedirect("../main/home");
        return null;
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(ModelMap model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
        session = request.getSession();
        session.setAttribute("status", null);
        userInfo.setLogin(false);
        model.addAttribute("userInfo", userInfo);
        response.sendRedirect("../main/home");
        return null;
    }

    @RequestMapping(value = "adminAllowOT/{OTId}", method = RequestMethod.GET)
    public String adminAllow(@PathVariable String OTId, ModelMap model, HttpServletResponse response) throws IOException {
        OverTimeForm OTForm = OT(OTId);
        OTForm.setStatus(2);
        OTForm.setLeader(true);
        OTForm.setAdmin1(true);
        OTForm.setManager(false);
        OTForm.setAdmin2(false);
        overtimeManager.update(OTForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "adminApproveOT/{OTId}", method = RequestMethod.GET)
    public String adminApprove(@PathVariable String OTId, ModelMap model, HttpServletResponse response) throws IOException {
        OverTimeForm OTForm = OT(OTId);
        OTForm.setStatus(4);
        OTForm.setLeader(true);
        OTForm.setAdmin1(true);
        OTForm.setManager(true);
        OTForm.setAdmin2(true);
        overtimeManager.update(OTForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "managerApproveOT/{OTId}", method = RequestMethod.GET)
    public String managerApprove(@PathVariable String OTId, ModelMap model, HttpServletResponse response) throws IOException {
        OverTimeForm OTForm = OT(OTId);
        OTForm.setStatus(3);
        OTForm.setLeader(true);
        OTForm.setAdmin1(true);
        OTForm.setManager(true);
        OTForm.setAdmin2(false);
        overtimeManager.update(OTForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "leaderAllowOT/{OTId}", method = RequestMethod.GET)
    public String leaderAllow(@PathVariable String OTId, ModelMap model, HttpServletResponse response) throws IOException {
        OverTimeForm OTForm = OT(OTId);
        OTForm.setStatus(1);
        OTForm.setLeader(true);
        OTForm.setAdmin1(false);
        OTForm.setManager(false);
        OTForm.setAdmin2(false);
        overtimeManager.update(OTForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "RejectOT/{OTId}", method = RequestMethod.GET)
    public String Reject(@PathVariable String OTId, ModelMap model, HttpServletResponse response) throws IOException {
        OverTimeForm OTForm = OT(OTId);
        OTForm.setStatus(5);
        OTForm.setLeader(false);
        OTForm.setAdmin1(false);
        OTForm.setManager(false);
        OTForm.setAdmin2(false);
        overtimeManager.update(OTForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "adminAllowPayment/{paymentId}", method = RequestMethod.GET)
    public String adminAllowPayment(@PathVariable String paymentId, ModelMap model, HttpServletResponse response) throws IOException {
        PaymentForm paymentForm = payment(paymentId);
        paymentForm.setStatus(2);
        paymentForm.setLeader(true);
        paymentForm.setAdmin1(true);
        paymentForm.setManager(false);
        paymentForm.setAdmin2(false);
        paymentManager.update(paymentForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "adminApprovePayment/{paymentId}", method = RequestMethod.GET)
    public String adminApprovePayment(@PathVariable String paymentId, ModelMap model, HttpServletResponse response) throws IOException {
        PaymentForm paymentForm = payment(paymentId);
        paymentForm.setStatus(4);
        paymentForm.setLeader(true);
        paymentForm.setAdmin1(true);
        paymentForm.setManager(true);
        paymentForm.setAdmin2(true);
        paymentManager.update(paymentForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "managerApprovePayment/{paymentId}", method = RequestMethod.GET)
    public String managerApprovePayment(@PathVariable String paymentId, ModelMap model, HttpServletResponse response) throws IOException {
        PaymentForm paymentForm = payment(paymentId);
        paymentForm.setStatus(3);
        paymentForm.setLeader(true);
        paymentForm.setAdmin1(true);
        paymentForm.setManager(true);
        paymentForm.setAdmin2(false);
        paymentManager.update(paymentForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "leaderAllowPayment/{paymentId}", method = RequestMethod.GET)
    public String leaderAllowPayment(@PathVariable String paymentId, ModelMap model, HttpServletResponse response) throws IOException {
        PaymentForm paymentForm = payment(paymentId);
        paymentForm.setStatus(1);
        paymentForm.setLeader(true);
        paymentForm.setAdmin1(false);
        paymentForm.setManager(false);
        paymentForm.setAdmin2(false);
        paymentManager.update(paymentForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "RejectPayment/{paymentId}", method = RequestMethod.GET)
    public String RejectPayment(@PathVariable String paymentId, ModelMap model, HttpServletResponse response) throws IOException {
        PaymentForm paymentForm = payment(paymentId);
        paymentForm.setStatus(5);
        paymentForm.setLeader(false);
        paymentForm.setAdmin1(false);
        paymentForm.setManager(false);
        paymentForm.setAdmin2(false);
        paymentManager.update(paymentForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "adminApproveLeave/{leaveId}", method = RequestMethod.GET)
    public String adminApproveLeave(@PathVariable String leaveId, ModelMap model, HttpServletResponse response) throws IOException {
        LeaveForm leaveForm = leave(leaveId);
        leaveForm.setStatus(3);
        leaveForm.setLeader(true);
        leaveForm.setManager(true);
        leaveForm.setAdmin(true);
        leaveManager.update(leaveForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "managerApproveLeave/{leaveId}", method = RequestMethod.GET)
    public String managerApproveLeave(@PathVariable String leaveId, ModelMap model, HttpServletResponse response) throws IOException {
        LeaveForm leaveForm = leave(leaveId);
        leaveForm.setStatus(2);
        leaveForm.setLeader(true);
        leaveForm.setManager(true);
        leaveForm.setAdmin(false);
        leaveManager.update(leaveForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "leaderAllowLeave/{leaveId}", method = RequestMethod.GET)
    public String leaderAllowLeave(@PathVariable String leaveId, ModelMap model, HttpServletResponse response) throws IOException {
        LeaveForm leaveForm = leave(leaveId);
        leaveForm.setStatus(1);
        leaveForm.setLeader(true);
        leaveForm.setManager(false);
        leaveForm.setAdmin(false);
        leaveManager.update(leaveForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    @RequestMapping(value = "RejectLeave/{leaveId}", method = RequestMethod.GET)
    public String RejectLeave(@PathVariable String leaveId, ModelMap model, HttpServletResponse response) throws IOException {
        LeaveForm leaveForm = leave(leaveId);
        leaveForm.setStatus(4);
        leaveForm.setLeader(false);
        leaveForm.setManager(false);
        leaveForm.setAdmin(false);
        leaveManager.update(leaveForm);
        response.sendRedirect("../../main/home");
        return null;
    }

    public OverTimeForm OT(String OTId) {
        OverTime overtimeForm = (OverTime) overtimeManager.get(OTId);
        OverTimeForm OTForm = new OverTimeForm();
        OTForm.setId(OTId);
        OTForm.setEmpId(overtimeForm.getEmpId());
        OTForm.setFullDate(overtimeForm.getFullDate());
        OTForm.setDayName(overtimeForm.getDayName());
        OTForm.setYear(overtimeForm.getYear());
        OTForm.setMonth(overtimeForm.getMonth());
        OTForm.setDate(overtimeForm.getDate());
        OTForm.setTimeIn(overtimeForm.getTimeIn());
        OTForm.setTimeOut(overtimeForm.getTimeOut());
        OTForm.setTotal(overtimeForm.getTotal());
        OTForm.setDescription(overtimeForm.getDescription());
        OTForm.setRemark(overtimeForm.getRemark());
        return OTForm;
    }

    public PaymentForm payment(String id) {
        Payment payment = (Payment) paymentManager.get(id);
        PaymentForm paymentForm = new PaymentForm();
        paymentForm.setId(payment.getId());
        paymentForm.setEmpId(payment.getEmpId());
        paymentForm.setReceiptNo(payment.getReceiptNo());
        paymentForm.setFullDate(payment.getFullDate());
        paymentForm.setDate(payment.getDate());
        paymentForm.setDescription(payment.getDescription());
        paymentForm.setAmount(payment.getAmount());
        return paymentForm;
    }

    public LeaveForm leave(String id) {
        LeaveForm leaveForm = new LeaveForm();
        Leave leave = (Leave) leaveManager.get(id);
        leaveForm.setId(id);
        leaveForm.setEmpId(leave.getEmpId());
        leaveForm.setDate(leave.getDate());
        leaveForm.setDate2(leave.getDate2());
        leaveForm.setFrom(leave.getFrom());
        leaveForm.setFrom2(leave.getFrom2());
        leaveForm.setTo(leave.getTo());
        leaveForm.setTo2(leave.getTo2());
        leaveForm.setTotal(leave.getTotal());
        leaveForm.setType(leave.getType());
        leaveForm.setDescription(leave.getDescription());
        return leaveForm;
    }

    @RequestMapping(value = "changePasswordForm", method = RequestMethod.GET)
    public String changePasswordForm(ModelMap model) throws IOException {
        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        model.put("userForm", new UserForm());
        return "home/changePassword";
    }

    @RequestMapping(value = "changePassword", method = RequestMethod.POST)
    public String changePassword(@ModelAttribute UserForm userForm, ModelMap model, HttpServletResponse response) throws IOException {
        model.addAttribute("userInfo", userInfo);
        User userChangePWD = userManager.changePassword(userForm, userInfo.getUser());
        if (userChangePWD == null) {
            model.put("formhome", "home");
            model.put("userForm", new UserForm());
            response.sendRedirect("../main/changePasswordForm");
            return null;
        } else {
            model.put("formhome", "home");
            model.put("userForm", new UserForm());
            response.sendRedirect("../main/home");
            return null;
        }
    }

    @RequestMapping(value = "getPhoto/{imgId}", method = RequestMethod.GET)
    public @ResponseBody
    void getPhoto(HttpServletRequest request, HttpServletResponse response, @PathVariable String imgId) {
        try {
            GridFSDBFile imageForOutput = companyInformationManager.getByFilename(imgId);
            InputStream is = imageForOutput.getInputStream();
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            int nRead;
            byte[] data = new byte[16384];
            while ((nRead = is.read(data, 0, data.length)) != -1) {
                buffer.write(data, 0, nRead);
            }
            buffer.flush();
            byte[] imagenEnBytes = buffer.toByteArray();

            response.setHeader("Accept-ranges", "bytes");
            response.setContentType("image/jpeg");
            response.setContentLength(imagenEnBytes.length);
            response.setHeader("Expires", "0");
            response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
            response.setHeader("Content-Description", "File Transfer");
            response.setHeader("Content-Transfer-Encoding:", "binary");

            OutputStream out = response.getOutputStream();
            out.write(imagenEnBytes);
            out.flush();
            out.close();
        } catch (Exception e) {
        }
    }

    @RequestMapping(value = "showdetails/{newInfoID}", method = RequestMethod.GET)
    public String ShowCompanyInfo(ModelMap model, @PathVariable String newInfoID, HttpServletResponse response) throws IOException {

        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        List<CompanyInformation> CompanyInformationList = companyInformationManager.getAll();
        model.put("CompanyInformationList", CompanyInformationList);

        List<DepartmentInformation> departmentsInformationList = departmentInformationManager.getAll();
        model.put("departmentsInformationList", departmentsInformationList);

        CompanyInformation companyInfoForm = (CompanyInformation) companyInformationManager.get(newInfoID);
        DepartmentInformation departmentInfoForm = (DepartmentInformation) departmentInformationManager.get(newInfoID);
        if (companyInfoForm == null) {

            model.addAttribute("companyInfoID", null);
            model.addAttribute("departmentInfoID", departmentInfoForm.getId());
        }
        else if (departmentInfoForm == null) {
            model.addAttribute("companyInfoID", companyInfoForm.getId());
            model.addAttribute("departmentInfoID", null);

        }
        return "home/newInfo_showDetails";
    }
    
    @RequestMapping(value = "showdetailsDepartment/{DepartInfoID}", method = RequestMethod.GET)
    public String showdetailsDepartment(ModelMap model, @PathVariable String DepartInfoID, HttpServletResponse response) throws IOException {

        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        
        List<DepartmentInformation> departmentsInformationList = departmentInformationManager.getAll();
        model.put("departmentsInformationList", departmentsInformationList);

        DepartmentInformation departmentInfoForm = (DepartmentInformation) departmentInformationManager.get(DepartInfoID);
        model.addAttribute("departmentInfoID", departmentInfoForm.getId());
        
        return "home/departmentInfoDetails_InAdmin";
    }
    
    @RequestMapping(value = "about", method = RequestMethod.GET)
    public String about(ModelMap model) {
        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        return "home/about";
    }

}
