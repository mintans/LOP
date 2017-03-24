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
import th.co.entronica.mjolnir.model.db.SpecialAbility;
import th.co.entronica.mjolnir.model.form.SpecialAbilityForm;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.SpecialAbilityManeger;
import th.co.entronica.mjolnir.model.reposity.SpecialAbilityRepository;

/**
 *
 * @author Asus PC
 */
@Service
public class SpecialAbilityService implements SpecialAbilityManeger{
    
    @Autowired
    private SpecialAbilityRepository specialAbilityRepository;
    
    @Autowired
    private ProfileManager profileManager;

    @Override
    public SpecialAbilityRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<SpecialAbility> getAll() {
        return specialAbilityRepository.findAll();
    }

    @Override
    public SpecialAbility get(String id) {
        return specialAbilityRepository.findOne(id);
    }

    @Override
    public SpecialAbility save(SpecialAbilityForm obj) {
        SpecialAbility specialAbility = new SpecialAbility();
        BeanUtils.copyProperties(obj, specialAbility);
        specialAbility.setId(null);
        specialAbility = specialAbilityRepository.save(obj);

        Profile profile = profileManager.get(specialAbility.getProfileId());
        profile.setSpecialAbility(specialAbility);
        profileManager.save(profile);
        return specialAbility;
    }

    @Override
    public SpecialAbility update(SpecialAbilityForm obj) {
        SpecialAbility specialAbility = obj;
        specialAbilityRepository.save(specialAbility);
        Profile profile = profileManager.get(specialAbility.getProfileId());
        profile.setSpecialAbility(specialAbility);
        profileManager.save(profile);
        return specialAbility;
    }

    @Override
    public void delete(String id) {
        SpecialAbility specialAbility =get(id);
        Profile profile = profileManager.get(specialAbility.getProfileId());
        profile.setSpecialAbility(null);
        profileManager.save(profile);
        specialAbilityRepository.delete(id);
    }
    
}
