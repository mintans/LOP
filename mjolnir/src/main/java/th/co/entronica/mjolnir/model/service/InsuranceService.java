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
import th.co.entronica.mjolnir.model.db.Insurance;
import th.co.entronica.mjolnir.model.manage.InsuranceManager;
import th.co.entronica.mjolnir.model.reposity.InsuranceRepository;

@Service
public class InsuranceService implements InsuranceManager{
    
    @Autowired
    private InsuranceRepository insuranceRepository;

    @Override
    public InsuranceRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Insurance> getAll() {
         return insuranceRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }

    @Override
    public void acceptManage(String insuranceID) {
        Insurance project = new Insurance();
        project.setManage(true);
        project.setDone(false);
        project.setUserId(insuranceID);
        
        insuranceRepository.save(project);
    }

    @Override
    public void acceptDone(String insuranceID) {
        for (Insurance insuranceTemp : insuranceRepository.findAll()) {
            if(insuranceTemp.getUserId().equals(insuranceID)){
                insuranceTemp.setDone(true);
                insuranceTemp.setManage(true);
                insuranceRepository.save(insuranceTemp);
                
            }
        }
    }
}
