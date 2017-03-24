/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import com.mongodb.gridfs.GridFSDBFile;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import th.co.entronica.mjolnir.model.db.CompanyInformation;
import th.co.entronica.mjolnir.model.reposity.CompanyInformationRepository;

/**
 *
 * @author MossWitthaya
 */
public interface CompanyInformationManager {

    public CompanyInformationRepository getRepository();

    public List<CompanyInformation> getAll();

    public void saveImg(MultipartFile file);

    public CompanyInformation save(CompanyInformation companyInformation);

    public GridFSDBFile getByFilename(String filename);
    
    public CompanyInformation get(String id);

    public void delete(String departmentInfoId);

    public CompanyInformation edit(CompanyInformation companyInformation);

    public void clear();

}
