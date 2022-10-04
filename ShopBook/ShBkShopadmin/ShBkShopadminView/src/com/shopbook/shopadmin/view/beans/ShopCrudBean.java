package com.shopbook.shopadmin.view.beans;

import com.shopbook.common.ui.ADFUtils;
import com.shopbook.common.ui.JSFUtil;

import java.awt.image.BufferedImage;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import javax.imageio.ImageIO;

import oracle.adf.view.rich.component.rich.input.RichInputText;

import org.apache.myfaces.trinidad.model.UploadedFile;

public class ShopCrudBean {
    private RichInputText bshopCode;
//    private RichInputText vlogo;
//    private RichInputText vrightImg;

    public ShopCrudBean() {
    }
    
    private UploadedFile logoFile;
    String logoPath;
    private UploadedFile rightImgFile;
    String rightImgPath;

    public void setRightImgFile(UploadedFile rightImgFile) {
        this.rightImgFile = rightImgFile;
    }

    public UploadedFile getRightImgFile() {
        return rightImgFile;
    }

    public void setRightImgPath(String rightImgPath) {
        this.rightImgPath = rightImgPath;
    }

    public String getRightImgPath() {
        return rightImgPath;
    }

    public void shopCrudSave(ActionEvent actionEvent) {
        // Add event code here...
        
        //System.out.println(JSFUtil.resolveExpression("#{pageFlowScope.shopCrudAction}")) ;
        if (JSFUtil.resolveExpression("#{pageFlowScope.shopCrudAction}").equals("new") &&
        ADFUtils.getBoundAttributeValue("ShopName")!=null)   {
        Object lvlValue = JSFUtil.resolveExpression("#{pageFlowScope.vLevel}");
        int lvlLength = String.valueOf(lvlValue).length();
        //System.out.println(lvlLength);
        lvlValue = (Integer)lvlValue + 2 - lvlLength ;
        String xx = "EG0000001";
        xx = xx.substring(0,9-lvlLength) ;
        xx = xx.concat(lvlValue.toString());
        //bshopCode.setValue(xx);
        ADFUtils.setBoundAttributeValue("ShopCode", xx);
        ADFUtils.setEL("#{pageFlowScope.rShopCode}", xx);
        } else {}
    }

    public void shopCrudCancel(ActionEvent actionEvent) {
        // Add event code here...
        ADFUtils.setEL("#{pageFlowScope.rShopCode}", "EG0000001");
    }
    
    public void setBshopCode(RichInputText bshopCode) {
        this.bshopCode = bshopCode;
    }

    public RichInputText getBshopCode() {
        return bshopCode;
    }
    public void setLogoFile(UploadedFile logoFile) {
        this.logoFile = logoFile;
    }

    public UploadedFile getLogoFile() {
        return logoFile;
    }

    public void setLogoPath(String logoPath) {
        this.logoPath = logoPath;
    }

    public String getLogoPath() {
        return logoPath;
    }

    public void logoChngValListener(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
    logoFile = (UploadedFile)valueChangeEvent.getNewValue();
        String TypeVal = logoFile.getContentType();
        String type = "PNG";
            if (logoFile.getContentType().equalsIgnoreCase("image/jpeg")) {
                type = "JPEG";
                TypeVal = ".jpeg";
            } else if (logoFile.getContentType().equalsIgnoreCase("image/png")) {
                type = "PNG";
                TypeVal = ".png";
            } else if (logoFile.getContentType().equalsIgnoreCase("image/bmp")) {
                type = "PNG";
                TypeVal = ".png";
            } else if (logoFile.getContentType().equalsIgnoreCase("image/gif")) {
                type = "GIF";
                TypeVal = ".gif";
            }
    String fileName = "logo"+TypeVal;
        try {
   InputStream inputstream = logoFile.getInputStream();
   BufferedImage input = ImageIO.read(inputstream);
    
     logoPath = ADFUtils.getBoundAttributeValue("FileServerPath").toString();
            if (!new File(logoPath).isDirectory()) {
                new File(logoPath).mkdir();
            }
     logoPath += "/shopData/";
            if (!new File(logoPath).isDirectory()) {
                new File(logoPath).mkdir();
            }            
 //    System.out.println(logoPath);
   File outputFile = new File(logoPath + fileName);
            
   ImageIO.write(input, type, outputFile);
   logoPath = outputFile.getAbsolutePath();
//    this.setLogoPath(outputFile.getAbsolutePath());
      System.out.println(logoPath);
        ADFUtils.setBoundAttributeValue("Logo",logoPath);
 //System.out.println("image name is : "+ADFUtils.getBoundAttributeValue("Logo"));
 // System.out.println(ADFUtils.getBoundAttributeValue("Logo"));
        //           System.out.println("Reading and writting done Succesfully");
        } catch (IOException e) {
            // TODO: Add catch c,ode
            e.printStackTrace();
        } 
    }
    

    public void rightImgValChngListener(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        rightImgFile = (UploadedFile)valueChangeEvent.getNewValue();
            String TypeVal = rightImgFile.getContentType();
            String type = "PNG";
                if (rightImgFile.getContentType().equalsIgnoreCase("image/jpeg")) {
                    type = "JPEG";
                    TypeVal = ".jpeg";
                } else if (rightImgFile.getContentType().equalsIgnoreCase("image/png")) {
                    type = "PNG";
                    TypeVal = ".png";
                } else if (rightImgFile.getContentType().equalsIgnoreCase("image/bmp")) {
                    type = "PNG";
                    TypeVal = ".png";
                } else if (rightImgFile.getContentType().equalsIgnoreCase("image/gif")) {
                    type = "GIF";
                    TypeVal = ".gif";
                }
        String rightFileName = "rightImage"+TypeVal;
 
        try {
        InputStream inputstream = rightImgFile.getInputStream();
        BufferedImage input = ImageIO.read(inputstream);
        
         rightImgPath = ADFUtils.getBoundAttributeValue("FileServerPath").toString();
         
            if (!new File(rightImgPath).isDirectory()) {
                new File(rightImgPath).mkdir();
            }
            rightImgPath += "/shopData/";
            if (!new File(rightImgPath).isDirectory()) {
                new File(rightImgPath).mkdir();
            } 
       //   System.out.println(rightImgPath);
        File outputFile = new File(rightImgPath + rightFileName);
                
        ImageIO.write(input, type, outputFile);
        rightImgPath = outputFile.getAbsolutePath();
        this.setRightImgPath(outputFile.getAbsolutePath());
       System.out.println("R image name is : "+rightImgPath);
      ADFUtils.setBoundAttributeValue("WebAddress", rightImgPath);
        //           System.out.println("Reading and writting done Succesfully");
        } catch (IOException e) {
            // TODO: Add catch c,ode
            e.printStackTrace();
        }    
    }

//    public void setVlogo(RichInputText vlogo) {
//        this.vlogo = vlogo;
//    }
//
//    public RichInputText getVlogo() {
//        return vlogo;
//    }
//
//    public void setVrightImg(RichInputText vrightImg) {
//        this.vrightImg = vrightImg;
//    }
//
//    public RichInputText getVrightImg() {
//        return vrightImg;
//    }
    
}
