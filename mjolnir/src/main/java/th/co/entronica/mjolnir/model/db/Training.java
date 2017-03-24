package th.co.entronica.mjolnir.model.db;

import java.util.ArrayList;
import java.util.List;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "training")
public class Training {
    @Id
    private String id;
    private String subject;
    private String trainer;
    private String description;
    private List<TrainingInfo> trainingInfo = new ArrayList<>();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTrainer() {
        return trainer;
    }

    public void setTrainer(String trainer) {
        this.trainer = trainer;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<TrainingInfo> getTrainingInfo() {
        return trainingInfo;
    }

    public void setTrainingInfo(List<TrainingInfo> trainingInfo) {
        this.trainingInfo = trainingInfo;
    }
    
}
