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
 * @author Gam
 */
@Document(collection="leader")
public class Leader {
    @Id
    private String leaderId;
    private String teamId;
    
    /**
     * @return the teamId
     */
    public String getTeamId() {
        return teamId;
    }

    /**
     * @param teamId the teamId to set
     */
    public void setTeamId(String teamId) {
        this.teamId = teamId;
    }

    /**
     * @return the leaderId
     */
    public String getLeaderId() {
        return leaderId;
    }

    /**
     * @param leaderId the leaderId to set
     */
    public void setLeaderId(String leaderId) {
        this.leaderId = leaderId;
    }
}
