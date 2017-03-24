package th.co.entronica.mjolnir.model.form;

import th.co.entronica.mjolnir.model.db.Training;

public class TrainingForm extends Training {
    private String[] checkList;
    private String[] noCheckList;
    private String[] checkSendEmailList;
    private String[] noCheckSendEmailList;
    private String date;
    private String startDate;
    private String startTime;
    private String endDate;
    private String endTime;
    private String location;
    private String descriptionSendEmail;
    
    public String[] getCheckList() {
        return checkList;
    }

    public void setCheckList(String[] checkList) {
        this.checkList = checkList;
    }

    public String[] getNoCheckList() {
        return noCheckList;
    }

    public void setNoCheckList(String[] noCheckList) {
        this.noCheckList = noCheckList;
    }

    public String[] getCheckSendEmailList() {
        return checkSendEmailList;
    }

    public void setCheckSendEmailList(String[] checkSendEmailList) {
        this.checkSendEmailList = checkSendEmailList;
    }

    public String[] getNoCheckSendEmailList() {
        return noCheckSendEmailList;
    }

    public void setNoCheckSendEmailList(String[] noCheckSendEmailList) {
        this.noCheckSendEmailList = noCheckSendEmailList;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescriptionSendEmail() {
        return descriptionSendEmail;
    }

    public void setDescriptionSendEmail(String descriptionSendEmail) {
        this.descriptionSendEmail = descriptionSendEmail;
    }
    
}
