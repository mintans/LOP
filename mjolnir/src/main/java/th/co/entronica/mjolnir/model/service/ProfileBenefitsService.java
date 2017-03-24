package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.ProfileBenefits;
import th.co.entronica.mjolnir.model.form.ProfileBenefitsForm;
import th.co.entronica.mjolnir.model.manage.ProfileBenefitsManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.reposity.ProfileBenefitsRepository;

@Service
public class ProfileBenefitsService implements ProfileBenefitsManager {
    
    @Autowired
    private ProfileBenefitsRepository profileBenefitsRepository;

    @Autowired
    private ProfileManager profileManager;

    @Override
    public ProfileBenefitsRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ProfileBenefits> getAll() {
        return profileBenefitsRepository.findAll();
    }

    @Override
    public ProfileBenefits get(String id) {
        return profileBenefitsRepository.findOne(id);
    }

    @Override
    public ProfileBenefits save(ProfileBenefitsForm obj) {
        ProfileBenefits profileBenefits = new ProfileBenefits();
        BeanUtils.copyProperties(obj, profileBenefits);
        profileBenefits = profileBenefitsRepository.save(obj);
        profileBenefitsRepository.save(profileBenefits);
        return profileBenefits;
//        ProfileBenefits profileBenefitsDB = get(obj.getId());
//        if (profileBenefitsDB == null) {
//            ProfileBenefits profileBenefits = new ProfileBenefits();
//            BeanUtils.copyProperties(obj, profileBenefits);
//            profileBenefits = profileBenefitsRepository.save(obj);
//            profileBenefitsRepository.save(profileBenefits);
//        }else{
//            profileBenefitsDB.setId(obj.getId());
//            profileBenefitsDB.setBenefits(obj.getBenefits());
//            profileBenefitsDB.setDescription(obj.getDescription());
//            profileBenefitsDB.setBenefitsId(obj.getBenefitsId());
//            profileBenefitsDB.setProfileId(obj.getProfileId());
//            profileBenefitsRepository.save(profileBenefitsDB);
//        }
//        return profileBenefitsDB;
    }

    @Override
    public ProfileBenefits update(ProfileBenefitsForm obj) {
        ProfileBenefits profileBenefits = obj;        
        profileBenefits = profileBenefitsRepository.save(profileBenefits);
        return profileBenefits;
    }

    @Override
    public void delete(String id) {
        profileBenefitsRepository.delete(id);
    }
}
