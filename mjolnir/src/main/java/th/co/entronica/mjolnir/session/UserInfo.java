/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.session;

import java.io.Serializable;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import th.co.entronica.mjolnir.model.db.User;

/**
 *
 * @author Pop
 */
@Component
@Scope("session")
public class UserInfo implements Serializable{
    private User user;
    private boolean login;

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the login
     */
    public boolean isLogin() {
        return login;
    }

    /**
     * @param login the login to set
     */
    public void setLogin(boolean login) {
        this.login = login;
    }

  
    
    
}
