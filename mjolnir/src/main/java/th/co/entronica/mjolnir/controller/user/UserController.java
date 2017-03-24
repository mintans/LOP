package th.co.entronica.mjolnir.controller.user;

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
import th.co.entronica.mjolnir.model.db.ChangeForm;
import th.co.entronica.mjolnir.model.db.Departments;
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.db.EmploymentType;
import th.co.entronica.mjolnir.model.db.Position;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.UserForm;
import th.co.entronica.mjolnir.model.manage.DepartmentManager;
import th.co.entronica.mjolnir.model.manage.EmploymentManager;
import th.co.entronica.mjolnir.model.manage.EmploymentTypeManager;
import th.co.entronica.mjolnir.model.manage.PositionManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Pop
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserInfo userInfo;

    @Autowired
    private UserManager userManager;

    @Autowired
    private DepartmentManager departmentManager;

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private EmploymentTypeManager employmentTypeManager;

    @Autowired
    private PositionManager positionManager;

    @Autowired
    private EmploymentManager employmentManager;

    @Autowired
    private TransferManager transferManager;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        List<User> userList = userManager.getAll();
        model.put("userList", userList);

        List<Profile> profileList = profileManager.getAll();
        model.put("profileList", profileList);

        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");

        return "user/user";
    }

    @RequestMapping(value = "addForm", method = RequestMethod.GET)
    public String useraddForm(ModelMap model) {

        List<Departments> departmentsList = departmentManager.getAll();
        model.put("departmentsList", departmentsList);

        List<EmploymentType> employmentTypeList = employmentTypeManager.getAll();
        model.put("employmentTypeList", employmentTypeList);

        List<Position> positionList = positionManager.getAll();
        model.put("positionList", positionList);

        UserForm userForm = new UserForm();
        List<User> userList = userManager.getAll();
        for (User userList1 : userList) {
            model.put("userList", userList1.getId());
        }
        
        model.addAttribute("userInfo", userInfo);
        model.put("formUser", "user");
        model.put("formtype", "add");
        model.put("action", "save");
        model.put("userForm", userForm);
        return "user/user_add_update";
    }

    @RequestMapping(value = "editForm/{userId}", method = RequestMethod.GET)
    public String userEdit(ModelMap model, @PathVariable String userId) {
        List<Departments> departmentsList = departmentManager.getAll();
        model.put("departmentsList", departmentsList);

        List<EmploymentType> employmentTypeList = employmentTypeManager.getAll();
        model.put("employmentTypeList", employmentTypeList);

        List<User> userList = userManager.getAll();
        model.put("userList", userList);

        List<Position> positionList = positionManager.getAll();
        model.put("positionList", positionList);

        User userForm = (User) userManager.get(userId);

        List<Employment> employmentList = employmentManager.getAll();
        model.addAttribute("employmentList", employmentList);

        for (Employment employ : employmentList) {
            if (userId.equals(employ.getProfileId())) {
                model.addAttribute("employmentTypeUsed", employ.getType());
                model.addAttribute("dulationUsed", employ.getDulation());
            }
        }

        List<Transfer> transferList = transferManager.getAll();
        for (Transfer transfer : transferList) {
            if (userId.equals(transfer.getProfileId())) {
                model.addAttribute("positionUsed", transfer.getPosition());
            }
        }

        model.addAttribute("id", userForm.getId());
        model.addAttribute("departmentUsed", userForm.getDepartmentName());
        model.addAttribute("userInfo", userInfo);
        model.put("formUser", "user");
        model.put("formtype", "edit");
        model.put("action", "update");
        model.put("userForm", userForm);
        return "user/user_add_update";
    }

    @RequestMapping(value = "editForm/update", method = RequestMethod.POST)
    public String userUpdate(@ModelAttribute("userForm") UserForm userForm, ModelMap model, HttpServletResponse response) throws IOException {

        User userTemp = userManager.update(userForm);
        response.sendRedirect("../../../main/user");
        return null;
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String userSave(@ModelAttribute("userForm") UserForm userForm, ModelMap model, HttpServletResponse response) throws IOException {

        User userTemp = userManager.save(userForm);

        response.sendRedirect("../../main/user");
        return null;
    }

    @RequestMapping(value = "delete/{userId}", method = RequestMethod.GET)
    public String userDelete(ModelMap model, HttpServletResponse response, @PathVariable String userId) throws IOException {

        userManager.delete(userId);
        response.sendRedirect("../../../main/user");
        return null;
    }

    @RequestMapping(value = "deleteDepartMember/{userId}", method = RequestMethod.GET)
    public String deleteDepartMember(ModelMap model, HttpServletResponse response, @PathVariable String userId) throws IOException {

        userManager.deleteDepartMember(userId);
        response.sendRedirect("../../../main/departments");
        return null;
    }

    @RequestMapping(value = "changeDepartment", method = RequestMethod.POST)
    public String changeDepartment(@ModelAttribute("changeForm") ChangeForm changeForm, ModelMap model, HttpServletResponse response) throws IOException {

        userManager.changeDepart(changeForm);
        response.sendRedirect("../../main/departments");
        return null;
    }
}
