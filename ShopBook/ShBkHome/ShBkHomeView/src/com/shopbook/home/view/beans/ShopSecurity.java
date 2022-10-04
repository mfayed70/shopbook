package com.shopbook.home.view.beans;

import com.shopbook.common.ui.JSFUtil;

import oracle.adf.share.logging.ADFLogger;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;

public class ShopSecurity {
    public ShopSecurity() {
        super();
    }
    
    Subject currUser ;

    public Subject getCurrUser() {
        Subject subject =  (Subject)JSFUtil.getFromSession("currUser");
        if(subject == null)
            subject = SecurityUtils.getSubject();
        
        return subject;
    }
    
    boolean isUserSysAdmin;
    boolean isUserCatAdmin;
    boolean isUserUser;
//    String privilligeName = "Cat One";
    
    public void setIsUserSysAdmin(boolean isUserSysAdmin) {
        this.isUserSysAdmin = isUserSysAdmin;
    }

    public boolean isIsUserSysAdmin() {
//    System.out.println("xx : "+ this.getCurrUser().getPrincipal());
    return this.getCurrUser().hasRole("SysAdmin");
    }

    public void setIsUserCatAdmin(boolean isUserCatAdmin) {
        this.isUserCatAdmin = isUserCatAdmin;
    }
    
    public Boolean hasPrivilige(String privilligeName){
 //       System.out.println(this.getCurrUser().isPermitted(privilligeName));
        
        return this.getCurrUser().isPermitted(privilligeName);
    }

    public boolean isIsUserCatAdmin() {
        return this.getCurrUser().hasRole("CatAdmin");
    }

    public void setIsUserUser(boolean isUserUser) {
        this.isUserUser = isUserUser;
    }

    public boolean isIsUserUser() {
        return this.getCurrUser().hasRole("User"); 
    }
}
