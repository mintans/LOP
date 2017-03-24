/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.BirthDay;
import th.co.entronica.mjolnir.model.manage.BirthDayManager;
import th.co.entronica.mjolnir.model.reposity.BirthDayRepository;

@Service
public class BirthDayService implements BirthDayManager{
    
    @Autowired
    private BirthDayRepository birthDayRepository;

    @Override
    public BirthDayRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<BirthDay> getAll() {
        return birthDayRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }

    @Override
    public void acceptDone(String birthDayID) {
        BirthDay project = new BirthDay();
        
        Date currentDate = new Date();
        Calendar currentCalendar = Calendar.getInstance(Locale.US);
        currentCalendar.setTime(currentDate);
        String year = String.valueOf(currentCalendar.get(Calendar.YEAR));
        
        project.setProfileId(birthDayID);
        project.setYear(year);
        birthDayRepository.save(project);
    }
    
}
