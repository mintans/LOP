/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.db;

import java.util.ArrayList;
import java.util.List;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author Asus PC
 */
@Document(collection = "workexperience")
public class WorkExperience {
    
    @Id
    private String id;
    private String profileId;
    private List<WorkingInfo> workingInfo= new ArrayList<>();
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<WorkingInfo> getWorkingInfo() {
        return workingInfo;
    }

    public void setWorkingInfo(List<WorkingInfo> workingInfo) {
        this.workingInfo = workingInfo;
    }

    public String getProfileId() {
        return profileId;
    }

    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }

    
    
}
