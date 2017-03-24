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
import th.co.entronica.mjolnir.model.db.Leave;
import th.co.entronica.mjolnir.model.form.LeaveForm;
import th.co.entronica.mjolnir.model.manage.LeaveManager;
import th.co.entronica.mjolnir.model.reposity.LeaveRepository;

/**
 *
 * @author Gam
 */
@Service
public class LeaveService implements LeaveManager{
    @Autowired
    
    private LeaveRepository leaveRepository;
    
    @Override
    public LeaveRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Leave> getAll() {
        return leaveRepository.findAll(new Sort(Sort.Direction.ASC, "date"));
    }

    @Override
    public Leave get(String id) {
        return leaveRepository.findOne(id);
    }

    @Override
    public Leave save(LeaveForm obj) {
        Leave leave = new Leave();
        BeanUtils.copyProperties(obj, leave);
        //overtime.setCreateByDate(new Date();
        leaveRepository.save(leave);
        return leave;
    }

    @Override
    public Leave update(LeaveForm obj) {
        Leave leave = obj;     
        //overtime.setCreateByDate(new Date());
        leaveRepository.save(leave);
        return leave;
    }

    @Override
    public void delete(String id) {
        leaveRepository.delete(id);
  
    }
}
