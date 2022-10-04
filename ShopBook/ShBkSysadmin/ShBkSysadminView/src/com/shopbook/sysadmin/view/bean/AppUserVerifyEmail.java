package com.shopbook.sysadmin.view.bean;

import com.shopbook.common.ui.ADFUtils;

import java.security.SecureRandom;

public class AppUserVerifyEmail {
    public AppUserVerifyEmail() {
        super();
    }
    private int len;
    
    public String genKey(int len) {
    char[] ch = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".toCharArray();
            char[] c = new char[len];
            SecureRandom random = new SecureRandom();
            for (int i = 0; i < len; i++) {
              c[i] = ch[random.nextInt(ch.length)];
            }
        return new String(c);
    }
    
    public void sendVerificationEmail (String toUser, String[] toEmail, String to, String _url,String _genKey ) {
    //        String xx = genKey(128);
        StringBuffer body  = new StringBuffer("<html><head><title>Email Verification</title></head>");
        body.append("<body><b>");
        body.append("Dear  ");
        body.append(toUser);       
    //        body.append((String) ADFUtils.getBoundAttributeValue("Name"));
        body.append("</b>");
        body.append("<br><br>");
        body.append("Thank you for registering  onto Shopbook.");
        body.append("<br>");
        body.append("<br>");
        body.append("Please press ");
        body.append("<b>");
        body.append("<a href=");
        body.append((String) ADFUtils.getBoundAttributeValue("VerifyEmailUrl"));
        body.append(_genKey);
        body.append(">here</a>");
        body.append(" to verify your email.");
        body.append("</b>");
        //        System.out.println("link is :"+(String)ADFUtils.getBoundAttributeValue("VerifyEmailUrl"+(String)xx));
        body.append("<br><br>");
        body.append("<br><br>");
        body.append("Best Regards");
        body.append("<br>");
        body.append("Shopbook Team</b>");
        body.append("</body></html>");

        SendEmail verifEmail = new SendEmail();
        verifEmail.setBody(body.toString());
        verifEmail.setSmtpHostServer((String) ADFUtils.getBoundAttributeValue("SmtpHost"));
        verifEmail.setSmtpHostPort(String.valueOf(ADFUtils.getBoundAttributeValue("SmtpPort")));
        verifEmail.setFromEmail((String) ADFUtils.getBoundAttributeValue("ShopAdminEmail"));
        verifEmail.setPaswrd((String) ADFUtils.getBoundAttributeValue("ShopAdminPasswrd"));
        String toEml = (String) ADFUtils.getBoundAttributeValue("UserId");

        String[] _toEmail = {toEml};
        verifEmail.setToEmail(toEmail);
        verifEmail.setSubject("Shopbook User Email verification");
        verifEmail.sendSsl();
    }
    public static void main(String[] args) {
        AppUserVerifyEmail appUserVerifyEmail = new AppUserVerifyEmail();
    }

    public void setLen(int len) {
        this.len = len;
    }

    public int getLen() {
        return len;
    }

}
