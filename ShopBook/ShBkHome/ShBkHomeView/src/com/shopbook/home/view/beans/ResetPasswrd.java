package com.shopbook.home.view.beans;

import com.shopbook.common.ui.ADFUtils;

import com.shopbook.common.ui.JSFUtil;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;
import javax.faces.validator.ValidatorException;

import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.input.RichInputText;

import oracle.adf.view.rich.component.rich.output.RichOutputText;

import oracle.binding.OperationBinding;

import oracle.jbo.ViewObject;

import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.event.PollEvent;

public class ResetPasswrd {

    private RichInputText pswrd;
    private RichInputText confPswrd;
    private RichInputText puserId;
    private RichInputText v1Pswrd;
    private RichInputText v2Pswrd;
    private RichPopup vpopUp;
    private RichOutputText pchngPswrdMismatch;
    private String confrmMsg = "We send you an email contains a link to reset your password, then login";
    private String confrmGo = "adfMenu_login";
    private RichPopup confrmPopup;

    public void setConfrmMsg(String confrmMsg) {
        this.confrmMsg = confrmMsg;
    }

    public String getConfrmMsg() {
        return confrmMsg;
    }

    public void setConfrmGo(String confrmGo) {
        this.confrmGo = confrmGo;
    }

    public String getConfrmGo() {
        return confrmGo;
    }

    public void verifyPswd(ActionEvent actionEvent) {
        // Add event code here...
    String vPswrd = (String)this.pswrd.getLocalValue();
    String vConfPswrd = (String)this.confPswrd.getLocalValue();
//   System.out.println(vPswrd+"---"+vConfPswrd);
    if (vPswrd == null ||  vConfPswrd == null || !vPswrd.equals(vConfPswrd) || vPswrd.length() < 6) {   
       System.out.println("length :"+vPswrd.length());
        ADFUtils.setEL("#{pageFlowScope.pStatus}", "bad"); 
        this.confPswrd.resetValue();
        this.pswrd.resetValue();

 //RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());   
    } else {
//    DCIteratorBinding iter = ADFUtils.findIterator("VerifyPswdVIterator");
//    ViewObject vo = iter.getViewObject();
//       System.out.println("here i am : "+vPswrd);
    ADFUtils.setBoundAttributeValue("Passwrd", vPswrd);
    ADFUtils.setBoundAttributeValue("OneTimeCode", "");
    ADFUtils.setBoundAttributeValue("Active", "Y");
    OperationBinding oper = ADFUtils.findOperation("Commit");
    oper.execute();
        ADFUtils.setEL("#{pageFlowScope.pStatus}", "good"); 
//RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());   
       this.confrmMsg = "Password has been changed succesfully, you will be " +
           "redirected to login";
            RichPopup.PopupHints hint = new RichPopup.PopupHints();
            this.getConfrmPopup().show(hint);

    } 
    System.out.println("pstatus :"+JSFUtil.resolveExpressionAsString("#{pageFlowScope.pStatus}"));
//    return "verify";
    }

     public void cryptographyUser(ActionEvent actionEvent) {
        // Add event code here...
         
        AppUserVerifyEmail newUser = new AppUserVerifyEmail();
        String genKey = newUser.genKey(128);
        String toUser = (String)ADFUtils.getBoundAttributeValue("UserName");
        String toEmail = (String)ADFUtils.getBoundAttributeValue("UserId");
        ADFUtils.setBoundAttributeValue("OneTimeCode",genKey );
        String toUrl = (String) ADFUtils.getBoundAttributeValue("VerifyEmailUrl");
        if ((String)toEmail!= null) {
            String[] _toEmail = {toEmail};
        newUser.sendVerificationEmail(toUser, _toEmail,"toR",toUrl,genKey);
        OperationBinding oper = ADFUtils.findOperation("Commit");
        oper.execute();
//            JSFUtil.addFacesErrorMessage("A verification email sent to your email," +
//                "kindly use the link to verify yourself and set your password, then login.");
        RichPopup.PopupHints hint = new RichPopup.PopupHints();
        this.getConfrmPopup().show(hint);
        } else JSFUtil.addFacesErrorMessage("Email ID can not be null");
    }
    public void cancelSignUp(ActionEvent actionEvent) {
        // Add event code here...
    //        DCIteratorBinding iter = ADFUtils.findIterator("UserSignupVIterator");
    //        ADFUtils.setBoundAttributeValue("UserId", "000011111rrrrr");
    //RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());
    //        iter.getCurrentRow().remove();
        OperationBinding oper = ADFUtils.findOperation("Rollback");
        oper.execute();
    }

    public void forgotPaswrd(ActionEvent actionEvent) {
        // Add event code here...
//        System.out.println(this.puserId.getValue());
        String toUrl = (String) ADFUtils.getBoundAttributeValue("VerifyEmailUrl");
        if ((String)this.puserId.getValue()!=null) {
          ADFUtils.findOperation("ExecuteWithParams").execute();
            ViewObject vo = ADFUtils.findIterator("ResetPswrdReqVIterator").getViewObject();
            int xx = (int) vo.getEstimatedRowCount();
            if (xx==0) {
                JSFUtil.addFacesErrorMessage("This email is not registered");
            } else {
// set one_time_code only, and don't set password=null, because if user remember the password but didn't use
            // the link, it still work.   
            AppUserVerifyEmail FrgtPswrdVerifyEmail = new AppUserVerifyEmail();
                String genKey = FrgtPswrdVerifyEmail.genKey(128);  
                ADFUtils.setBoundAttributeValue("OneTimeCode", genKey);
            String[] _toEmail = {(String)this.puserId.getValue()};
            FrgtPswrdVerifyEmail.sendVerificationEmail("user",_toEmail,"toV",toUrl,genKey);
            OperationBinding oper = ADFUtils.findOperation("Commit");
            oper.execute();
           RichPopup.PopupHints hint = new RichPopup.PopupHints();
            this.getConfrmPopup().show(hint);
                }
        } else {
            JSFUtil.addFacesErrorMessage("Email address can not be null");
        } 
    }
    
     public void setPswrd(RichInputText pswrd) {
        this.pswrd = pswrd;
    }

    public RichInputText getPswrd() {
        return pswrd;
    }

    public void setConfPswrd(RichInputText confPswrd) {
        this.confPswrd = confPswrd;
    }

    public RichInputText getConfPswrd() {
        return confPswrd;
    }

    public void setPuserId(RichInputText puserId) {
        this.puserId = puserId;
    }

    public RichInputText getPuserId() {
        return puserId;
    }

    public void setV1Pswrd(RichInputText v1Pswrd) {
        this.v1Pswrd = v1Pswrd;
    }

    public RichInputText getV1Pswrd() {
        return v1Pswrd;
    }

    public void setV2Pswrd(RichInputText v2Pswrd) {
        this.v2Pswrd = v2Pswrd;
    }

    public RichInputText getV2Pswrd() {
        return v2Pswrd;
    }

    public void setVpopUp(RichPopup vpopUp) {
        this.vpopUp = vpopUp;
    }

    public RichPopup getVpopUp() {
        return vpopUp;
    }

    public void saveChngPaswrdActionListener(ActionEvent actionEvent) {
        // Add event code here...
        String p1Pswrd = (String)this.v1Pswrd.getLocalValue();
        String p2Pswrd = (String)this.v2Pswrd.getLocalValue();
 //       System.out.println("pswrd is :"+p1Pswrd);
        if (p1Pswrd == null ||  p2Pswrd == null || 
            !p1Pswrd.equals(p2Pswrd) || p1Pswrd.length() < 6) {   
        //       System.out.println("length :"+vPswrd.length());
//            ADFUtils.setEL("#{pageFlowScope.pStatus}", "bad"); 
            this.v1Pswrd.resetValue();
            this.v2Pswrd.resetValue();
            this.pchngPswrdMismatch.setRendered(true);
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());
        } else  //if (p1Pswrd.equals(p2Pswrd)) 
                {
        //    DCIteratorBinding iter = ADFUtils.findIterator("VerifyPswdVIterator");
        //    ViewObject vo = iter.getViewObject();
      //       System.out.println("here i am : "+p1Pswrd);
        ADFUtils.setBoundAttributeValue("Passwrd", p1Pswrd);
//        OperationBinding oper = ADFUtils.findOperation("Commit");
//        oper.execute();
//        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());
           
            this.v1Pswrd.resetValue();
            this.v2Pswrd.resetValue();
            this.pchngPswrdMismatch.setRendered(false);
            this.getVpopUp().cancel();
        }
    }

    public void cnclChngPswrdActionListener(ActionEvent actionEvent) {
        // Add event code here...
        this.pchngPswrdMismatch.setRendered(false);
        this.getVpopUp().cancel();
    }

    public void setPchngPswrdMismatch(RichOutputText pchngPswrdMismatch) {
        this.pchngPswrdMismatch = pchngPswrdMismatch;
    }

    public RichOutputText getPchngPswrdMismatch() {
        return pchngPswrdMismatch;
    }

    public String cancelSignupActn() {
        // Add event code here...
        ADFUtils.setBoundAttributeValue("UserId", "xxx");
        ADFUtils.findOperation("Rollback").execute();
        return "adfMenu_home";
    }

    public void setConfrmPopup(RichPopup confrmPopup) {
        this.confrmPopup = confrmPopup;
    }

    public RichPopup getConfrmPopup() {
        return confrmPopup;
    }

    public String popupOkayAction() {
        // Add event code here...
        this.getConfrmPopup().hide();
        return this.getConfrmGo();
    }
}
