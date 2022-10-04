package com.shopbook.shopadmin.view.beans;

import java.io.IOException;

import java.io.UnsupportedEncodingException;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import java.util.Properties;
import java.util.Set;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class CreateAdsEmailBody {
    
   
    public static String inline(HashMap<Integer, String[]> valMap,String subject,String shopName, String address, String tel, String dmnName) {
        
        StringBuffer body  = new StringBuffer("<html><style>p.small {line-height: 0.7;}</style>");
                body.append("<h1>");//<span style=\"background-color: #ffff00;\">");
                body.append("<span style=\"background-color: #999999; color: #ffffff;\">");
                body.append(subject);
                body.append("</span></h1><p></p>");
                body.append("<p><strong>Dear valued customer,</strong></p>\n" + 
                "<p><h2>Catch our limited time offer for valued items, ready to serve you.</h2></p>");
                body.append("<style>table, th, td {padding:0 10px 0 10px;}table {border-spacing: 10px;}</style>");
                body.append("<table >");
                Map<String, String> inlineImages = new HashMap<String, String>();
                
        for(int j=1;j < valMap.size()+1;j++){
            if(j==1||j==4||j==7||j==10) {
        body.append("<tr>");
            } 
            inlineImages.put(valMap.get(j)[0], valMap.get(j)[3]); 
//             System.out.println("j is :"+valMap.get(j)[0]+"---"+valMap.get(j)[3]);
            body.append("<td style=\"padding:0 10px 0 10px;\" align=\"center\" valign=\"center\"><a href="+valMap.get(j)[1]+">");
            body.append("<img height=\"250\" width=\"250\" src=\"cid:"+valMap.get(j)[0]+"\"/></a><br/>");
            body.append("<p class=\"small\"><span style=\"color: #000080;\"><strong>"+valMap.get(j)[2]+"</strong></span><br>");
            body.append("<strong><span style=\"color: #808080;\"><span style=\"text-decoration: line-through;\">"+valMap.get(j)[4]+"</span>"+
                        "  "+valMap.get(j)[5]+"</strong></span></p><br></td>");

            if(j==3||j==6||j==9||j==12){
        body.append("</tr>");  
            }
        }
        body.append("</table>");
        body.append("<p>Thank you for being one of our customers.</p>");
        body.append("<p></p>");
        body.append("<p><strong>"+shopName+"</strong></p>");
        body.append("address : "+"<strong>"+address+"</strong>");
        body.append("<p></p>");
        body.append("Tel. : "+"<strong>"+tel+"</strong>");
        body.append("<p></p>");
        body.append("website : "+"<strong>"+dmnName+"</strong>");
        body.append("<p></p><p></p>&nbsp;&nbsp;&nbsp;");
        body.append("</html>");
        String _body = body.toString();
//        System.out.println(" email body is : "+_body);
//        String _email = null;
//        try {
//           _email = create(subject,_body,inlineImages);
//        } catch (Exception ex){
//            System.out.println("Could not send email.");
//            ex.printStackTrace();
//        }
        return _body;
    }
    
//    public static void senEmail(String host, String port,
//            final String userName, final String password,HashMap<Integer, String[]> toAddress,
//            String subject, String htmlBody,String fromUn,
//            Map<String, String> mapInlineImages) throws AddressException, MessagingException {
//        
//        Properties properties = new Properties();
//        properties.put("mail.smtp.host", host);
//        properties.put("mail.smtp.port", port);
//        properties.put("mail.smtp.socketFactory.port", port); //SSL Port
//        properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory"); 
//        properties.put("mail.smtp.port", port);
//        
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.user", userName);
//        properties.put("mail.password", password);
//
//        Authenticator auth = new Authenticator() {
//            public PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(userName, password);
//            }
//        };
//        Session session = Session.getInstance(properties, auth);
//        Message msg = new MimeMessage(session);
//
////        try {
////            msg.setFrom(new InternetAddress(userName,fromUn));
////        } catch (UnsupportedEncodingException e) {
////        }
//        
////        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
////        msg.setRecipients(Message.RecipientType.TO, toAddresses);
//        msg.setSubject(subject);
//        msg.setSentDate(new Date());
//        MimeBodyPart messageBodyPart = new MimeBodyPart();
//        messageBodyPart.setContent(htmlBody, "text/html");
//        Multipart multipart = new MimeMultipart();
//        multipart.addBodyPart(messageBodyPart);
//        
//        // adds inline image attachments
////        System.out.println("size :"+mapInlineImages.size());
//        if (mapInlineImages != null && mapInlineImages.size() > 0) {
//            Set<String> setImageID = mapInlineImages.keySet();
//             
//            for (String contentId : setImageID) {
//                MimeBodyPart imagePart = new MimeBodyPart();
//                imagePart.setHeader("Content-ID", "<" + contentId + ">");
//                imagePart.setDisposition(MimeBodyPart.INLINE);
////           System.out.println("image content Id :"+contentId);      
//                String imageFilePath = mapInlineImages.get(contentId);
//                try {
//                    System.out.println("img path : "+mapInlineImages.get(contentId));
//                    imagePart.attachFile(imageFilePath);
//                } catch (IOException ex) {
//                    ex.printStackTrace();
//                }
//        
//                multipart.addBodyPart(imagePart);
//            }
//        }
//        msg.setContent(multipart);
//        try {
//        //                System.out.println("UN :"+toAddress.get(i)[0]);
//        //                htmlBody.replace("{_userName}", toAddress.get(i)[0]);
//        //                messageBodyPart.setContent(htmlBody, "text/html");
//        //                        multipart.addBodyPart(messageBodyPart);
//        //                msg.setContent(multipart);
//            msg.setFrom(new InternetAddress(userName,fromUn));
//        } catch (UnsupportedEncodingException e) {
//        }
//        long b4 =  0; long aftr=0;
//        b4 =  System. currentTimeMillis(); 
//        for (int i=1;i<toAddress.size()+1;i++) {
//         InternetAddress[] toAddresses = { new InternetAddress(toAddress.get(i)[1]) };
//                msg.setRecipients(Message.RecipientType.TO, toAddresses);
//        Transport.send(msg);
//        }
//            aftr =  System. currentTimeMillis(); 
//            System.out.println(" time intrvl :"+(aftr-b4));
//    }
}
