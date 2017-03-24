package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.form.EmploymentForm;
import th.co.entronica.mjolnir.model.reposity.EmploymentRepository;

public interface EmploymentManager {
    public EmploymentRepository getRepository();
    public List<Employment> getAll();
    public Employment get(String id);
    public Employment save(EmploymentForm obj);
    public Employment update(EmploymentForm obj);
     

    public void delete(String id);
}
