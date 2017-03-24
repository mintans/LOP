/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.db;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.GeneratedValue;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author Asus PC
 */
@Document(collection = "familyinfo")
public class FamilyInfo {
    
    @Id
    private String id;
    private String code;
    private String fatherFirstname;
    private String fatherLastname;
    private String fatherAge;
    private String fatherOccupation;
    private String motherFirstname;
    private String motherLastname;
    private String motherAge;
    private String motherOccupation;
    private String spouseFirstname;
    private String spouseLastname;
    private String spouseAge;
    private String spouseOccupation;
    private String numberChildren;
    private String numberFamily;
    private String numberBrother;
    private String numberSister;
    private String noFamily;
    private String profileId;
    private List<BrethrenInfo> brethrenInfo= new ArrayList<>();

    public List<BrethrenInfo> getBrethrenInfo() {
        return brethrenInfo;
    }

    public void setBrethrenInfo(List<BrethrenInfo> brethrenInfo) {
        this.brethrenInfo = brethrenInfo;
    }

    
   
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }    

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    

    public String getFatherFirstname() {
        return fatherFirstname;
    }

    public void setFatherFirstname(String fatherFirstname) {
        this.fatherFirstname = fatherFirstname;
    }

    public String getFatherLastname() {
        return fatherLastname;
    }

    public void setFatherLastname(String fatherLastname) {
        this.fatherLastname = fatherLastname;
    }

    public String getFatherAge() {
        return fatherAge;
    }

    public void setFatherAge(String fatherAge) {
        this.fatherAge = fatherAge;
    }

    public String getFatherOccupation() {
        return fatherOccupation;
    }

    public void setFatherOccupation(String fatherOccupation) {
        this.fatherOccupation = fatherOccupation;
    }

    public String getMotherFirstname() {
        return motherFirstname;
    }

    public void setMotherFirstname(String motherFirstname) {
        this.motherFirstname = motherFirstname;
    }

    public String getMotherLastname() {
        return motherLastname;
    }

    public void setMotherLastname(String motherLastname) {
        this.motherLastname = motherLastname;
    }

    public String getMotherAge() {
        return motherAge;
    }

    public void setMotherAge(String motherAge) {
        this.motherAge = motherAge;
    }

    public String getMotherOccupation() {
        return motherOccupation;
    }

    public void setMotherOccupation(String motherOccupation) {
        this.motherOccupation = motherOccupation;
    }

    public String getSpouseFirstname() {
        return spouseFirstname;
    }

    public void setSpouseFirstname(String spouseFirstname) {
        this.spouseFirstname = spouseFirstname;
    }

    public String getSpouseLastname() {
        return spouseLastname;
    }

    public void setSpouseLastname(String spouseLastname) {
        this.spouseLastname = spouseLastname;
    }

    public String getSpouseAge() {
        return spouseAge;
    }

    public void setSpouseAge(String spouseAge) {
        this.spouseAge = spouseAge;
    }

    public String getSpouseOccupation() {
        return spouseOccupation;
    }

    public void setSpouseOccupation(String spouseOccupation) {
        this.spouseOccupation = spouseOccupation;
    }

    public String getNumberChildren() {
        return numberChildren;
    }

    public void setNumberChildren(String numberChildren) {
        this.numberChildren = numberChildren;
    }

    public String getNumberFamily() {
        return numberFamily;
    }

    public void setNumberFamily(String numberFamily) {
        this.numberFamily = numberFamily;
    }

    public String getNumberBrother() {
        return numberBrother;
    }

    public void setNumberBrother(String numberBrother) {
        this.numberBrother = numberBrother;
    }

    public String getNumberSister() {
        return numberSister;
    }

    public void setNumberSister(String numberSister) {
        this.numberSister = numberSister;
    }

    public String getNoFamily() {
        return noFamily;
    }

    public void setNoFamily(String noFamily) {
        this.noFamily = noFamily;
    }

    /**
     * @return the profileId
     */
    public String getProfileId() {
        return profileId;
    }

    /**
     * @param profileId the profileId to set
     */
    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }
    
}
