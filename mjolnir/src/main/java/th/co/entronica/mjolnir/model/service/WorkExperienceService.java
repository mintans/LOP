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
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.WorkExperience;
import th.co.entronica.mjolnir.model.form.WorkExperienceForm;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.WorkExperienceManager;
import th.co.entronica.mjolnir.model.reposity.WorkExperienceRepository;

/**
 *
 * @author Asus PC
 */
@Service
public class WorkExperienceService implements WorkExperienceManager {

    @Autowired
    private WorkExperienceRepository workExperienceRepository;
    
    @Autowired
    private ProfileManager profileManager;
    
    @Override
    public WorkExperienceRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<WorkExperience> getAll() {
        return workExperienceRepository.findAll();
    }

    @Override
    public WorkExperience get(String id) {
        return workExperienceRepository.findOne(id);
    }

    @Override
    public WorkExperience save(WorkExperienceForm obj) {
        WorkExperience workExperience = new WorkExperience();
        BeanUtils.copyProperties(obj, workExperience);
        workExperience = workExperienceRepository.save(obj);

        Profile profile = profileManager.get(workExperience.getProfileId());
        profile.setWorkExperiences(workExperience);
        profileManager.save(profile);
        return  workExperience;
    }

    @Override
    public WorkExperience update(WorkExperienceForm obj) {
        WorkExperience workExperience = obj;
        workExperienceRepository.save(workExperience);
        Profile profile = profileManager.get(workExperience.getProfileId());
        profile.setWorkExperiences(workExperience);
        profileManager.save(profile);
        return workExperience;
    }

    @Override
    public void delete(String id) {
        WorkExperience workExperience =get(id);
        Profile profile = profileManager.get(workExperience.getProfileId());
        profile.setWorkExperiences(null);
        profileManager.save(profile);
        workExperienceRepository.delete(id);
    }
    
}
