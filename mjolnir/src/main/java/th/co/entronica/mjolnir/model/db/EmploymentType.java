
package th.co.entronica.mjolnir.model.db;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "employmentType")
public class EmploymentType {
    @Id
    private String id;
    private String employmentTypeName;
    private String typeName;
    private String[] benefits;
    
    public EmploymentType() {
    }

    public EmploymentType(String id, String employmentTypeName, String typeName, String[] benefits) {
        this.id = id;
        this.employmentTypeName = employmentTypeName;
        this.typeName = typeName;
        this.benefits = benefits;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmploymentTypeName() {
        return employmentTypeName;
    }

    public void setEmploymentTypeName(String employmentTypeName) {
        this.employmentTypeName = employmentTypeName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String[] getBenefits() {
        return benefits;
    }

    public void setBenefits(String[] benefits) {
        this.benefits = benefits;
    }

   
    
}
