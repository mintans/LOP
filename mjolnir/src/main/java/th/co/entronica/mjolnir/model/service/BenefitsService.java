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
import th.co.entronica.mjolnir.model.db.Benefits;
import th.co.entronica.mjolnir.model.manage.BenefitsManager;
import th.co.entronica.mjolnir.model.reposity.BenefitsRepository;

@Service
public class BenefitsService implements BenefitsManager{
    
    @Autowired
    private BenefitsRepository benefitsRepository;


    @Override
    public List<Benefits> getAll() {
       return benefitsRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }

    @Override
    public Benefits save(Benefits benefits) {
        benefitsRepository.save(benefits);
        return null;
    }

    @Override
    public BenefitsRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(String id) {
        benefitsRepository.delete(id);
    }


    
    
}
