
package th.co.entronica.mjolnir.model.db;


public class InsuranceNotice {
    private String name;
    private String startDate;
    private String anniversaryDate;
    private boolean manage;
    private boolean done;

    public InsuranceNotice() {
    }

    public InsuranceNotice(String name, String startDate, String anniversaryDate, boolean manage, boolean done) {
        this.name = name;
        this.startDate = startDate;
        this.anniversaryDate = anniversaryDate;
        this.manage = manage;
        this.done = done;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getAnniversaryDate() {
        return anniversaryDate;
    }

    public void setAnniversaryDate(String anniversaryDate) {
        this.anniversaryDate = anniversaryDate;
    }

    public boolean isManage() {
        return manage;
    }

    public void setManage(boolean manage) {
        this.manage = manage;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }
    
}
