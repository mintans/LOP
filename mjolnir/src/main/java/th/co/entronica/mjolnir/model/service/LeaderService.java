/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Leader;
import th.co.entronica.mjolnir.model.form.LeaderForm;
import th.co.entronica.mjolnir.model.manage.LeaderManager;
import th.co.entronica.mjolnir.model.reposity.LeaderRepository;

/**
 *
 * @author Gam
 */
@Service
public class LeaderService implements LeaderManager{
    @Autowired    
    private LeaderRepository leaderRepository;
    
    @Override
    public LeaderRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Leader> getAll() {
        return leaderRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }

    @Override
    public Leader get(String id) {
        return leaderRepository.findOne(id);
    }
    
    @Override
    public Leader save(LeaderForm obj) {
        Leader project = new Leader();
        BeanUtils.copyProperties(obj, project);
        leaderRepository.save(project);
        return project;
    }

    @Override
    public Leader update(LeaderForm obj) {
        Leader project = obj;     
        leaderRepository.save(project);
        return project;
    }

    @Override
    public void delete(String id) {
        leaderRepository.delete(id);
  
    }
}
