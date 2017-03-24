package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Salary;
import th.co.entronica.mjolnir.model.form.SalaryForm;
import th.co.entronica.mjolnir.model.reposity.SalaryRepository;

public interface SalaryManager {
    public SalaryRepository getRepository();
    public List<Salary> getAll();
    public Salary get(String id);
    public Salary save(SalaryForm obj);
    public Salary update(SalaryForm obj);
     

    public void delete(String id);
}
