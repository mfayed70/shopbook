package com.shopbook.sysadmin.view.bean;

import com.shopbook.common.ui.ADFUtils;

import java.awt.image.BufferedImage;

import java.io.File;

import java.io.IOException;
import java.io.InputStream;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.Date;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;

import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;

import javax.imageio.ImageIO;

import oracle.adf.view.rich.component.rich.input.RichInputText;

import oracle.binding.OperationBinding;

import org.apache.myfaces.trinidad.model.UploadedFile;

public class ReadImageBean {
   private RichInputText catImgName;

    public void setCatImgName(RichInputText catImgName) {
        this.catImgName = catImgName;
    }
    
    public RichInputText getCatImgName() {
        return catImgName;
    }

    public ReadImageBean() {
    }
 private UploadedFile myFile;
 String imagePath;

    public void fileInputValChngListner(ValueChangeEvent valueChangeEvent) {
      // Add event code here...
     //   System.out.println(myFile.getFilename().);
     myFile = (UploadedFile)valueChangeEvent.getNewValue();
  //  String path = "D://sample//" ;
    String fileName = myFile.getFilename();
        System.out.println(fileName);
    String TypeVal = myFile.getContentType();
    String type = "PNG";
        if (myFile.getContentType().equalsIgnoreCase("image/jpeg")) {
            type = "JPEG";
            TypeVal = ".jpeg";
        } else if (myFile.getContentType().equalsIgnoreCase("image/png")) {
            type = "PNG";
            TypeVal = ".png";
        } else if (myFile.getContentType().equalsIgnoreCase("image/bmp")) {
            type = "PNG";
            TypeVal = ".png";
        } else if (myFile.getContentType().equalsIgnoreCase("image/gif")) {
            type = "GIF";
            TypeVal = ".gif";
        }
//     System.out.println(myFile.getFilename());
  //   UploadedFile file = this.getMyFile();
  DateFormat dateFormat = new SimpleDateFormat("yyMMdd_HHmmss");
             Date date = new Date();
             String dtTime = dateFormat.format(date);
             dtTime = dtTime.replace(" ", "_");
        String newName = null;
//          if (  ADFUtils.getBoundAttributeValue("CatCode").toString() != null) {
//          newName = ADFUtils.getBoundAttributeValue("CatCode").toString();
              newName =  dtTime + TypeVal;
//             System.out.println(newName); 
//             }
//          else { };
        try {
           InputStream inputstream = myFile.getInputStream();
           BufferedImage input = ImageIO.read(inputstream);
            
            String newPath = ADFUtils.getBoundAttributeValue("FileServerPath").toString();
            if (!new File(newPath).isDirectory()) {
                 new File(newPath).mkdir();
            }
             newPath += "/Categories/";
           if (!new File(newPath).isDirectory()) {
                new File(newPath).mkdir();
           }          
           // System.out.println(newPath);
           File outputFile = new File(newPath + newName);
            
           ImageIO.write(input, type, outputFile);
           imagePath = outputFile.getAbsolutePath();
            this.setImagePath(outputFile.getAbsolutePath());
       //     System.out.println(imagePath);
        ADFUtils.setBoundAttributeValue("CatImgName",imagePath);
//          this.setCatImgName("ffff");
//           catImgName.setValue(imagePath);
//         System.out.println("image name is : "+ADFUtils.getBoundAttributeValue("CatImgName"));
           ADFUtils.setBoundAttributeValue("CatImgType",TypeVal);
//        System.out.println(ADFUtils.getBoundAttributeValue("CatImgName"));
//           System.out.println("Reading and writting done Succesfully");
       } catch (IOException e) {
            // TODO: Add catch c,ode
            e.printStackTrace();
        } 
    }
    
    public void setMyFile(UploadedFile myFile) {
        this.myFile = myFile;                                       
    }

    public UploadedFile getMyFile() {
        return myFile;
    }
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void RollBackLink(ActionEvent actionEvent) {
       // String catAction = "edit";
        if 
        (/*ADFUtils.evaluateEL("#{pageFlowScope.categoryAction}").toString().equals("new") && */
        (ADFUtils.getBoundAttributeValue("CatImgName")==null || 
           (ADFUtils.getBoundAttributeValue("CatImgName").toString().isEmpty())) )
   {
       //     System.out.println(ADFUtils.evaluateEL("#{pageFlowScope.categoryAction}").toString());
            
        } else { 
//        System.out.println("It's not Okay so far...");
//        System.out.println(ADFUtils.getBoundAttributeValue("CatImgName")); 
        if (( ADFUtils.getBoundAttributeValue("CatImgName") != 
             ADFUtils.evaluateEL("#{pageFlowScope.vCatImgName}").toString())&& 
            (!ADFUtils.evaluateEL("#{pageFlowScope.vCatImgName}").toString().equals("D:\\shopbook\\NoImage.png") ) ) {
       // File imageFile = new File (ADFUtils.getBoundAttributeValue("CatImgName").toString());
            File imageFile = new File (ADFUtils.getBoundAttributeValue("CatImgName").toString());
        imageFile.delete(); 
        } else { 
       //     System.out.println("No change to delete from Cancel");
            }
        }
    }

    public void saveLink(ActionEvent actionEvent) {
        // Add event code here...
//        System.out.println(ADFUtils.evaluateEL("#{pageFlowScope.vCatImgName}").toString());
//        System.out.println(ADFUtils.getBoundAttributeValue("CatImgName"));
//        if    (ADFUtils.getBoundAttributeValue("CatImgName")== null ||
//           (ADFUtils.getBoundAttributeValue("CatImgName").toString().isEmpty())){
//            System.out.println("Done");
//        }
        if (ADFUtils.evaluateEL("#{pageFlowScope.categoryAction}").toString().equals("new") ||
            (ADFUtils.getBoundAttributeValue("CatImgName")== null) || 
           (ADFUtils.getBoundAttributeValue("CatImgName").toString().isEmpty()) ){
            
        } else {
        if ( ADFUtils.getBoundAttributeValue("CatImgName").toString() != 
             ADFUtils.evaluateEL("#{pageFlowScope.vCatImgName}").toString() && 
            (!ADFUtils.evaluateEL("#{pageFlowScope.vCatImgName}").toString().equals("D:\\shopbook\\NoImage.png") ) ) {
        File oldImgFile = new File (ADFUtils.evaluateEL("#{pageFlowScope.vCatImgName}").toString());
        if (!oldImgFile.getAbsolutePath().equals("D:\\shopbook\\NoImage.png")) {
        oldImgFile.delete();
        } else System.out.println(ADFUtils.evaluateEL("#{pageFlowScope.vCatImgName}").toString());
        } else System.out.println("No change to delete from save");
        }
    
    }

    public void DeleteCatCrudRecord(ActionEvent actionEvent) {
        // Add event code here...
       if ((ADFUtils.getBoundAttributeValue("CatImgName")== null) || 
           (ADFUtils.getBoundAttributeValue("CatImgName").toString().isEmpty())) {
       OperationBinding oper = ADFUtils.findOperation("Delete");
            oper.execute(); 
            } else {
               File delImgFile = new File (ADFUtils.getBoundAttributeValue("CatImgName").toString()); 
               OperationBinding oper = ADFUtils.findOperation("Delete");
                    oper.execute();
           if (oper.getErrors().isEmpty()) {
               delImgFile.delete();
           }
           }
           }
    }
