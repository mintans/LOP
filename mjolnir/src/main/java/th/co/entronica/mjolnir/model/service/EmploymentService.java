/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.form.EmploymentForm;
import th.co.entronica.mjolnir.model.manage.EmploymentManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.reposity.EmploymentRepository;

@Service
public class EmploymentService implements EmploymentManager {
    
    @Autowired
    private EmploymentRepository employmentRepository;

    @Autowired
    private ProfileManager profileManager;

    @Override
    public EmploymentRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Employment> getAll() {
        return employmentRepository.findAll();
    }

    @Override
    public Employment get(String id) {
        return employmentRepository.findOne(id);
    }

    @Override
    public Employment save(EmploymentForm obj) {
        Employment employment = new Employment();
        BeanUtils.copyProperties(obj, employment);
        employment = employmentRepository.save(obj);
        employmentRepository.save(employment);
        return employment;
    }

    @Override
    public Employment update(EmploymentForm obj) {
        Employment employment = obj;        
        employment = employmentRepository.save(employment);
        return employment;
    }

    @Override
    public void delete(String id) {
        employmentRepository.delete(id);
    }
}
