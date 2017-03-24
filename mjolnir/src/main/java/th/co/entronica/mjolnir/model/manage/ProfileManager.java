/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.reposity.ProfileRepository;

/**
 *
 * @author Asus PC
 */
public interface ProfileManager {
    
    public ProfileRepository getRepository();
    public List<Profile> getAll();
    public Profile get(String id);
    public Profile save(ProfileForm obj);
    public Profile save(Profile obj);
    public Profile updateEN(ProfileForm obj);
    public Profile update(ProfileForm obj);
    
    public void delete(String id);
    
}
