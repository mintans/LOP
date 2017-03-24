package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Salary;
import th.co.entronica.mjolnir.model.form.SalaryForm;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.SalaryManager;
import th.co.entronica.mjolnir.model.reposity.SalaryRepository;

@Service
public class SalaryService implements SalaryManager{
    
    @Autowired
    private SalaryRepository salaryRepository;

    @Autowired
    private ProfileManager profileManager;

    @Override
    public SalaryRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Salary> getAll() {
        return salaryRepository.findAll();
    }

    @Override
    public Salary get(String id) {
        return salaryRepository.findOne(id);
    }

    @Override
    public Salary save(SalaryForm obj) {
        Salary salary = new Salary();
        BeanUtils.copyProperties(obj, salary);
        salary = salaryRepository.save(obj);
        salaryRepository.save(salary);
        return salary;
    }

    @Override
    public Salary update(SalaryForm obj) {
        Salary salary = obj;        
        salary = salaryRepository.save(salary);
        return salary;
    }

    @Override
    public void delete(String id) {
        salaryRepository.delete(id);
    }
}
