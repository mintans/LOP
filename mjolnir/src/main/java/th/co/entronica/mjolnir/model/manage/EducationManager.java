/*
 * To change this license header, choose License Headers in User Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Education;
import th.co.entronica.mjolnir.model.form.EducationForm;
import th.co.entronica.mjolnir.model.reposity.EducationRepository;




/**
 *
 * @author Pop
 */
public interface EducationManager{
    public EducationRepository getRepository();
    public List<Education> getAll();
    public Education get(String id);
    public Education save(EducationForm obj);
    public Education update(EducationForm obj);
     

    public void delete(String id);

   // public Profile detail(ProfileForm obj);

     
}
