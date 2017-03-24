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
import th.co.entronica.mjolnir.model.db.CompanyInformation;
import th.co.entronica.mjolnir.model.form.CompanyInfoForm;
import th.co.entronica.mjolnir.model.manage.CompanyInformationManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping("/companyInfo")
public class CompanyInfoController {

    @Autowired
    private UserInfo userInfo;

    @Autowired
    private UserManager userManager;

    @Autowired
    private CompanyInformationManager companyInformationManager;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {

        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        model.put("companyInfoForm", new CompanyInfoForm());

        List<CompanyInformation> companyInformationAll = companyInformationManager.getAll();
        Collections.reverse(companyInformationAll);

        List<CompanyInformation> companyInformationList = companyInformationManager.getAll();
        Collections.reverse(companyInformationList);

        int size = companyInformationList.size();
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
        model.put("CompanyInformationAll", companyInformationAll);

        return "home/companyInfo/companyInfo";
    }

    @RequestMapping(value = "showdetails/{companyInfoID}", method = RequestMethod.GET)
    public String ShowCompanyInfo(ModelMap model, @PathVariable String companyInfoID, HttpServletResponse response) throws IOException {

        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        List<CompanyInformation> CompanyInformationList = companyInformationManager.getAll();
        model.put("CompanyInformationList", CompanyInformationList);

        CompanyInformation companyInfoForm = (CompanyInformation) companyInformationManager.get(companyInfoID);
        model.addAttribute("companyInfoID", companyInfoForm.getId());

        return "home/companyInfo/companyInfo_showDetails";
    }

    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public void uploadImage(@RequestParam("file") MultipartFile file, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        companyInformationManager.saveImg(file);

    }
    
    @RequestMapping(value = "addcompanyInfo", method = RequestMethod.POST)
    public String addCompanyInfo(@ModelAttribute CompanyInformation companyInformation, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws IOException {

        CompanyInformation companyInfo = companyInformationManager.save(companyInformation);
        response.sendRedirect("../../main/companyInfo");
        return null;

    }
    @RequestMapping(value = "editcompanyInfo", method = RequestMethod.POST)
    public String editCompanyInfo(@ModelAttribute CompanyInformation companyInformation, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws IOException {
            
        CompanyInformation companyInfo = companyInformationManager.edit(companyInformation);
        response.sendRedirect("../../main/companyInfo/showdetails/" + companyInfo.getId());
        return null;

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

    @RequestMapping(value = "delete/{companyInfoId}", method = RequestMethod.GET)
    public String companyInfoDelete(ModelMap model, HttpServletResponse response, @PathVariable String companyInfoId) throws IOException {

        companyInformationManager.delete(companyInfoId);
        response.sendRedirect("../../../main/companyInfo");
        return null;
    }
    
    @RequestMapping(value = "clearTable", method = RequestMethod.GET)
    public String clearTable(ModelMap model, HttpServletResponse response) throws IOException {

        companyInformationManager.clear();
        response.sendRedirect("../../../main/companyInfo");
        return null;
    }
}
