/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.db;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import th.co.entronica.mjolnir.common.PermissionEnum;

@Document(collection = "users")
public class User {

    @Id
    private String id;
    private String username;
    private String password;
    private String email;
    private PermissionEnum permission;
    private String startWorkDate;
    private String employmentType;
    private String departmentName;
    private String position;
    private String urlId;
    private Boolean checkPWD;
    private String duration;

    
    public User() {
        
    }

    public User(String id, String username, String password, String email, PermissionEnum permission, String startWorkDate, String employmentType, String departmentName, String position, String urlId, Boolean checkPWD,String duration) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.permission = permission;
        this.startWorkDate = startWorkDate;
        this.employmentType = employmentType;
        this.departmentName = departmentName;
        this.position = position;
        this.urlId = urlId;
        this.checkPWD = checkPWD;
        this.duration = duration;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public PermissionEnum getPermission() {
        return permission;
    }

    public void setPermission(PermissionEnum permission) {
        this.permission = permission;
    }

    public String getStartWorkDate() {
        return startWorkDate;
    }

    public void setStartWorkDate(String startWorkDate) {
        this.startWorkDate = startWorkDate;
    }

    public String getEmploymentType() {
        return employmentType;
    }

    public void setEmploymentType(String employmentType) {
        this.employmentType = employmentType;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getUrlId() {
        return urlId;
    }

    public void setUrlId(String urlId) {
        this.urlId = urlId;
    }

    public Boolean getCheckPWD() {
        return checkPWD;
    }

    public void setCheckPWD(Boolean checkPWD) {
        this.checkPWD = checkPWD;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    

}
