package com.shopbook.home.view.beans;

import com.shopbook.common.ui.ADFUtils;
import com.shopbook.common.ui.JSFUtil;

import java.util.HashMap;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.share.logging.ADFLogger;

import oracle.jbo.Row;
import oracle.jbo.RowSetIterator;

import oracle.jbo.ViewObject;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;

public class LoginBean {
    public LoginBean() {
    }
    String userName;
    String password;
    String welcome;
    
    private ADFLogger logger = ADFLogger.createADFLogger(LoginBean.class);

    public void setWelcome(String welcome) {
        this.welcome = welcome;
    }

    public String getWelcome() {
        return welcome;
    }
    private final String HOME_URL = "/shopbookHome/shop/home";
 
    public void login(ActionEvent actionEvent) {
        // Add event code here...
        try { // attempt login
        SecurityUtils.getSubject().login(new UsernamePasswordToken(userName, password));            
            // retrieve the saved request
    HttpServletRequest request = (HttpServletRequest)(FacesContext.getCurrentInstance().getExternalContext().
    getRequest());
    SavedRequest savedRequest = WebUtils.getAndClearSavedRequest(request);
         // get external context in order to redirect
          ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
            
           JSFUtil.storeOnSession("userId", this.userName);
            
        HashMap<String, String> myPermissions = new HashMap<String,String>();            
            DCIteratorBinding iter = ADFUtils.findIterator("UserPermissionsVIterator");
            ViewObject vo = iter.getViewObject();
//                System.out.println("user :"+vo.getEstimatedRowCount());
            RowSetIterator rs = vo.createRowSetIterator(null);
                int i =1;
            while (rs.hasNext()) {
                Row r = rs.next();
                System.out.println("user in r :"+vo.getEstimatedRowCount());
//                this.welcome =
//                    "Welcome " + (String) r.getAttribute("FirstName") + " " + (String) r.getAttribute("FamilyName");
//                JSFUtil.storeOnSession("welcomeUser", this.welcome);
                if (r.getAttribute("Permission") != null) {
                    myPermissions.put(r.getAttribute("Permission").toString(),
                                      r.getAttribute("Id").toString());
                i++;
                System.out.println("permission : "+r.getAttribute("Permission").toString()
                                   +"Id :"+r.getAttribute("Id").toString());
                }
            }
            if  (!myPermissions.isEmpty()) {
          JSFUtil.storeOnSession("myPerms", myPermissions);
          System.out.println("perms : "+myPermissions.size());
          
        }
                System.out.println("perms : "+myPermissions.size());
                DCIteratorBinding iter1 = ADFUtils.findIterator("UsersProfileVIterator");
                ViewObject vo1 = iter1.getViewObject();
                RowSetIterator rs1 = vo1.createRowSetIterator(null);
//                    System.out.println("user :"+vo1.getEstimatedRowCount());
                while (rs1.hasNext()) {
                    Row r1 = rs1.next();
//                    System.out.println("user in r :"+vo.getEstimatedRowCount());
                    this.welcome =
                        "Welcome " + (String) r1.getAttribute("UserName") /*+ " " + (String) r1.getAttribute("FamilyName")*/;
                    JSFUtil.storeOnSession("welcomeUser", this.welcome);  
                }
    if (savedRequest != null) 
        {
        logger.fine("Retrieved saved URL '" +
        savedRequest.getRequestUrl() + "', redirecting");
        externalContext.redirect(savedRequest.getRequestUrl());
        } else {
                logger.fine("No URL retrieved, redirecting to HOME_URL: "
                + HOME_URL);
                externalContext.redirect(HOME_URL);
                }
            }  catch (AuthenticationException e) {
                      logger.config("Failed login validation for user " +
                      userName);
                      FacesMessage msg =
                      new FacesMessage(FacesMessage.SEVERITY_ERROR,
                      "Invalid username/password combination", "");
                      FacesContext.getCurrentInstance().addMessage(null, msg);       
                  } catch (Exception e) {
                logger.warning("Unexpected error during login", e);
        }              
    }

    public boolean isUserSysAdmin() {
        Subject currUser = SecurityUtils.getSubject();
        JSFUtil.storeOnSession("isSysAdmin", currUser.hasRole("SysAdmin"));
        return currUser.hasRole("SysAdmin");
    }
    public boolean isUserCatAdmin() {
        Subject currUser = SecurityUtils.getSubject();
        JSFUtil.storeOnSession("isCatAdmin", currUser.hasRole("CatAdmin"));
        return currUser.hasRole("CatAdmin");
    }
    public boolean isUserUser() {
        Subject currUser = SecurityUtils.getSubject();
        JSFUtil.storeOnSession("isUser", currUser.hasRole("User"));
        return currUser.hasRole("User");
    }
    public void logOut(ActionEvent actionEvent) {
        // Add event code here...
        Subject currUser = SecurityUtils.getSubject();
//HttpSession session=(HttpSession)FacesContext.getCurrentInstance().getExternalContext().getSession(false);
       currUser.logout();
        ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
        try {
//          session.invalidate();
            externalContext.redirect(HOME_URL);
           
       } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
            FacesContext.getCurrentInstance().addMessage(null,
                                new FacesMessage(FacesMessage.SEVERITY_ERROR, "Erro: ", e.getMessage()));            
        }
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }
}
