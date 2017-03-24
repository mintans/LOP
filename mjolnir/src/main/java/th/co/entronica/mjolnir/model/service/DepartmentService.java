/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Departments;
import th.co.entronica.mjolnir.model.manage.DepartmentManager;
import th.co.entronica.mjolnir.model.reposity.DepartmentRepository;
import th.co.entronica.mjolnir.model.reposity.UserRepository;

@Service
public class DepartmentService implements DepartmentManager{
    
    @Autowired
    private DepartmentRepository departmentRepository;
    
    @Autowired
    private UserRepository userRepository;

    @Override
    public DepartmentRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Departments> getAll() {
        return departmentRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }
    
    @Override
    public Departments get(String id) {
        return departmentRepository.findOne(id);
    }
    
    @Override
    public Departments save(Departments departments) {
        departmentRepository.save(departments);
        return null;
    }

    @Override
    public void delete(String id) {
        Departments departments = get(id);
        departmentRepository.delete(id);
    }

    
}
