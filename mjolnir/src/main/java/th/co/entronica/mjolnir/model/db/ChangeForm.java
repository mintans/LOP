package th.co.entronica.mjolnir.model.db;

import java.util.ArrayList;

public class ChangeForm {

    private String departmentName;
    private String managerName;
    private String[] checkList;
    private String[] noCheckList;

    public ChangeForm() {
    }

    public ChangeForm(String departmentName, String managerName, String[] checkList, String[] noCheckList) {
        this.departmentName = departmentName;
        this.managerName = managerName;
        this.checkList = checkList;
        this.noCheckList = noCheckList;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

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

   
}
