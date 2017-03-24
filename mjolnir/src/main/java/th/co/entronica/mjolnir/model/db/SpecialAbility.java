/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.db;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author Asus PC
 */
@Document(collection = "specialAbility")
public class SpecialAbility {
    
    @Id
    private String id;
    private boolean typing;
    private String typingThai;
    private String typingEnglish;
    private boolean computer;
    private String computerMention;
    private boolean driving;
    private String drivingLicense;
    private String officeMachine;
    private String hobbies;
    private String favouriteSport;
    private String specialKnowledge;
    private String others;
    private String profileId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public boolean isTyping() {
        return typing;
    }

    public void setTyping(boolean typing) {
        this.typing = typing;
    }

    public String getTypingThai() {
        return typingThai;
    }

    public void setTypingThai(String typingThai) {
        this.typingThai = typingThai;
    }

    public String getTypingEnglish() {
        return typingEnglish;
    }

    public void setTypingEnglish(String typingEnglish) {
        this.typingEnglish = typingEnglish;
    }

    public boolean isComputer() {
        return computer;
    }

    public void setComputer(boolean computer) {
        this.computer = computer;
    }

    public String getComputerMention() {
        return computerMention;
    }

    public void setComputerMention(String computerMention) {
        this.computerMention = computerMention;
    }

    public boolean isDriving() {
        return driving;
    }

    public void setDriving(boolean driving) {
        this.driving = driving;
    }

    public String getDrivingLicense() {
        return drivingLicense;
    }

    public void setDrivingLicense(String drivingLicense) {
        this.drivingLicense = drivingLicense;
    }

    public String getOfficeMachine() {
        return officeMachine;
    }

    public void setOfficeMachine(String officeMachine) {
        this.officeMachine = officeMachine;
    }

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }

    public String getFavouriteSport() {
        return favouriteSport;
    }

    public void setFavouriteSport(String favouriteSport) {
        this.favouriteSport = favouriteSport;
    }

    public String getSpecialKnowledge() {
        return specialKnowledge;
    }

    public void setSpecialKnowledge(String specialKnowledge) {
        this.specialKnowledge = specialKnowledge;
    }

    public String getOthers() {
        return others;
    }

    public void setOthers(String others) {
        this.others = others;
    }

    public String getProfileId() {
        return profileId;
    }

    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }
   
}
