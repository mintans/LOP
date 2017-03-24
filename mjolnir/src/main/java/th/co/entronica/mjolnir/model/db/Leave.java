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
@Document(collection = "leave")
public class Leave {
    @Id
    private String id;
    private String empId;
    private String date;
    private String date2;
    private String from;
    private String from2;
    private String to;
    private String to2;
    private String total;
    private String type;
    private String description;
    private Number status;
    private boolean leader;
    private boolean manager;
    private boolean admin;

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the from
     */
    public String getFrom() {
        return from;
    }

    /**
     * @param from the from to set
     */
    public void setFrom(String from) {
        this.from = from;
    }

    /**
     * @return the to
     */
    public String getTo() {
        return to;
    }

    /**
     * @param to the to to set
     */
    public void setTo(String to) {
        this.to = to;
    }

    /**
     * @return the total
     */
    public String getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(String total) {
        this.total = total;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the empId
     */
    public String getEmpId() {
        return empId;
    }

    /**
     * @param empId the empId to set
     */
    public void setEmpId(String empId) {
        this.empId = empId;
    }

    /**
     * @return the from2
     */
    public String getFrom2() {
        return from2;
    }

    /**
     * @param from2 the from2 to set
     */
    public void setFrom2(String from2) {
        this.from2 = from2;
    }

    /**
     * @return the to2
     */
    public String getTo2() {
        return to2;
    }

    /**
     * @param to2 the to2 to set
     */
    public void setTo2(String to2) {
        this.to2 = to2;
    }

    /**
     * @return the date2
     */
    public String getDate2() {
        return date2;
    }

    /**
     * @param date2 the date2 to set
     */
    public void setDate2(String date2) {
        this.date2 = date2;
    }

    /**
     * @return the leader
     */
    public boolean getLeader() {
        return leader;
    }

    /**
     * @param leader the leader to set
     */
    public void setLeader(boolean leader) {
        this.leader = leader;
    }

    /**
     * @return the manager
     */
    public boolean getManager() {
        return manager;
    }

    /**
     * @param manager the manager to set
     */
    public void setManager(boolean manager) {
        this.manager = manager;
    }

    /**
     * @return the admin
     */
    public boolean getAdmin() {
        return admin;
    }

    /**
     * @param admin the admin to set
     */
    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    /**
     * @return the status
     */
    public Number getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(Number status) {
        this.status = status;
    }
    
}
