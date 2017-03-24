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
@Document(collection = "payment")
public class Payment {
    @Id
    private String id;
    private String empId;
    private String receiptNo;
    private String fullDate;
    private String date;
    private String description;
    private String amount;
    private Number status;
    private boolean leader;
    private boolean admin1;
    private boolean manager;
    private boolean admin2;

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
     * @return the receiptNo
     */
    public String getReceiptNo() {
        return receiptNo;
    }

    /**
     * @param receiptNo the receiptNo to set
     */
    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo;
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
     * @return the amount
     */
    public String getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(String amount) {
        this.amount = amount;
    }

    /**
     * @return the fullDate
     */
    public String getFullDate() {
        return fullDate;
    }

    /**
     * @param fullDate the fullDate to set
     */
    public void setFullDate(String fullDate) {
        this.fullDate = fullDate;
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
     * @return the admin1
     */
    public boolean getAdmin1() {
        return admin1;
    }

    /**
     * @param admin1 the admin1 to set
     */
    public void setAdmin1(boolean admin1) {
        this.admin1 = admin1;
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
     * @return the admin2
     */
    public boolean getAdmin2() {
        return admin2;
    }

    /**
     * @param admin2 the admin2 to set
     */
    public void setAdmin2(boolean admin2) {
        this.admin2 = admin2;
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
