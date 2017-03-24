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
@Document(collection = "overtime")
public class OverTime {
    @Id
    private String id;
    private String empId;
    private String fullDate;
    private String dayName;
    private String year;
    private String month;
    private String date;
    private String timeIn;
    private String timeOut;
    private String total;
    private String description;
    private String remark;
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
     * @return the year
     */
    public String getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(String year) {
        this.year = year;
    }

    /**
     * @return the month
     */
    public String getMonth() {
        return month;
    }

    /**
     * @param month the month to set
     */
    public void setMonth(String month) {
        this.month = month;
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
     * @return the timeIn
     */
    public String getTimeIn() {
        return timeIn;
    }

    /**
     * @param timeIn the timeIn to set
     */
    public void setTimeIn(String timeIn) {
        this.timeIn = timeIn;
    }

    /**
     * @return the timeOut
     */
    public String getTimeOut() {
        return timeOut;
    }

    /**
     * @param timeOut the timeOut to set
     */
    public void setTimeOut(String timeOut) {
        this.timeOut = timeOut;
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
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the dayName
     */
    public String getDayName() {
        return dayName;
    }

    /**
     * @param dayName the dayName to set
     */
    public void setDayName(String dayName) {
        this.dayName = dayName;
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
