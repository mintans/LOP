package th.co.entronica.mjolnir.model.db;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "benefits")
public class Benefits {
    @Id
    private String id;
    private String benefitsName;
    private String description;

    public Benefits() {
    }

    public Benefits(String id, String benefitsName, String description) {
        this.id = id;
        this.benefitsName = benefitsName;
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBenefitsName() {
        return benefitsName;
    }

    public void setBenefitsName(String benefitsName) {
        this.benefitsName = benefitsName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
   
}
