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
import th.co.entronica.mjolnir.model.db.Team;
import th.co.entronica.mjolnir.model.form.TeamForm;
import th.co.entronica.mjolnir.model.manage.TeamManager;
import th.co.entronica.mjolnir.model.reposity.TeamRepository;

/**
 *
 * @author Gam
 */
@Service
public class TeamService implements TeamManager{
    @Autowired    
    private TeamRepository teamRepository;
    
    @Override
    public TeamRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Team> getAll() {
        return teamRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }

    @Override
    public Team get(String id) {
        return teamRepository.findOne(id);
    }
    
    @Override
    public Team save(TeamForm obj) {
        Team project = new Team();
        BeanUtils.copyProperties(obj, project);
        teamRepository.save(project);
        return project;
    }

    @Override
    public Team update(TeamForm obj) {
        Team project = obj;     
        teamRepository.save(project);
        return project;
    }

    @Override
    public void delete(String id) {
        teamRepository.delete(id);
  
    }
}
