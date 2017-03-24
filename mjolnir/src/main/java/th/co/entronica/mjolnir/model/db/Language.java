/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.db;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Pop
 */
@Document(collection = "language")
public class Language {

    @Id
    private String id;
    private Number thaiSpeaking;
    private Number thaiWriting;
    private Number thaiReading;
    private Number englishSpeaking;
    private Number englishWriting;
    private Number englishReading;
    private Number japanSpeaking;
    private Number japanWriting;
    private Number japanReading;
    private List<OtherLanguage> otherLanguage = new ArrayList<>();
    private String profileId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }    

    public Number getThaiSpeaking() {
        return thaiSpeaking;
    }

    public void setThaiSpeaking(Number thaiSpeaking) {
        this.thaiSpeaking = thaiSpeaking;
    }

    public Number getThaiWriting() {
        return thaiWriting;
    }

    public void setThaiWriting(Number thaiWriting) {
        this.thaiWriting = thaiWriting;
    }

    public Number getThaiReading() {
        return thaiReading;
    }

    public void setThaiReading(Number thaiReading) {
        this.thaiReading = thaiReading;
    }

    public Number getEnglishSpeaking() {
        return englishSpeaking;
    }

    public void setEnglishSpeaking(Number englishSpeaking) {
        this.englishSpeaking = englishSpeaking;
    }

    public Number getEnglishWriting() {
        return englishWriting;
    }

    public void setEnglishWriting(Number englishWriting) {
        this.englishWriting = englishWriting;
    }

    public Number getEnglishReading() {
        return englishReading;
    }

    public void setEnglishReading(Number englishReading) {
        this.englishReading = englishReading;
    }

    public Number getJapanSpeaking() {
        return japanSpeaking;
    }

    public void setJapanSpeaking(Number japanSpeaking) {
        this.japanSpeaking = japanSpeaking;
    }

    public Number getJapanWriting() {
        return japanWriting;
    }

    public void setJapanWriting(Number japanWriting) {
        this.japanWriting = japanWriting;
    }

    public Number getJapanReading() {
        return japanReading;
    }

    public void setJapanReading(Number japanReading) {
        this.japanReading = japanReading;
    }

    public String getProfileId() {
        return profileId;
    }

    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }

    public List<OtherLanguage> getOtherLanguage() {
        return otherLanguage;
    }

    public void setOtherLanguage(List<OtherLanguage> otherLanguage) {
        this.otherLanguage = otherLanguage;
    }
    
}
