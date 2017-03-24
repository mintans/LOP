
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Departments;
import th.co.entronica.mjolnir.model.reposity.DepartmentRepository;


public interface DepartmentManager {
    
    public DepartmentRepository getRepository();
    public List<Departments> getAll();

    public Departments save(Departments departments);
    public Departments get(String id);

    public void delete(String departmentsID);

}
