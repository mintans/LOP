package th.co.entronica.mjolnir.model.db;

import java.util.ArrayList;
import java.util.List;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "education")
public class Education {

    @Id
    private String id;
    private String profileId;
    private List<EducationInfo> educationInfo= new ArrayList<>();

    public List<EducationInfo> getEducationInfo() {
        return educationInfo;
    }

    public void setEducationInfo(List<EducationInfo> educationInfo) {
        this.educationInfo = educationInfo;
    }

    public String getProfileId() {
        return profileId;
    }

    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
 
}
