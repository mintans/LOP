/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.db;

import java.util.Date;
import java.util.List;
import javax.persistence.GeneratedValue;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Asus PC
 */
@Document(collection = "profile")
public class Profile {

    @Id    
    private String id;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @NotNull
    @Past
    private String startWorking;
    private String title;
    private String firstName;
    private String lastName;
    private String nickName;
    private String age;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @NotNull
    @Past
    private String birth;
    private String height;
    private String weight;
    private String nationality;
    private String religion;
    private String bankAccount;
    private String bankAccountNo;
    private String race;
    private String cardno;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @NotNull
    @Past
    private String cardnoExpiration;
    private String houseNoRegistration;
    private String roadRegistration;
    private String subDistrictRegistration;
    private String districtRegistration;
    private String provinceRegistration;
    private String postCodeRegistration;
    private String houseNoCurrent;
    private String roadCurrent;
    private String subDistrictCurrent;
    private String districtCurrent;
    private String provinceCurrent;
    private String postCodeCurrent;
    private String tel;
    private String mobile;
    private String email;
    private String emailOffice;
    private String habitationType;
    private String militaryStatus;
    private String marital;
    private boolean car;
    private String carDrivingNo;
    private boolean motorcycle;
    private String motorcycleDrivingNo;
    private String workUpCountry;
    private String workUpCountryMention;
    private String personCaseEmergencyFirstname;
    private String personCaseEmergencyLastname;
    private String relatedApplicant;
    private String relatedApplicantAddress;
    private String relatedApplicantTel;
    private String sourcesJobInformation;
    private boolean contagiousDisease;
    private String nameContagiousDisease;
    private String friendsWorkingUs;
    private String introduceYourself;
    private String firstNameEN;
    private String lastNameEN;
    private String nickNameEN;
    private String raceEN;
    private String nationalityEN;
    private String religionEN;
    private String roadRegistrationEN;
    private String subDistrictRegistrationEN;
    private String districtRegistrationEN;
    private String roadCurrentEN;
    private String subDistrictCurrentEN;
    private String districtCurrentEN;
    private String workUpCountryMentionEN;
    private String personCaseEmergencyFirstnameEN;
    private String personCaseEmergencyLastnameEN;
    private String relatedApplicantEN;
    private String relatedApplicantAddressEN;
    private String nameContagiousDiseaseEN;
    @DBRef
    private FamilyInfo familyinfo; //(FK:family_info.id)
    @DBRef
    private Education education; //(FK:family_info.id)
    @DBRef
    private WorkExperience workExperiences; //(FK:family_info.id)
    @DBRef
    private Language language; //(FK:family_info.id)
    @DBRef
    private SpecialAbility specialAbility; //(FK:family_info.id)

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }
    
    

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    public String getBankAccountNo() {
        return bankAccountNo;
    }

    public void setBankAccountNo(String bankAccountNo) {
        this.bankAccountNo = bankAccountNo;
    }

    public String getRace() {
        return race;
    }

    public void setRace(String race) {
        this.race = race;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public String getCardnoExpiration() {
        return cardnoExpiration;
    }

    public void setCardnoExpiration(String cardnoExpiration) {
        this.cardnoExpiration = cardnoExpiration;
    }

    public String getHouseNoRegistration() {
        return houseNoRegistration;
    }

    public void setHouseNoRegistration(String houseNoRegistration) {
        this.houseNoRegistration = houseNoRegistration;
    }

    public String getRoadRegistration() {
        return roadRegistration;
    }

    public void setRoadRegistration(String roadRegistration) {
        this.roadRegistration = roadRegistration;
    }

    public String getSubDistrictRegistration() {
        return subDistrictRegistration;
    }

    public void setSubDistrictRegistration(String subDistrictRegistration) {
        this.subDistrictRegistration = subDistrictRegistration;
    }

    public String getDistrictRegistration() {
        return districtRegistration;
    }

    public void setDistrictRegistration(String districtRegistration) {
        this.districtRegistration = districtRegistration;
    }

    public String getProvinceRegistration() {
        return provinceRegistration;
    }

    public void setProvinceRegistration(String provinceRegistration) {
        this.provinceRegistration = provinceRegistration;
    }

    public String getPostCodeRegistration() {
        return postCodeRegistration;
    }

    public void setPostCodeRegistration(String postCodeRegistration) {
        this.postCodeRegistration = postCodeRegistration;
    }

    public String getHouseNoCurrent() {
        return houseNoCurrent;
    }

    public void setHouseNoCurrent(String houseNoCurrent) {
        this.houseNoCurrent = houseNoCurrent;
    }

    public String getRoadCurrent() {
        return roadCurrent;
    }

    public void setRoadCurrent(String roadCurrent) {
        this.roadCurrent = roadCurrent;
    }

    public String getSubDistrictCurrent() {
        return subDistrictCurrent;
    }

    public void setSubDistrictCurrent(String subDistrictCurrent) {
        this.subDistrictCurrent = subDistrictCurrent;
    }

    public String getDistrictCurrent() {
        return districtCurrent;
    }

    public void setDistrictCurrent(String districtCurrent) {
        this.districtCurrent = districtCurrent;
    }

    public String getProvinceCurrent() {
        return provinceCurrent;
    }

    public void setProvinceCurrent(String provinceCurrent) {
        this.provinceCurrent = provinceCurrent;
    }

    public String getPostCodeCurrent() {
        return postCodeCurrent;
    }

    public void setPostCodeCurrent(String postCodeCurrent) {
        this.postCodeCurrent = postCodeCurrent;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmailOffice() {
        return emailOffice;
    }

    public void setEmailOffice(String emailOffice) {
        this.emailOffice = emailOffice;
    }

    public String getHabitationType() {
        return habitationType;
    }

    public void setHabitationType(String habitationType) {
        this.habitationType = habitationType;
    }

    public String getMilitaryStatus() {
        return militaryStatus;
    }

    public void setMilitaryStatus(String militaryStatus) {
        this.militaryStatus = militaryStatus;
    }

    public String getMarital() {
        return marital;
    }

    public void setMarital(String marital) {
        this.marital = marital;
    }

    public boolean isCar() {
        return car;
    }

    public void setCar(boolean car) {
        this.car = car;
    }

    public String getCarDrivingNo() {
        return carDrivingNo;
    }

    public void setCarDrivingNo(String carDrivingNo) {
        this.carDrivingNo = carDrivingNo;
    }

    public boolean isMotorcycle() {
        return motorcycle;
    }

    public void setMotorcycle(boolean motorcycle) {
        this.motorcycle = motorcycle;
    }

    public String getMotorcycleDrivingNo() {
        return motorcycleDrivingNo;
    }

    public void setMotorcycleDrivingNo(String motorcycleDrivingNo) {
        this.motorcycleDrivingNo = motorcycleDrivingNo;
    }

    public String getWorkUpCountry() {
        return workUpCountry;
    }

    public void setWorkUpCountry(String workUpCountry) {
        this.workUpCountry = workUpCountry;
    }

    public String getWorkUpCountryMention() {
        return workUpCountryMention;
    }

    public void setWorkUpCountryMention(String workUpCountryMention) {
        this.workUpCountryMention = workUpCountryMention;
    }

    public String getPersonCaseEmergencyFirstname() {
        return personCaseEmergencyFirstname;
    }

    public void setPersonCaseEmergencyFirstname(String personCaseEmergencyFirstname) {
        this.personCaseEmergencyFirstname = personCaseEmergencyFirstname;
    }

    public String getPersonCaseEmergencyLastname() {
        return personCaseEmergencyLastname;
    }

    public void setPersonCaseEmergencyLastname(String personCaseEmergencyLastname) {
        this.personCaseEmergencyLastname = personCaseEmergencyLastname;
    }

    public String getRelatedApplicant() {
        return relatedApplicant;
    }

    public void setRelatedApplicant(String relatedApplicant) {
        this.relatedApplicant = relatedApplicant;
    }

    public String getRelatedApplicantAddress() {
        return relatedApplicantAddress;
    }

    public void setRelatedApplicantAddress(String relatedApplicantAddress) {
        this.relatedApplicantAddress = relatedApplicantAddress;
    }

    public String getRelatedApplicantTel() {
        return relatedApplicantTel;
    }

    public void setRelatedApplicantTel(String relatedApplicantTel) {
        this.relatedApplicantTel = relatedApplicantTel;
    }

    public String getSourcesJobInformation() {
        return sourcesJobInformation;
    }

    public void setSourcesJobInformation(String sourcesJobInformation) {
        this.sourcesJobInformation = sourcesJobInformation;
    }

    public boolean isContagiousDisease() {
        return contagiousDisease;
    }

    public void setContagiousDisease(boolean contagiousDisease) {
        this.contagiousDisease = contagiousDisease;
    }

    public String getNameContagiousDisease() {
        return nameContagiousDisease;
    }

    public void setNameContagiousDisease(String nameContagiousDisease) {
        this.nameContagiousDisease = nameContagiousDisease;
    }

    public String getFriendsWorkingUs() {
        return friendsWorkingUs;
    }

    public void setFriendsWorkingUs(String friendsWorkingUs) {
        this.friendsWorkingUs = friendsWorkingUs;
    }

    public String getIntroduceYourself() {
        return introduceYourself;
    }

    public void setIntroduceYourself(String introduceYourself) {
        this.introduceYourself = introduceYourself;
    }

    

    /**
     * @return the familyinfo
     */
    public FamilyInfo getFamilyinfo() {
        return familyinfo;
    }

    /**
     * @param familyinfo the familyinfo to set
     */
    public void setFamilyinfo(FamilyInfo familyinfo) {
        this.familyinfo = familyinfo;
    }

    /**
     * @return the education
     */
    public Education getEducation() {
        return education;
    }

    /**
     * @param education the education to set
     */
    public void setEducation(Education education) {
        this.education = education;
    }

    public WorkExperience getWorkExperiences() {
        return workExperiences;
    }

    public void setWorkExperiences(WorkExperience workExperiences) {
        this.workExperiences = workExperiences;
    }    

    /**
     * @return the language
     */
    public Language getLanguage() {
        return language;
    }

    /**
     * @param language the language to set
     */
    public void setLanguage(Language language) {
        this.language = language;
    }

    /**
     * @return the specialAbility
     */
    public SpecialAbility getSpecialAbility() {
        return specialAbility;
    }

    /**
     * @param specialAbility the specialAbility to set
     */
    public void setSpecialAbility(SpecialAbility specialAbility) {
        this.specialAbility = specialAbility;
    }

    /**
     * @return the StartWorking
     */
    public String getStartWorking() {
        return startWorking;
    }

    /**
     * @param StartWorking the StartWorking to set
     */
    public void setStartWorking(String StartWorking) {
        this.startWorking = StartWorking;
    }

    public String getFirstNameEN() {
        return firstNameEN;
    }

    public void setFirstNameEN(String firstNameEN) {
        this.firstNameEN = firstNameEN;
    }

    public String getLastNameEN() {
        return lastNameEN;
    }

    public void setLastNameEN(String lastNameEN) {
        this.lastNameEN = lastNameEN;
    }

    public String getNickNameEN() {
        return nickNameEN;
    }

    public void setNickNameEN(String nickNameEN) {
        this.nickNameEN = nickNameEN;
    }

    public String getRaceEN() {
        return raceEN;
    }

    public void setRaceEN(String raceEN) {
        this.raceEN = raceEN;
    }

    public String getNationalityEN() {
        return nationalityEN;
    }

    public void setNationalityEN(String nationalityEN) {
        this.nationalityEN = nationalityEN;
    }

    public String getReligionEN() {
        return religionEN;
    }

    public void setReligionEN(String religionEN) {
        this.religionEN = religionEN;
    }

    public String getRoadRegistrationEN() {
        return roadRegistrationEN;
    }

    public void setRoadRegistrationEN(String roadRegistrationEN) {
        this.roadRegistrationEN = roadRegistrationEN;
    }

    public String getSubDistrictRegistrationEN() {
        return subDistrictRegistrationEN;
    }

    public void setSubDistrictRegistrationEN(String subDistrictRegistrationEN) {
        this.subDistrictRegistrationEN = subDistrictRegistrationEN;
    }

    public String getDistrictRegistrationEN() {
        return districtRegistrationEN;
    }

    public void setDistrictRegistrationEN(String districtRegistrationEN) {
        this.districtRegistrationEN = districtRegistrationEN;
    }

    public String getRoadCurrentEN() {
        return roadCurrentEN;
    }

    public void setRoadCurrentEN(String roadCurrentEN) {
        this.roadCurrentEN = roadCurrentEN;
    }

    public String getSubDistrictCurrentEN() {
        return subDistrictCurrentEN;
    }

    public void setSubDistrictCurrentEN(String subDistrictCurrentEN) {
        this.subDistrictCurrentEN = subDistrictCurrentEN;
    }

    public String getDistrictCurrentEN() {
        return districtCurrentEN;
    }

    public void setDistrictCurrentEN(String districtCurrentEN) {
        this.districtCurrentEN = districtCurrentEN;
    }

    public String getWorkUpCountryMentionEN() {
        return workUpCountryMentionEN;
    }

    public void setWorkUpCountryMentionEN(String workUpCountryMentionEN) {
        this.workUpCountryMentionEN = workUpCountryMentionEN;
    }

    public String getPersonCaseEmergencyFirstnameEN() {
        return personCaseEmergencyFirstnameEN;
    }

    public void setPersonCaseEmergencyFirstnameEN(String personCaseEmergencyFirstnameEN) {
        this.personCaseEmergencyFirstnameEN = personCaseEmergencyFirstnameEN;
    }

    public String getPersonCaseEmergencyLastnameEN() {
        return personCaseEmergencyLastnameEN;
    }

    public void setPersonCaseEmergencyLastnameEN(String personCaseEmergencyLastnameEN) {
        this.personCaseEmergencyLastnameEN = personCaseEmergencyLastnameEN;
    }

    public String getRelatedApplicantEN() {
        return relatedApplicantEN;
    }

    public void setRelatedApplicantEN(String relatedApplicantEN) {
        this.relatedApplicantEN = relatedApplicantEN;
    }

    public String getRelatedApplicantAddressEN() {
        return relatedApplicantAddressEN;
    }

    public void setRelatedApplicantAddressEN(String relatedApplicantAddressEN) {
        this.relatedApplicantAddressEN = relatedApplicantAddressEN;
    }

    public String getNameContagiousDiseaseEN() {
        return nameContagiousDiseaseEN;
    }

    public void setNameContagiousDiseaseEN(String nameContagiousDiseaseEN) {
        this.nameContagiousDiseaseEN = nameContagiousDiseaseEN;
    }
    
}
