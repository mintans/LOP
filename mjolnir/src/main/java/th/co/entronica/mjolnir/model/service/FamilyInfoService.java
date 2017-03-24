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
import th.co.entronica.mjolnir.model.db.FamilyInfo;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.form.FamilyInfoForm;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.manage.FamilyInfoManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.reposity.FamilyInfoRepository;

/**
 *
 * @author Asus PC
 */
@Service
public class FamilyInfoService implements FamilyInfoManager {

    @Autowired
    private FamilyInfoRepository familyInfoRepository;
    @Autowired
    private ProfileManager profileManager;

    @Override
    public FamilyInfoRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<FamilyInfo> getAll() {
        return familyInfoRepository.findAll();
    }

    @Override
    public FamilyInfo get(String id) {
        return familyInfoRepository.findOne(id);
    }

    @Override
    public FamilyInfo save(FamilyInfoForm obj) {
        FamilyInfo familyInfo = new FamilyInfo();
        BeanUtils.copyProperties(obj, familyInfo);
        familyInfo = familyInfoRepository.save(obj);
        Profile profile = profileManager.get(familyInfo.getProfileId());
        profile.setFamilyinfo(familyInfo);
        profileManager.save(profile);
        return familyInfo;
    }

    @Override
    public FamilyInfo save(FamilyInfo familyInfo) {
        return familyInfoRepository.save(familyInfo);
    }

    @Override
    public FamilyInfo update(FamilyInfoForm obj) {
        FamilyInfo familyInfo = obj;
        familyInfo = familyInfoRepository.save(obj);
        Profile profile = profileManager.get(familyInfo.getProfileId());
        profile.setFamilyinfo(familyInfo);
        profileManager.save(profile);
        return familyInfo;
    }

    @Override
    public FamilyInfo update(FamilyInfo familyInfo) {
        return familyInfoRepository.save(familyInfo);
    }

    @Override
    public void delete(String id) {
        FamilyInfo familyInfo = get(id);
        Profile profile = profileManager.get(familyInfo.getProfileId());
        profile.setFamilyinfo(null);
        profileManager.save(profile);
        familyInfoRepository.delete(id);
    }
}
