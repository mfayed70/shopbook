package com.shopbook.sysadmin.view.bean;

import com.sun.mail.smtp.SMTPMessage;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

public class SendEmail {
    private String toEmail[], subject, body, smtpHostServer, fromEmail,
        paswrd, sslOrTls,smtpHostPort, fileName, imageEmail;
    
    public static void sendEmail(String host, String fromEmail, String fromPaswrd, Session session, String[] toEmail,
                                 String subject, String body) {
        try {
            SMTPMessage msg = new SMTPMessage(session);
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");
            msg.setFrom(new InternetAddress(fromEmail, "Shopbook"));
            msg.setReplyTo(InternetAddress.parse("no_reply@shopbook.com", false));
            msg.setSubject(subject, "UTF-8"); //   msg.setText(body, "UTF-8");
            msg.setContent(body, "text/html; charset=utf-8");
            msg.setSentDate(new Date());
            for (int i = 0; i < toEmail.length; i++) {
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail[i]));
            }
            System.out.println("Message is ready");
            //        Transport transport = null;

            try {
                System.out.println("Start connection");
                Transport transport = session.getTransport("smtp");
                transport.connect(host, fromEmail, fromPaswrd);
                transport.send(msg);
                transport.close();
            } catch (AddressException ae) {
                throw new MessagingException("Failed to send email : " + ae.getMessage(), ae);
            } catch (MessagingException e) {
                throw new MessagingException("Failed to send email : " + e.getMessage(), e);
            }
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }
    }

    public void sendSsl() {
        
        final String fromEmail = this.getFromEmail(); //"myemailid@gmail.com"; requires valid gmail id
        final String password = this.getPaswrd();//"mypassword";  correct password for gmail id
        final String[] toEmail = this.getToEmail();//"myemail@yahoo.com";  can be any email id 
                      
                        System.out.println("SSLEmail Start");
                        Properties props = new Properties();
                        props.put("mail.smtp.host", this.getSmtpHostServer()/*"smtp.gmail.com"*/); //SMTP Host
                        props.put("mail.smtp.socketFactory.port", this.getSmtpHostPort()/*"465"*/); //SSL Port
                        props.put("mail.smtp.socketFactory.class",
                                        "javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
                        props.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
                        props.put("mail.smtp.port", this.getSmtpHostPort()/*"465"*/); //SMTP Port
                        
                        Authenticator auth = new Authenticator() {
                                //override the getPasswordAuthentication method
                                protected PasswordAuthentication getPasswordAuthentication() {
                                        return new PasswordAuthentication(fromEmail, password);
                                }
                        };
                        
                        Session session = Session.getInstance(props, auth);
                        System.out.println("Session created");
        try {
    sendEmail(this.getSmtpHostServer(),fromEmail,password, session ,toEmail,this.getSubject(),this.getBody()/*"TLSEmail Testing Subject", "TLSEmail Testing Body"*/);
    //            sendAttachmentEmail(session, this.getToEmail() /*toEmail*/,
    //                                this.getSubject() /*"SSLEmail Testing Subject with Attachment"*/,
    //                                this.getBody() /*"SSLEmail Testing Body with Attachment"*/);
    //            sendImageEmail(session, this.getToEmail() /*toEmail*/,
    //                           this.getSubject() /*"SSLEmail Testing Subject with Image"*/,
    //                           this.getBody() /*"SSLEmail Testing Body with Image"*/);
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }

    }

    public void setToEmail(String[] toEmail) {
        this.toEmail = toEmail;
    }

    public String[] getToEmail() {
        return toEmail;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getSubject() {
        return subject;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getBody() {
        return body;
    }

    public void setSmtpHostServer(String smtpHostServer) {
        this.smtpHostServer = smtpHostServer;
    }

    public String getSmtpHostServer() {
        return smtpHostServer;
    }

    public void setFromEmail(String fromEmail) {
        this.fromEmail = fromEmail;
    }

    public String getFromEmail() {
        return fromEmail;
    }

    public void setPaswrd(String paswrd) {
        this.paswrd = paswrd;
    }

    public String getPaswrd() {
        return paswrd;
    }

    public void setSslOrTls(String sslOrTls) {
        this.sslOrTls = sslOrTls;
    }

    public String getSslOrTls() {
        return sslOrTls;
    }

    public void setSmtpHostPort(String smtpHostPort) {
        this.smtpHostPort = smtpHostPort;
    }

    public String getSmtpHostPort() {
        return smtpHostPort;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setImageEmail(String imageEmail) {
        this.imageEmail = imageEmail;
    }

    public String getImageEmail() {
        return imageEmail;
    }

}
