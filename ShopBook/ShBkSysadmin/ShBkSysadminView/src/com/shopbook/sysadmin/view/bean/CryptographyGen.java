package com.shopbook.sysadmin.view.bean;

import com.shopbook.common.ui.ADFUtils;
import com.shopbook.common.ui.JSFUtil;
import java.security.SecureRandom;
import javax.faces.event.ActionEvent;
import java.math.BigInteger; 
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException;

import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.input.RichInputText;
import org.apache.myfaces.trinidad.context.RequestContext;

public class CryptographyGen {

    private RichPopup infoMsgPopup;

    public CryptographyGen() {
    }

    public void encryptThisString(ActionEvent actionEvent) {
        // Add event code here...
        AppUserVerifyEmail newAdmin = new AppUserVerifyEmail();
        String toUser = (String)ADFUtils.getBoundAttributeValue("UserName");
        String toEmail = (String)ADFUtils.getBoundAttributeValue("UserId");
        ADFUtils.setBoundAttributeValue("Active", "S");
        String _vrfyEmail = (String) ADFUtils.getBoundAttributeValue("VerifyEmailUrl");
            String[] _toEmail = {toEmail};
            String genKey = newAdmin.genKey(128);
            ADFUtils.setBoundAttributeValue("OneTimeCode", genKey);
        newAdmin.sendVerificationEmail(toUser, _toEmail,"toV", _vrfyEmail,genKey);
 RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());
        }

    public String crudUserAdminSave() {
        // Add event code here...
        String _action = JSFUtil.resolveExpressionAsString("#{pageFlowScope.userAdminsAction}");
        if ("new".equals(_action)) {
            AppUserVerifyEmail newAdmin = new AppUserVerifyEmail();
            String toUser = (String)ADFUtils.getBoundAttributeValue("UserName");
            String toEmail = (String)ADFUtils.getBoundAttributeValue("UserId");
            ADFUtils.setBoundAttributeValue("Active", "S");
            String _vrfyEmail = (String) ADFUtils.getBoundAttributeValue("VerifyEmailUrl");
                String[] _toEmail = {toEmail};
                String genKey = newAdmin.genKey(128);
                ADFUtils.setBoundAttributeValue("OneTimeCode", genKey);
            newAdmin.sendVerificationEmail(toUser, _toEmail,"toV", _vrfyEmail,genKey);

            RichPopup.PopupHints hint = new RichPopup.PopupHints();
            this.infoMsgPopup.show(hint);
            return null;
        } else {
            RichPopup.PopupHints hint = new RichPopup.PopupHints();
             this.infoMsgPopup.show(hint);
            return "toSave";
        }
    }

    public void setInfoMsgPopup(RichPopup infoMsgPopup) {
        this.infoMsgPopup = infoMsgPopup;
    }

    public RichPopup getInfoMsgPopup() {
        return infoMsgPopup;
    }

    public String infoMsgPopupOkay() {
        // Add event code here...
        return "toSave";
    }
}
