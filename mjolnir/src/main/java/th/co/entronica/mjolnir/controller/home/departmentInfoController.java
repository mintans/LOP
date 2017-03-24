
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import th.co.entronica.mjolnir.model.db.DepartmentInformation;
import th.co.entronica.mjolnir.model.db.Departments;
import th.co.entronica.mjolnir.model.manage.DepartmentInformationManager;
import th.co.entronica.mjolnir.model.manage.DepartmentManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping("/departmentInfo")
public class departmentInfoController {
    @Autowired
    private UserInfo userInfo;

    @Autowired
    private UserManager userManager;
    
    @Autowired
    private DepartmentManager departmentManager;
    
    @Autowired
    private DepartmentInformationManager departmentInformationManager;
  
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        List<Departments> departmentsList = departmentManager.getAll();
        model.put("departmentsList", departmentsList);
        
        List<DepartmentInformation> departmentsInformationAll = departmentInformationManager.getAll();
        Collections.reverse(departmentsInformationAll);

        List<DepartmentInformation> departmentsInformationList = departmentInformationManager.getAll();
        Collections.reverse(departmentsInformationList);

        model.put("DepartmentsInformationList", departmentsInformationList);
        model.put("DepartmentsInformationAll", departmentsInformationAll);
        
        return "home/departmentInfo/departmentInfo";
    }
    @RequestMapping(value = "showdetails/{departmentInfoID}", method = RequestMethod.GET)
    public String ShowDepartment(ModelMap model, @PathVariable String departmentInfoID, HttpServletResponse response) throws IOException {

        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        List<DepartmentInformation> departmentsInformationList = departmentInformationManager.getAll();
        model.put("departmentsInformationList", departmentsInformationList);

        DepartmentInformation departmentInfoForm = (DepartmentInformation) departmentInformationManager.get(departmentInfoID);
        model.addAttribute("departmentInfoID", departmentInfoForm.getId());

        return "home/departmentInfo/departmentInfo_showDetails";
    }

    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public void uploadImage(@RequestParam("file") MultipartFile file, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        departmentInformationManager.saveImg(file);

    }
    
    @RequestMapping(value = "addDepartmentInfo", method = RequestMethod.POST)
    public String addDepartmentInfo(@ModelAttribute DepartmentInformation departmentInformation, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws IOException {

        DepartmentInformation departmentInfo = departmentInformationManager.save(departmentInformation);
        response.sendRedirect("../../main/departmentInfo");
        return null;

    }
    @RequestMapping(value = "editdepartmentInfo", method = RequestMethod.POST)
    public String editDepartmentInfo(@ModelAttribute DepartmentInformation departmentInformation, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws IOException {
            
        DepartmentInformation departmentInfo = departmentInformationManager.edit(departmentInformation);
        response.sendRedirect("../../main/departmentInfo/showdetails/" + departmentInfo.getId());
        return null;

    }

    @RequestMapping(value = "getPhoto/{imgId}", method = RequestMethod.GET)
    public @ResponseBody
    void getPhoto(HttpServletRequest request, HttpServletResponse response, @PathVariable String imgId) {
        try {
            GridFSDBFile imageForOutput = departmentInformationManager.getByFilename(imgId);
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

    @RequestMapping(value = "delete/{departmentInfoId}", method = RequestMethod.GET)
    public String departmentInfoDelete(ModelMap model, HttpServletResponse response, @PathVariable String departmentInfoId) throws IOException {

        departmentInformationManager.delete(departmentInfoId);
        response.sendRedirect("../../../main/departmentInfo");
        return null;
    }
    
    @RequestMapping(value = "clearTable", method = RequestMethod.GET)
    public String clearTable(ModelMap model, HttpServletResponse response) throws IOException {

        departmentInformationManager.clear();
        response.sendRedirect("../../../main/departmentInfo");
        return null;
    }
    
}
