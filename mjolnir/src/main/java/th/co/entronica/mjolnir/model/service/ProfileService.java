/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.FamilyInfo;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.db.WorkExperience;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.manage.EducationManager;
import th.co.entronica.mjolnir.model.manage.FamilyInfoManager;
import th.co.entronica.mjolnir.model.manage.LanguageManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.SpecialAbilityManeger;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.model.manage.WorkExperienceManager;
import th.co.entronica.mjolnir.model.reposity.EducationRepository;
import th.co.entronica.mjolnir.model.reposity.FamilyInfoRepository;
import th.co.entronica.mjolnir.model.reposity.LanguageRepository;
import th.co.entronica.mjolnir.model.reposity.ProfileRepository;
import th.co.entronica.mjolnir.model.reposity.SpecialAbilityRepository;
import th.co.entronica.mjolnir.model.reposity.UserRepository;
import th.co.entronica.mjolnir.model.reposity.WorkExperienceRepository;

/**
 *
 * @author Asus PC
 */
@Service
public class ProfileService implements ProfileManager {

    @Autowired
    private ProfileRepository profileRepository;

    @Autowired
    private UserManager userManager;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private FamilyInfoManager familyInfoManager;
    @Autowired
    private EducationManager educationManager;
    @Autowired
    private LanguageManager languageManager;
    @Autowired
    private SpecialAbilityManeger specialAbilityManeger;
    @Autowired
    private WorkExperienceManager workExperienceManager;

    @Override
    public ProfileRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Profile> getAll() {
        return profileRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }

    @Override
    public Profile get(String id) {
        return profileRepository.findOne(id);
    }

    @Override
    public Profile save(ProfileForm obj) {
        Profile profile = new Profile();
        profile.setId(obj.getId());
        profile.setTitle(obj.getTitle());
        profile.setFirstName(obj.getFirstName());
        profile.setLastName(obj.getLastName());
        profile.setNickName(obj.getNickName());
        profile.setAge(obj.getAge());
        profile.setBirth(obj.getBirth());
        profile.setHeight(obj.getHeight());
        profile.setWeight(obj.getWeight());
        profile.setRace(obj.getRace());
        profile.setNationality(obj.getNationality());
        profile.setReligion(obj.getReligion());
        profile.setBankAccount(obj.getBankAccount());
        profile.setBankAccountNo(obj.getBankAccountNo());
        profile.setCardno(obj.getCardno());
        profile.setCardnoExpiration(obj.getCardnoExpiration());
        profile.setHouseNoRegistration(obj.getHouseNoRegistration());
        profile.setRoadRegistration(obj.getRoadRegistration());
        profile.setSubDistrictRegistration(obj.getSubDistrictRegistration());
        profile.setDistrictRegistration(obj.getDistrictRegistration());
        profile.setProvinceRegistration(obj.getProvinceRegistration());
        profile.setPostCodeRegistration(obj.getPostCodeRegistration());
        profile.setHouseNoCurrent(obj.getHouseNoCurrent());
        profile.setRoadCurrent(obj.getRoadCurrent());
        profile.setSubDistrictCurrent(obj.getSubDistrictCurrent());
        profile.setDistrictCurrent(obj.getDistrictCurrent());
        profile.setProvinceCurrent(obj.getProvinceCurrent());
        profile.setPostCodeCurrent(obj.getPostCodeCurrent());
        profile.setTel(obj.getTel());
        profile.setMobile(obj.getMobile());
        profile.setEmail(obj.getEmail());
        profile.setHabitationType(obj.getHabitationType());
        profile.setMilitaryStatus(obj.getMilitaryStatus());
        profile.setMarital(obj.getMarital());
        profile.setCar(obj.isCar());
        profile.setCarDrivingNo(obj.getCarDrivingNo());
        profile.setMotorcycle(obj.isMotorcycle());
        profile.setMotorcycleDrivingNo(obj.getMotorcycleDrivingNo());
        profile.setWorkUpCountry(obj.getWorkUpCountry());
        profile.setWorkUpCountryMention(obj.getWorkUpCountryMention());
        profile.setContagiousDisease(obj.isContagiousDisease());
        profile.setNameContagiousDisease(obj.getNameContagiousDisease());
        profile.setPersonCaseEmergencyFirstname(obj.getPersonCaseEmergencyFirstname());
        profile.setPersonCaseEmergencyLastname(obj.getPersonCaseEmergencyLastname());
        profile.setRelatedApplicant(obj.getRelatedApplicant());
        profile.setRelatedApplicantAddress(obj.getRelatedApplicantAddress());
        profile.setRelatedApplicantTel(obj.getRelatedApplicantTel());
//        BeanUtils.copyProperties(obj, profile);
        save(profile);
        User user = userManager.get(obj.getId());
        user.setStartWorkDate(obj.getStartWorking());
        userRepository.save(user);
        return profile;
    }

    @Override
    public Profile update(ProfileForm obj) {
        Profile profileTemp = get(obj.getId());
        profileTemp.setTitle(obj.getTitle());
        profileTemp.setFirstName(obj.getFirstName());
        profileTemp.setLastName(obj.getLastName());
        profileTemp.setNickName(obj.getNickName());
        profileTemp.setAge(obj.getAge());
        profileTemp.setBirth(obj.getBirth());
        profileTemp.setHeight(obj.getHeight());
        profileTemp.setWeight(obj.getWeight());
        profileTemp.setRace(obj.getRace());
        profileTemp.setNationality(obj.getNationality());
        profileTemp.setReligion(obj.getReligion());
        profileTemp.setBankAccount(obj.getBankAccount());
        profileTemp.setBankAccountNo(obj.getBankAccountNo());
        profileTemp.setCardno(obj.getCardno());
        profileTemp.setCardnoExpiration(obj.getCardnoExpiration());
        profileTemp.setHouseNoRegistration(obj.getHouseNoRegistration());
        profileTemp.setRoadRegistration(obj.getRoadRegistration());
        profileTemp.setSubDistrictRegistration(obj.getSubDistrictRegistration());
        profileTemp.setDistrictRegistration(obj.getDistrictRegistration());
        profileTemp.setProvinceRegistration(obj.getProvinceRegistration());
        profileTemp.setPostCodeRegistration(obj.getPostCodeRegistration());
        profileTemp.setHouseNoCurrent(obj.getHouseNoCurrent());
        profileTemp.setRoadCurrent(obj.getRoadCurrent());
        profileTemp.setSubDistrictCurrent(obj.getSubDistrictCurrent());
        profileTemp.setDistrictCurrent(obj.getDistrictCurrent());
        profileTemp.setProvinceCurrent(obj.getProvinceCurrent());
        profileTemp.setPostCodeCurrent(obj.getPostCodeCurrent());
        profileTemp.setTel(obj.getTel());
        profileTemp.setMobile(obj.getMobile());
        profileTemp.setEmail(obj.getEmail());
        profileTemp.setHabitationType(obj.getHabitationType());
        profileTemp.setMilitaryStatus(obj.getMilitaryStatus());
        profileTemp.setMarital(obj.getMarital());
        profileTemp.setCar(obj.isCar());
        profileTemp.setCarDrivingNo(obj.getCarDrivingNo());
        profileTemp.setMotorcycle(obj.isMotorcycle());
        profileTemp.setMotorcycleDrivingNo(obj.getMotorcycleDrivingNo());
        profileTemp.setWorkUpCountry(obj.getWorkUpCountry());
        profileTemp.setWorkUpCountryMention(obj.getWorkUpCountryMention());
        profileTemp.setContagiousDisease(obj.isContagiousDisease());
        profileTemp.setNameContagiousDisease(obj.getNameContagiousDisease());
        profileTemp.setPersonCaseEmergencyFirstname(obj.getPersonCaseEmergencyFirstname());
        profileTemp.setPersonCaseEmergencyLastname(obj.getPersonCaseEmergencyLastname());
        profileTemp.setRelatedApplicant(obj.getRelatedApplicant());
        profileTemp.setRelatedApplicantAddress(obj.getRelatedApplicantAddress());
        profileTemp.setRelatedApplicantTel(obj.getRelatedApplicantTel());
//        BeanUtils.copyProperties(obj, profileTemp,"familyinfo","education","workExperiences","language","specialAbility");
        save(profileTemp);
        
        User user = userManager.get(obj.getId());
        user.setStartWorkDate(obj.getStartWorking());
        userRepository.save(user);
        return profileTemp;
    }

    @Override
    public Profile updateEN(ProfileForm obj) {
        Profile profileTemp = get(obj.getId());
        profileTemp.setTitle(obj.getTitle());
        profileTemp.setFirstNameEN(obj.getFirstNameEN());
        profileTemp.setLastNameEN(obj.getLastNameEN());
        profileTemp.setNickNameEN(obj.getNickNameEN());
        profileTemp.setAge(obj.getAge());
        profileTemp.setBirth(obj.getBirth());
        profileTemp.setHeight(obj.getHeight());
        profileTemp.setWeight(obj.getWeight());
        profileTemp.setRaceEN(obj.getRaceEN());
        profileTemp.setNationalityEN(obj.getNationalityEN());
        profileTemp.setReligionEN(obj.getReligionEN());
        profileTemp.setBankAccount(obj.getBankAccount());
        profileTemp.setBankAccountNo(obj.getBankAccountNo());
        profileTemp.setCardno(obj.getCardno());
        profileTemp.setCardnoExpiration(obj.getCardnoExpiration());
        profileTemp.setHouseNoRegistration(obj.getHouseNoRegistration());
        profileTemp.setRoadRegistrationEN(obj.getRoadRegistrationEN());
        profileTemp.setSubDistrictRegistrationEN(obj.getSubDistrictRegistrationEN());
        profileTemp.setDistrictRegistrationEN(obj.getDistrictRegistrationEN());
        profileTemp.setProvinceRegistration(obj.getProvinceRegistration());
        profileTemp.setPostCodeRegistration(obj.getPostCodeRegistration());
        profileTemp.setHouseNoCurrent(obj.getHouseNoCurrent());
        profileTemp.setRoadCurrentEN(obj.getRoadCurrentEN());
        profileTemp.setSubDistrictCurrentEN(obj.getSubDistrictCurrentEN());
        profileTemp.setDistrictCurrentEN(obj.getDistrictCurrentEN());
        profileTemp.setProvinceCurrent(obj.getProvinceCurrent());
        profileTemp.setPostCodeCurrent(obj.getPostCodeCurrent());
        profileTemp.setTel(obj.getTel());
        profileTemp.setMobile(obj.getMobile());
        profileTemp.setEmail(obj.getEmail());
        profileTemp.setHabitationType(obj.getHabitationType());
        profileTemp.setMilitaryStatus(obj.getMilitaryStatus());
        profileTemp.setMarital(obj.getMarital());
        profileTemp.setCar(obj.isCar());
        profileTemp.setCarDrivingNo(obj.getCarDrivingNo());
        profileTemp.setMotorcycle(obj.isMotorcycle());
        profileTemp.setMotorcycleDrivingNo(obj.getMotorcycleDrivingNo());
        profileTemp.setWorkUpCountry(obj.getWorkUpCountry());
        profileTemp.setWorkUpCountryMentionEN(obj.getWorkUpCountryMentionEN());
        profileTemp.setContagiousDisease(obj.isContagiousDisease());
        profileTemp.setNameContagiousDiseaseEN(obj.getNameContagiousDiseaseEN());
        profileTemp.setPersonCaseEmergencyFirstnameEN(obj.getPersonCaseEmergencyFirstnameEN());
        profileTemp.setPersonCaseEmergencyLastnameEN(obj.getPersonCaseEmergencyLastnameEN());
        profileTemp.setRelatedApplicantEN(obj.getRelatedApplicantEN());
        profileTemp.setRelatedApplicantAddressEN(obj.getRelatedApplicantAddressEN());
        profileTemp.setRelatedApplicantTel(obj.getRelatedApplicantTel());
//        BeanUtils.copyProperties(obj, profileTemp,"familyinfo","education","workExperiences","language","specialAbility");
        save(profileTemp);
        
        User user = userManager.get(obj.getId());
        user.setStartWorkDate(obj.getStartWorking());
        userRepository.save(user);
        return profileTemp;
    }

    @Override
    public void delete(String id) {

        Profile profile = get(id);

        if (profile.getFamilyinfo() != null) {
            if (profile.getFamilyinfo().getId() != null) {
                familyInfoManager.delete(profile.getFamilyinfo().getId());
            }
        }

        if (profile.getEducation() != null) {
            if (profile.getEducation().getId() != null) {
                educationManager.delete(profile.getEducation().getId());
            }
        }
        if (profile.getLanguage() != null) {
            if (profile.getLanguage().getId() != null) {
                languageManager.delete(profile.getLanguage().getId());
            }
        }
        if (profile.getSpecialAbility() != null) {
            if (profile.getSpecialAbility().getId() != null) {
                specialAbilityManeger.delete(profile.getSpecialAbility().getId());
            }
        }
        if (profile.getWorkExperiences() != null) {
            if (profile.getWorkExperiences().getId() != null) {
                workExperienceManager.delete(profile.getWorkExperiences().getId());
            }
        }
        profileRepository.delete(id);
    }

    @Override
    public Profile save(Profile profile) {
        return profileRepository.save(profile);
    }

}
