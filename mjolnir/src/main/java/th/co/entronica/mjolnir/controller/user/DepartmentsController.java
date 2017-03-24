
package th.co.entronica.mjolnir.controller.user;

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
import th.co.entronica.mjolnir.model.db.Departments;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.manage.DepartmentManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping("/departments")
public class DepartmentsController {

    @Autowired
    private UserInfo userInfo;

    @Autowired
    private UserManager userManager;

    @Autowired
    private DepartmentManager departmentManager;

    @Autowired
    private ProfileManager profileManager;
    
    @Autowired
    private TransferManager transferManager;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Department(ModelMap model) {
        List<Departments> departmentsList = departmentManager.getAll();
        model.put("departmentsList", departmentsList);
        
        List<Departments> departmentsIDList = departmentManager.getAll();
        for (Departments departList1 : departmentsIDList) {
            model.put("departmentsIDList", departList1.getId());
        }
        
        List<User> userList = userManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formUser", "user");
        model.put("userList", userList);
        List<Profile> profileList = profileManager.getAll();
        model.put("profileList", profileList);
        List<Transfer> transferList = transferManager.getAll();
       model.put("transferList", transferList);
        return "user/view_department";
    }

    @RequestMapping(value = "addDepartment", method = RequestMethod.POST)
    public String addDepartment(@ModelAttribute Departments departments,ModelMap model,HttpServletResponse response, HttpServletRequest request) throws IOException {
        
        Departments depart = departmentManager.save(departments);
        response.sendRedirect("../../main/departments");
        return null;
        
    }
    
    
    @RequestMapping(value = "delete/{departmentsID}", method = RequestMethod.GET)
    public String DepartmentDelete(ModelMap model, @PathVariable String departmentsID, HttpServletResponse response) throws IOException {

        departmentManager.delete(departmentsID);
        response.sendRedirect("../../../main/departments");
        return null;
    }

}
