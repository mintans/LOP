package th.co.entronica.mjolnir.model.db;

import org.springframework.data.annotation.Id;

public class TrainingInfo {
    @Id
    private String id;
    private String name;
    private String date;
    private String position;

    public TrainingInfo(String id, String name, String date, String position) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.position = position;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
    
}
