/*
 * To change this license header, choose License Headers in User Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.ChangeForm;
import th.co.entronica.mjolnir.model.db.Departments;
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.LoginForm;
import th.co.entronica.mjolnir.model.form.UserForm;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.model.reposity.DepartmentRepository;
import th.co.entronica.mjolnir.model.reposity.EmploymentRepository;
import th.co.entronica.mjolnir.model.reposity.ProfileRepository;
import th.co.entronica.mjolnir.model.reposity.TransferRepository;
import th.co.entronica.mjolnir.model.reposity.UserRepository;

@Service
public class UserService implements UserManager {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TransferRepository transferRepository;

    @Autowired
    private EmploymentRepository employmentRepository;

    @Autowired
    private DepartmentRepository departmentRepository;

    @Override
    public UserRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<User> getAll() {
        return userRepository.findAll();
    }

    @Override
    public User get(String id) {
        return userRepository.findOne(id);
    }

    @Override
    public User save(UserForm obj) {
        String departName = "";
        for (Departments departTemp : departmentRepository.findAll()) {
            if (departTemp.getId().equals(obj.getDepartmentName())) {
                departName = departTemp.getDepartmentName();
            }
        }
//        User
        User project = new User();
        project.setId(obj.getId());
        project.setUsername(obj.getUsername());
        project.setPassword("entro1234");
        project.setEmail(obj.getEmail());
        project.setPermission(obj.getPermission());
        project.setDepartmentName(departName);
        project.setStartWorkDate(obj.getStartWorkDate());
        project.setUrlId(UUID.randomUUID().toString());
        project.setCheckPWD(false);
        userRepository.save(project);

        Employment employ = new Employment();
        employ.setAction("เริ่มงาน");
        employ.setDate(obj.getStartWorkDate());
        if (obj.getDuration() == null) {
            employ.setDulation("");
        } else {
            employ.setDulation(obj.getDuration());
        }

        employ.setType(obj.getEmploymentType());
        employ.setProfileId(obj.getId());
        employmentRepository.save(employ);

        Transfer transfer = new Transfer();
        transfer.setDate(obj.getStartWorkDate());
        transfer.setPosition(obj.getPosition());
        transfer.setProfileId(obj.getId());
        transferRepository.save(transfer);

        return project;
    }

    @Override
    public User update(UserForm obj) {

        String departName = "";
        for (Departments departTemp : departmentRepository.findAll()) {
            if (departTemp.getId().equals(obj.getDepartmentName())) {
                departName = departTemp.getDepartmentName();
            }
        }

        for (User userTemp : userRepository.findAll()) {
            if (userTemp.getId().equals(obj.getId())) {
                userTemp.setId(obj.getId());
                userTemp.setUsername(obj.getUsername());
                userTemp.setPassword(obj.getPassword());
                userTemp.setEmail(obj.getEmail());
                userTemp.setPermission(obj.getPermission());
                userTemp.setDepartmentName(departName);
                userTemp.setStartWorkDate(obj.getStartWorkDate());
                userTemp.setUrlId(obj.getUrlId());
                userTemp.setCheckPWD(obj.getCheckPWD());
                userRepository.save(userTemp);

            }
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
        String todayDate = sdf.format(new Date());

        String employId = null;
        String employType = null;
        String employDuration = null;
        String employProfileId = null;

        String transferId = null;
        String transferPosition = null;
        String transferProfileId = null;

        for (Employment employTemp : employmentRepository.findAll()) {
            if (employTemp.getProfileId().equals(obj.getId())) {
                employId = employTemp.getId();
                employType = employTemp.getType();
                employDuration = employTemp.getDulation();
                employProfileId = employTemp.getProfileId();
            }
        }
        if (employProfileId.equals(obj.getId()) && !employType.equals(obj.getEmploymentType())) {

            Employment employ = new Employment();
            employ.setAction("เปลี่ยนสถานะ");
            employ.setDate(todayDate);

            if (obj.getDuration() == null) {
                employ.setDulation("");
            } else {
                employ.setDulation(obj.getDuration());
            }

            employ.setType(obj.getEmploymentType());
            employ.setProfileId(obj.getId());
            employmentRepository.save(employ);

        } else if (employProfileId.equals(obj.getId()) && employType.equals(obj.getEmploymentType())) {
            for (Employment employTemp : employmentRepository.findAll()) {
                if (employTemp.getId().equals(employId)) {

                    if (obj.getDuration() == null) {
                        employTemp.setDulation("");
                    } else {
                        employTemp.setDulation(obj.getDuration());
                    }
                    

                    employmentRepository.save(employTemp);
                }
            }

        }

        for (Transfer transferTemp : transferRepository.findAll()) {
            if (transferTemp.getProfileId().equals(obj.getId())) {

                transferId = transferTemp.getId();
                transferPosition = transferTemp.getPosition();
                transferProfileId = transferTemp.getProfileId();
            }

        }

        if (transferProfileId.equals(obj.getId()) && !transferPosition.equals(obj.getPosition())) {

            Transfer transfer = new Transfer();
            transfer.setDate(todayDate);
            transfer.setPosition(obj.getPosition());
            transfer.setProfileId(obj.getId());
            transferRepository.save(transfer);
        }
        return null;
    }

    @Override
    public void delete(String id) {
        for (Employment employTemp : employmentRepository.findAll()) {
            if (employTemp.getProfileId().equals(id)) {
                employmentRepository.delete(employTemp);
            }
        }
        for (Transfer transferTemp : transferRepository.findAll()) {
            if (transferTemp.getProfileId().equals(id)) {
                transferRepository.delete(transferTemp);
            }
        }
        userRepository.delete(id);

    }

    @Override
    public User checkLogin(LoginForm loginForm) {
        for (User userTemp : userRepository.findAll()) {
            if (userTemp.getUsername().equals(loginForm.getUsername())) {
                if (userTemp.getPassword().equals(loginForm.getPassword())) {
                    return userTemp;
                }
            }
        }
        return null;
    }

    @Override
    public User changePassword(UserForm userForm, User user) {
        if (user.getPassword().equals(userForm.getOldPassword())) {

            if (userForm.getNewPassword().equals(userForm.getConfirmPassword())) {
                user.setPassword(userForm.getNewPassword());
                userRepository.save(user);
                return user;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    @Override
    public User resetPassword(UserForm userForm, String urlId) {
        for (User userTemp : userRepository.findAll()) {
            if (userTemp.getUrlId().equals(urlId)) {
                if (userForm.getNewPassword().equals(userForm.getConfirmPassword())) {
                    userTemp.setPassword(userForm.getNewPassword());
                    userTemp.setCheckPWD(false);
                    userRepository.save(userTemp);
                    return userTemp;
                } else {
                    return null;
                }
            }
        }
        return null;
    }

    @Override
    public String checkResetPassword(String urlId) {
        for (User userTemp : userRepository.findAll()) {
            if (userTemp.getUrlId().equals(urlId)) {
                userTemp.setCheckPWD(true);
                userRepository.save(userTemp);
                return userTemp.getEmail();
            }
        }
        return null;
    }

    @Override
    public Boolean getCheckResetPassword(String urlId) {
        for (User userTemp : userRepository.findAll()) {
            if (userTemp.getUrlId().equals(urlId)) {
                return userTemp.getCheckPWD();
            }
        }
        return null;
    }

    @Override
    public void changeDepart(ChangeForm changeForm) {
        String depart = changeForm.getDepartmentName();

        if (changeForm.getCheckList() != null) {
            List<String> idCheckList = Arrays.asList(changeForm.getCheckList());
            for (User userTemp : userRepository.findAll()) {
                for (int i = 0; i < idCheckList.size(); i++) {
                    if (userTemp.getId().equals(idCheckList.get(i))) {
                        userTemp.setDepartmentName(depart);
                        userRepository.save(userTemp);
                    }
                }
            }
        }
        if (changeForm.getNoCheckList() != null) {
            List<String> idNoCheckList = Arrays.asList(changeForm.getNoCheckList());
            for (User userTemp : userRepository.findAll()) {
                for (int i = 0; i < idNoCheckList.size(); i++) {
                    if (userTemp.getId().equals(idNoCheckList.get(i))) {
                        userTemp.setDepartmentName(null);
                        userRepository.save(userTemp);
                    }
                }
            }
        }

    }

    @Override
    public void deleteDepartMember(String userId) {

        for (User userTemp : userRepository.findAll()) {
            if (userTemp.getId().equals(userId)) {
                userTemp.setDepartmentName(null);
                userRepository.save(userTemp);
            }
        }
    }
}
