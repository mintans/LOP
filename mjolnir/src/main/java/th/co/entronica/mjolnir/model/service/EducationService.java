/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.Date;
import java.util.List;
import javax.swing.JOptionPane;
import org.codehaus.jackson.map.util.BeanUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Education;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.form.EducationForm;
import th.co.entronica.mjolnir.model.manage.EducationManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.reposity.EducationRepository;

/**
 *
 * @author Pop
 */
@Service
public class EducationService implements EducationManager {

    @Autowired
    private EducationRepository educationRepository;

    @Autowired
    private ProfileManager profileManager;

    @Override
    public EducationRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Education> getAll() {
        return educationRepository.findAll();
    }

    @Override
    public Education get(String id) {
        return educationRepository.findOne(id);
    }

    @Override
    public Education save(EducationForm obj) {
        Education education = new Education();
        BeanUtils.copyProperties(obj, education);
        education = educationRepository.save(obj);

        Profile profile = profileManager.get(education.getProfileId());
        profile.setEducation(education);
        profileManager.save(profile);

        educationRepository.save(education);
        return education;
    }

    @Override
    public Education update(EducationForm obj) {
        Education education = obj;        
        education = educationRepository.save(education);
        Profile profile = profileManager.get(education.getProfileId());
        profile.setEducation(education);
        profileManager.save(profile);
        return education;
    }

    @Override
    public void delete(String id) {
         Education education =get(id);
        Profile profile = profileManager.get(education.getProfileId());
        profile.setEducation(null);
        profileManager.save(profile);
        educationRepository.delete(id);
    }

}
