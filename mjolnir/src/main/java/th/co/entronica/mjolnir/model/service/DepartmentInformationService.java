/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import com.mongodb.gridfs.GridFSDBFile;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.gridfs.GridFsOperations;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import th.co.entronica.mjolnir.model.Config.SpringMongoConfig;
import th.co.entronica.mjolnir.model.db.DepartmentInformation;
import th.co.entronica.mjolnir.model.manage.DepartmentInformationManager;
import th.co.entronica.mjolnir.model.reposity.DepartmentInformationRepository;

@Service
public class DepartmentInformationService implements DepartmentInformationManager {

    @Autowired
    private DepartmentInformationRepository departmentInformationRepository;

    @Autowired
    GridFsTemplate gridFsTemplate;

    @Autowired
    ServletContext context;

    @Override
    public DepartmentInformationRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<DepartmentInformation> getAll() {
        return departmentInformationRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }

    @Override
    public void saveImg(MultipartFile file) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringMongoConfig.class);
        GridFsOperations gridOperations = (GridFsOperations) ctx.getBean("gridFsTemplate");

        String id = UUID.randomUUID().toString();

        try {
            gridOperations.store(file.getInputStream(), id, "image/png");

        } catch (IOException ex) {
            Logger.getLogger(CompanyInformationService.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (DepartmentInformation DepartmentTemp : departmentInformationRepository.findAll()) {
            if (DepartmentTemp.getImg() != null && DepartmentTemp.getId() != null
                    && DepartmentTemp.getTitle() == null && DepartmentTemp.getStatus() == null && DepartmentTemp.getDate() == null && DepartmentTemp.getDetails() == null) {
                departmentInformationRepository.delete(DepartmentTemp);
            }
        }
        DepartmentInformation project = new DepartmentInformation();
        project.setImg(id);
        project.setTitle(null);
        project.setStatus(null);
        project.setDate(null);
        project.setDetails(null);
        departmentInformationRepository.save(project);
    }

    @Override
    public DepartmentInformation save(DepartmentInformation departmentInformation) {
        if (getAll().isEmpty()) {
            DepartmentInformation project = new DepartmentInformation();

            project.setTitle(departmentInformation.getTitle());
            project.setStatus(departmentInformation.getStatus());
            project.setDate(departmentInformation.getDate());
            project.setImg(departmentInformation.getImg());
            project.setDepartment(departmentInformation.getDepartment());

            String details = departmentInformation.getDetails().replaceAll("<p>", "");
            String detail2 = details.replaceAll("</p>", "");
            String detailNew = detail2.replaceAll("\r\n", "");

            project.setDetails(detailNew);
            departmentInformationRepository.save(project);

        }
        boolean upload = false;
        String id = null;

        for (DepartmentInformation departmentInformationTemp : departmentInformationRepository.findAll()) {
            if (departmentInformationTemp.getId() != null && !departmentInformationTemp.getImg().isEmpty() && departmentInformationTemp.getTitle() == null && !departmentInformation.getTitle().isEmpty()) {
                upload = true;
                id = departmentInformationTemp.getId();
            }
        }
        if (upload == false) {
            String details = departmentInformation.getDetails().replaceAll("<p>", "");
            String detail2 = details.replaceAll("</p>", "");
            String detailNew = detail2.replaceAll("\r\n", "");

            departmentInformation.setDetails(detailNew);
            departmentInformationRepository.save(departmentInformation);
        }
        if (upload == true) {
            for (DepartmentInformation departmentInformationTemp : departmentInformationRepository.findAll()) {
                if (departmentInformationTemp.getId().equals(id)) {
                    departmentInformationTemp.setTitle(departmentInformation.getTitle());
                    departmentInformationTemp.setStatus(departmentInformation.getStatus());
                    departmentInformationTemp.setDate(departmentInformation.getDate());
                    departmentInformationTemp.setDepartment(departmentInformation.getDepartment());

                    String details = departmentInformation.getDetails().replaceAll("<p>", "");
                    String detail2 = details.replaceAll("</p>", "");
                    String detailNew = detail2.replaceAll("\r\n", "");

                    departmentInformationTemp.setDetails(detailNew);
                    departmentInformationRepository.save(departmentInformationTemp);
                }
            }
        }
        return null;
    }

    @Override
    public GridFSDBFile getByFilename(String filename) {
        List<GridFSDBFile> results = gridFsTemplate.find(new Query().addCriteria(Criteria.where("filename").is(filename)));
        if (results.isEmpty()) {
            return null;
        }
        return results.get(0);
    }

    @Override
    public DepartmentInformation get(String id) {
        return departmentInformationRepository.findOne(id);
    }

    @Override
    public void delete(String departmentInfoId) {
        departmentInformationRepository.delete(departmentInfoId);
    }

    @Override
    public DepartmentInformation edit(DepartmentInformation departmentInformation) {
        for (DepartmentInformation DepartmentInformationTemp : departmentInformationRepository.findAll()) {
            if (DepartmentInformationTemp.getId().equals(departmentInformation.getId())) {
                DepartmentInformationTemp.setStatus(departmentInformation.getStatus());

                String details = departmentInformation.getDetails().replaceAll("<p>", "");
                String detail2 = details.replaceAll("</p>", "");
                String detailNew = detail2.replaceAll("\r\n", "");

                DepartmentInformationTemp.setDetails(detailNew);
                departmentInformationRepository.save(DepartmentInformationTemp);
            }
        }
        return departmentInformation;
    }

    @Override
    public void clear() {
        for (DepartmentInformation departmentInfoTemp : departmentInformationRepository.findAll()) {
            if (departmentInfoTemp.getId() != null && !departmentInfoTemp.getImg().isEmpty() && departmentInfoTemp.getTitle() == null) {
                departmentInformationRepository.delete(departmentInfoTemp);
            }
        }
    }

}
