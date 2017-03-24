
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.ChangeForm;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.LoginForm;
import th.co.entronica.mjolnir.model.form.UserForm;
import th.co.entronica.mjolnir.model.reposity.UserRepository;

public interface UserManager{
    public UserRepository getRepository();
    public List<User> getAll();
    public User get(String id);
    public User save(UserForm obj);
    public User update(UserForm obj);
    public void delete(String id);
    
    public User checkLogin(LoginForm loginForm);
    public User changePassword(UserForm userForm, User user);
    public User resetPassword(UserForm userForm, String urlId);
    public String checkResetPassword(String urlId);
    public Boolean getCheckResetPassword(String urlId);

    public void changeDepart(ChangeForm changeForm);

    public void deleteDepartMember(String userId);
}
