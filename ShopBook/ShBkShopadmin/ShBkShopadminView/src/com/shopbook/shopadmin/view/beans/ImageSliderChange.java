package com.shopbook.shopadmin.view.beans;

import com.shopbook.common.ui.ADFUtils;

import java.awt.image.BufferedImage;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.faces.event.ValueChangeEvent;

import javax.imageio.ImageIO;

import oracle.adf.view.rich.component.rich.input.RichInputText;

import org.apache.myfaces.trinidad.model.UploadedFile;

public class ImageSliderChange {
    private RichInputText imgSlide1;

    public ImageSliderChange() {
    }
    private UploadedFile slideFile;
    String slidePath;
    public void changeSlide1(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        Object xx = valueChangeEvent.getComponent().getAttributes().get("indx");
        slideFile = (UploadedFile) valueChangeEvent.getNewValue();
        String TypeVal = slideFile.getContentType();
    String type = null;
        
        if (slideFile.getContentType().equalsIgnoreCase("image/jpeg")) {
            type = "JPEG";
            TypeVal = ".jpeg";
        } else if (slideFile.getContentType().equalsIgnoreCase("image/png")) {
            type = "PNG";
            TypeVal = ".png";
        } else if (slideFile.getContentType().equalsIgnoreCase("image/bmp")) {
            type = "PNG";
            TypeVal = ".png";
        } else if (slideFile.getContentType().equalsIgnoreCase("image/gif")) {
            type = "GIF";
            TypeVal = ".gif";
        }
        String fileName = xx.toString()+TypeVal;
//        System.out.println("slide no : "+fileName);
        try {
        InputStream inputstream = slideFile.getInputStream();
        BufferedImage input = ImageIO.read(inputstream);
        
        slidePath = ADFUtils.getBoundAttributeValue("FileServerPath").toString();
            if (!new File(slidePath).isDirectory()) {
                new File(slidePath).mkdir();
            }
        slidePath += "slides/";
            if (!new File(slidePath).isDirectory()) {
                new File(slidePath).mkdir();
            }            
//           System.out.println("before :"+slidePath);
        File outputFile = new File(slidePath + fileName);
        ImageIO.write(input, type, outputFile);
        slidePath = outputFile.getAbsolutePath();
        this.setSlidePath(outputFile.getAbsolutePath());
//            System.out.println("after :"+slidePath);
        ADFUtils.setBoundAttributeValue(xx.toString(),"slides/"+fileName);
        } catch (IOException e) {
            // TODO: Add catch c,ode
            e.printStackTrace();
        } 
    }

    public void changeSlide2(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
    }

    public void changeSlide3(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
    }

    public void changeSlide4(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
    }

    public void changeSlide5(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
    }

    public void setSlideFile(UploadedFile slideFile) {
        this.slideFile = slideFile;
    }

    public UploadedFile getSlideFile() {
        return slideFile;
    }

    public void setSlidePath(String slidePath) {
        this.slidePath = slidePath;
    }

    public String getSlidePath() {
        return slidePath;
    }

    public void setImgSlide1(RichInputText imgSlide1) {
        this.imgSlide1 = imgSlide1;
    }

    public RichInputText getImgSlide1() {
        return imgSlide1;
    }
}
