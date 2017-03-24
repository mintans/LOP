package th.co.entronica.mjolnir.model.service;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.gridfs.GridFSDBFile;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.gridfs.GridFsOperations;
//import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import th.co.entronica.mjolnir.model.Config.SpringMongoConfig;
import th.co.entronica.mjolnir.model.db.CompanyInformation;
import th.co.entronica.mjolnir.model.manage.CompanyInformationManager;
import th.co.entronica.mjolnir.model.reposity.CompanyInformationRepository;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;

@Service
public class CompanyInformationService implements CompanyInformationManager {

    @Autowired
    private CompanyInformationRepository companyInformationRepository;

    @Autowired
    GridFsTemplate gridFsTemplate;

    @Autowired
    ServletContext context;

    @Override
    public void saveImg(MultipartFile File) {

        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringMongoConfig.class);
        GridFsOperations gridOperations = (GridFsOperations) ctx.getBean("gridFsTemplate");

        String id = UUID.randomUUID().toString();

        try {
            gridOperations.store(File.getInputStream(), id, "image/png");

        } catch (IOException ex) {
            Logger.getLogger(CompanyInformationService.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (CompanyInformation CompanyTemp : companyInformationRepository.findAll()) {
            if (CompanyTemp.getImg() != null && CompanyTemp.getId() != null
                    && CompanyTemp.getTitle() == null && CompanyTemp.getStatus() == null && CompanyTemp.getDate() == null && CompanyTemp.getDetails() == null) {
                companyInformationRepository.delete(CompanyTemp);
            }
        }
        CompanyInformation project = new CompanyInformation();
        project.setImg(id);
        project.setTitle(null);
        project.setStatus(null);
        project.setDate(null);
        project.setDetails(null);
        companyInformationRepository.save(project);

    }

    @Override
    public CompanyInformationRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public CompanyInformation get(String id) {
        return companyInformationRepository.findOne(id);
    }

    @Override
    public List<CompanyInformation> getAll() {
        return companyInformationRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }

    @Override
    public CompanyInformation save(CompanyInformation companyInformation) {
        if (getAll().isEmpty()) {
            CompanyInformation project = new CompanyInformation();

            project.setTitle(companyInformation.getTitle());
            project.setStatus(companyInformation.getStatus());
            project.setDate(companyInformation.getDate());
            project.setImg(companyInformation.getImg());

            String details = companyInformation.getDetails().replaceAll("<p>", "");
            String detail2 = details.replaceAll("</p>", "");
            String detailNew = detail2.replaceAll("\r\n", "");
            project.setDetails(detailNew);
            companyInformationRepository.save(project);

        }
        boolean upload = false;
        String id = null;

        for (CompanyInformation CompanyInformationTemp : companyInformationRepository.findAll()) {
            if (CompanyInformationTemp.getId() != null && !CompanyInformationTemp.getImg().isEmpty() && CompanyInformationTemp.getTitle() == null && !companyInformation.getTitle().isEmpty()) {
                upload = true;
                id = CompanyInformationTemp.getId();
            }
        }
        if (upload == false) {
            String details = companyInformation.getDetails().replaceAll("<p>", "");
            String detail2 = details.replaceAll("</p>", "");
            String detailNew = detail2.replaceAll("\r\n", "");

            companyInformation.setDetails(detailNew);
            companyInformationRepository.save(companyInformation);
        }
        if (upload == true) {
            for (CompanyInformation CompanyInformationTemp : companyInformationRepository.findAll()) {
                if (CompanyInformationTemp.getId().equals(id)) {
                    CompanyInformationTemp.setTitle(companyInformation.getTitle());
                    CompanyInformationTemp.setStatus(companyInformation.getStatus());
                    CompanyInformationTemp.setDate(companyInformation.getDate());

                    String details = companyInformation.getDetails().replaceAll("<p>", "");
                    String detail2 = details.replaceAll("</p>", "");
                    String detailNew = detail2.replaceAll("\r\n", "");

                    CompanyInformationTemp.setDetails(detailNew);
                    companyInformationRepository.save(CompanyInformationTemp);
                }
            }
        }
        return null;
    }

    @Override
    public GridFSDBFile getByFilename(String fileName) {
        List<GridFSDBFile> results = gridFsTemplate.find(new Query().addCriteria(Criteria.where("filename").is(fileName)));
        if (results.isEmpty()) {
            return null;
        }
        return results.get(0);
    }

    @Override
    public void delete(String id) {
        companyInformationRepository.delete(id);

    }

    @Override
    public CompanyInformation edit(CompanyInformation companyInformation) {
        for (CompanyInformation CompanyInformationTemp : companyInformationRepository.findAll()) {
            if (CompanyInformationTemp.getId().equals(companyInformation.getId())) {
                CompanyInformationTemp.setStatus(companyInformation.getStatus());

                String details = companyInformation.getDetails().replaceAll("<p>", "");
                String detail2 = details.replaceAll("</p>", "");
                String detailNew = detail2.replaceAll("\r\n", "");

                CompanyInformationTemp.setDetails(detailNew);
                companyInformationRepository.save(CompanyInformationTemp);
            }
        }
        return companyInformation;
    }

    @Override
    public void clear() {
        for (CompanyInformation companyInfoTemp : companyInformationRepository.findAll()) {
            if (companyInfoTemp.getId() != null && !companyInfoTemp.getImg().isEmpty() && companyInfoTemp.getTitle() == null) {
                companyInformationRepository.delete(companyInfoTemp);
            }
        }
    }

}
