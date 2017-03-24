
package th.co.entronica.mjolnir.model.db;

public class MapEvaluation {
    private String type;
    private String name;
    private String date;
    private String position;
    private String department;

    public MapEvaluation() {
    }

    public MapEvaluation(String type, String name, String date, String position, String department) {
        this.type = type;
        this.name = name;
        this.date = date;
        this.position = position;
        this.department = department;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

   
}
