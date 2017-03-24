/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.WorkExperience;
import th.co.entronica.mjolnir.model.form.WorkExperienceForm;
import th.co.entronica.mjolnir.model.reposity.WorkExperienceRepository;

/**
 *
 * @author Asus PC
 */
public interface WorkExperienceManager {
    
    public WorkExperienceRepository getRepository();
    public List<WorkExperience> getAll();
    public WorkExperience get(String id);
    public WorkExperience save(WorkExperienceForm obj);
    public WorkExperience update(WorkExperienceForm obj);
    public void delete(String id);
    
}
