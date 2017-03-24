/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.db;

import java.util.Date;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Asus PC
 */

public class WorkingInfo {
    
    private String company;
    private String from;
    private String to;
    private String position;
    private String jobDescription;
    private String salary;
    private String reasonsResignation;

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

  

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

   

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getReasonsResignation() {
        return reasonsResignation;
    }

    public void setReasonsResignation(String reasonsResignation) {
        this.reasonsResignation = reasonsResignation;
    }


}
