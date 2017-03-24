/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import com.mongodb.gridfs.GridFSDBFile;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import th.co.entronica.mjolnir.model.db.DepartmentInformation;
import th.co.entronica.mjolnir.model.reposity.DepartmentInformationRepository;

/**
 *
 * @author MossWitthaya
 */
public interface DepartmentInformationManager {
    public DepartmentInformationRepository getRepository();

    public List<DepartmentInformation> getAll();

    public void saveImg(MultipartFile file);

    public DepartmentInformation save(DepartmentInformation departmentInformation);

    public GridFSDBFile getByFilename(String filename);
    
    public DepartmentInformation get(String id);

    public void delete(String departmentInfoId);

    public DepartmentInformation edit(DepartmentInformation departmentInformation);

    public void clear();
    
}
