/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.Date;
import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.OverTime;
import th.co.entronica.mjolnir.model.form.OverTimeForm;
import th.co.entronica.mjolnir.model.manage.OverTimeManager;
import th.co.entronica.mjolnir.model.reposity.OverTimeRepository;

/**
 *
 * @author Gam
 */
@Service
public class OverTimeService implements OverTimeManager{
    
    @Autowired
    
    private OverTimeRepository overtimeRepository;
    
    @Override
    public OverTimeRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<OverTime> getAll() {
        return overtimeRepository.findAll(new Sort(Sort.Direction.ASC, "date"));
    }

    @Override
    public OverTime get(String id) {
        return overtimeRepository.findOne(id);
    }

    @Override
    public OverTime save(OverTimeForm obj) {
        OverTime overtime = new OverTime();
        BeanUtils.copyProperties(obj, overtime);
        //overtime.setCreateByDate(new Date();
        overtimeRepository.save(overtime);
        return overtime;
    }

    @Override
    public OverTime update(OverTimeForm obj) {
        OverTime overtime = obj;     
        //overtime.setCreateByDate(new Date());
        overtimeRepository.save(overtime);
        return overtime;
    }

    @Override
    public void delete(String id) {
        overtimeRepository.delete(id);
  
    }
}
