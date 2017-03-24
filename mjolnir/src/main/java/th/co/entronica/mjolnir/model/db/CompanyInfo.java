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

@Document(collection = "companyinfo")
public class CompanyInfo {
    @Id
    private String id;
    private String img;
    private String title;
    private String status;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @NotNull
    @Past
    private Date date;
    private String details;

    public CompanyInfo() {
    }

    public CompanyInfo(String id, String img, String title, String status, Date date, String details) {
        this.id = id;
        this.img = img;
        this.title = title;
        this.status = status;
        this.date = date;
        this.details = details;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
    

    
    
}
