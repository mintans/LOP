
package th.co.entronica.mjolnir.model.db;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "departmentInformation")
public class DepartmentInformation {
    @Id
    private String id;
    private String img;
    private String title;
    private String status;
    private String date;
    private String details;
    private String department;

    public DepartmentInformation() {
    }

    public DepartmentInformation(String id, String img, String title, String status, String date, String details, String department) {
        this.id = id;
        this.img = img;
        this.title = title;
        this.status = status;
        this.date = date;
        this.details = details;
        this.department = department;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    

    
}
