
package th.co.entronica.mjolnir.controller.benefits;

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
import th.co.entronica.mjolnir.model.db.Benefits;
import th.co.entronica.mjolnir.model.db.EmploymentChangeBenefits;
import th.co.entronica.mjolnir.model.db.EmploymentType;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.manage.BenefitsManager;
import th.co.entronica.mjolnir.model.manage.EmploymentTypeManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping("/benefits")
public class BenefitsController {
    @Autowired
    private UserInfo userInfo;

    @Autowired
    private UserManager userManager;
    
    @Autowired
    private BenefitsManager benefitsManager;
    
    @Autowired
    private EmploymentTypeManager employmentTypeManager;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String benefits(ModelMap model) {
        List<User> userList = userManager.getAll();
        model.addAttribute("userInfo", userInfo);
        List<Benefits> benefitsList = benefitsManager.getAll();
        model.put("benefitsList", benefitsList);
        List<EmploymentType> employmentTypeList = employmentTypeManager.getAll();
        model.put("employmentTypeList", employmentTypeList);
        
        model.put("formBenefits", "benefits");
        model.put("userList", userList);
        return "benefits/benefits";
    }
    
    @RequestMapping(value = "addBenefits", method = RequestMethod.POST)
    public String addBenefits(@ModelAttribute Benefits benefits,ModelMap model,HttpServletResponse response, HttpServletRequest request) throws IOException {
        
        benefitsManager.save(benefits);
        response.sendRedirect("../../main/benefits");
        return null;
        
    }
    @RequestMapping(value = "delete/{benefitsID}", method = RequestMethod.GET)
    public String DepartmentDelete(ModelMap model, @PathVariable String benefitsID, HttpServletResponse response) throws IOException {

        benefitsManager.delete(benefitsID);
        response.sendRedirect("../../../main/benefits");
        return null;
    }
    
    @RequestMapping(value = "addEmploymentType", method = RequestMethod.POST)
    public String addEmploymentType(@ModelAttribute EmploymentType employmentType,ModelMap model,HttpServletResponse response, HttpServletRequest request) throws IOException {
        
        employmentTypeManager.save(employmentType);
        response.sendRedirect("../../main/benefits");
        return null;
    }
    @RequestMapping(value = "deleteEmploymentType/{employmentTypeID}", method = RequestMethod.GET)
    public String employmentTypeDelete(ModelMap model, @PathVariable String employmentTypeID, HttpServletResponse response) throws IOException {

        employmentTypeManager.delete(employmentTypeID);
        response.sendRedirect("../../../main/benefits");
        return null;
    }
    
    @RequestMapping(value = "changeEmployment", method = RequestMethod.POST)
    public String changeDepartment(@ModelAttribute("employmentChangeBenefits") EmploymentChangeBenefits employmentChangeBenefits,ModelMap model, HttpServletResponse response) throws IOException {
       
        employmentTypeManager.changeBenefits(employmentChangeBenefits);
        response.sendRedirect("../../main/benefits");
        return null;
    } 
}
