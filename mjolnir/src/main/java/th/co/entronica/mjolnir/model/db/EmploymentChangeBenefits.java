
package th.co.entronica.mjolnir.model.db;

public class EmploymentChangeBenefits {
    private String employmentTypeName;
    private String[] checkList;
    private String[] noCheckList;

    public EmploymentChangeBenefits() {
    }

    public EmploymentChangeBenefits(String employmentTypeName, String[] checkList, String[] noCheckList) {
        this.employmentTypeName = employmentTypeName;
        this.checkList = checkList;
        this.noCheckList = noCheckList;
    }

    public String getEmploymentTypeName() {
        return employmentTypeName;
    }

    public void setEmploymentTypeName(String employmentTypeName) {
        this.employmentTypeName = employmentTypeName;
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
