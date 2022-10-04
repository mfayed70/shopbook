package com.shopbook.shopadmin.view.beans;

import com.shopbook.common.ui.ADFUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.util.ResetUtils;

import oracle.binding.BindingContainer;

import oracle.binding.OperationBinding;

import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.model.UploadedFile;

public class SkuClrImgBean {
    public SkuClrImgBean() {
    }
    String vImgCode= null;          
    String vImgSeq = null;
    String vSkuClrImgCode = null;
    String vImgPath = null;
    String vSkuClrCode = null;
    String vImgType = null;
    String vImgName = "No specific name";
    /**Method to upload file to actual path on Server*/
        private String uploadFile(UploadedFile file) {

            UploadedFile myfile = file;
            String path = null;
            if (myfile == null) {

            } else {
                // All uploaded files will be stored in below path
      //          path = "D://FileStore//" + myfile.getFilename();
        path = ADFUtils.evaluateEL("#{bindings.FileServerPath.inputValue}").toString();
        path+="/SKUs/";
        File extPath = new File(path);
                System.out.println("path : "+extPath);
                if (!extPath.isDirectory()) {
                    System.out.println("true");
                    extPath.mkdir();
                } 
                vSkuClrCode = ADFUtils.evaluateEL("#{bindings.SkuClrCode.inputValue}").toString();   
                    path = extPath.toString()+"/"+vSkuClrCode;
                    extPath = new File(path);
                    if(!extPath.isDirectory())  {
                        extPath.mkdir();
                    } else { }
                 vImgPath = extPath.toString()+"/";
//                 vSkuClrImgCode = ADFUtils.evaluateEL("#{bindings.SkuClrCode.inputValue}").toString();
//                 vImgCode="IMG";          
//                 vImgSeq = null;
//    String yy = ADFUtils.evaluateEL("#{bindings.SkuClrImagesVIterator.estimatedRowCount}").toString();
//                int i = Integer.parseInt(yy)+1;
                vImgCode = "I";             
 int i =Integer.parseInt(ADFUtils.evaluateEL("#{bindings.SkuClrImagesVIterator.estimatedRowCount}").toString());
                i++;
                SimpleDateFormat dateFormat = new SimpleDateFormat("HHmmss");
                String strDf  = dateFormat.format(new Date());
//                System.out.println(strDf);
                vImgCode = vImgCode+strDf;
            //    vImgSeq = String.valueOf(i); 
                vSkuClrImgCode=vSkuClrCode+vImgCode;
               
              //  vImgSeq = Integer.toString(i);
//                System.out.println(vSkuClrImgCode);
//                System.out.println(vImgSeq+" path :"+vImgPath+" img code :"+vImgCode);
                InputStream inputStream = null;
                
                String type = "PNG";
                    if (myfile.getContentType().equalsIgnoreCase("image/jpeg")) {
                        type = "JPEG";
                        vImgType = ".jpeg";
                    } else if (myfile.getContentType().equalsIgnoreCase("image/png")) {
                        type = "PNG";
                        vImgType = ".png";
                    } else if (myfile.getContentType().equalsIgnoreCase("image/bmp")) {
                        type = "PNG";
                        vImgType = ".png";
                    } else if (myfile.getContentType().equalsIgnoreCase("image/gif")) {
                        type = "GIF";
                        vImgType = ".gif";
                    }
                try {
                    FileOutputStream out = new FileOutputStream(vImgPath+vSkuClrImgCode+vImgType);
                    inputStream = myfile.getInputStream();
                    byte[] buffer = new byte[8192];
                    int bytesRead = 0;
                    while ((bytesRead = inputStream.read(buffer, 0, 8192)) != -1) {
                        out.write(buffer, 0, bytesRead);
                    }
                    out.flush();
                    out.close();
                } catch (Exception ex) {
                    // handle exception
                    ex.printStackTrace();
                } finally {
                    try {
                        inputStream.close();
                    } catch (IOException e) {
                    }
                }

            }
            //Returns the path where file is stored
            return (vImgPath+vSkuClrImgCode+vImgType);
        }
    /*****Generic Method to Get BindingContainer**/
     public BindingContainer getBindingsCont() {
         return BindingContext.getCurrent().getCurrentBindingsEntry();
     }

     /**
      * Generic Method to execute operation
      * */
     public OperationBinding executeOperation(String operation) {
         OperationBinding createParam = getBindingsCont().getOperationBinding(operation);
         return createParam;

     }

    public void insImgFilesVCE(ValueChangeEvent vce) {
        // Add event code here...
        if (vce.getNewValue() != null)   {
            UploadedFile fileVal = (UploadedFile) vce.getNewValue();
            String path = uploadFile(fileVal);
 //           System.out.println("seq : "+vImgSeq+ " img code : "+vImgCode);
    OperationBinding oB = executeOperation("upldSkuClrImg");
    oB.getParamsMap().put("imgName", vImgName);
    oB.getParamsMap().put("imgCode", vImgCode);
    oB.getParamsMap().put("imgType", vImgType);
    oB.getParamsMap().put("imgPath", vImgPath);
    oB.getParamsMap().put("imgSeq", vImgSeq);
    oB.getParamsMap().put("skuClrCode", vSkuClrCode);
    oB.getParamsMap().put("skuClrImgCode", vSkuClrImgCode);
    oB.execute();
    ResetUtils.reset(vce.getComponent());
        }
    }
  
    public void setVImgType(String vImgType) {
        this.vImgType = vImgType;
    }

    public String getVImgType() {
        return vImgType;
    }

    public void setVImgCode(String vImgCode) {
        this.vImgCode = vImgCode;
    }

    public String getVImgCode() {
        return vImgCode;
    }

    public void setVImgSeq(String vImgSeq) {
        this.vImgSeq = vImgSeq;
    }

    public String getVImgSeq() {
        return vImgSeq;
    }

    public void setVSkuClrImgCode(String vSkuClrImgCode) {
        this.vSkuClrImgCode = vSkuClrImgCode;
    }

    public String getVSkuClrImgCode() {
        return vSkuClrImgCode;
    }

    public void setVImgPath(String vImgPath) {
        this.vImgPath = vImgPath;
    }

    public String getVImgPath() {
        return vImgPath;
    }

    public void setVSkuClrCode(String vSkuClrCode) {
        this.vSkuClrCode = vSkuClrCode;
    }

    public String getVSkuClrCode() {
        return vSkuClrCode;
    }

    public void deleteCurrRecord(ActionEvent actionEvent) {
        // Add event code here...
        DCIteratorBinding iter = ADFUtils.findIterator("SkuClrImagesVIterator");
        String imgLoc = ADFUtils.evaluateEL("#{bindings.imgPath.inputValue}").toString();
        imgLoc += ADFUtils.evaluateEL("#{bindings.SkuClrImgCode.inputValue}").toString();
        imgLoc += ADFUtils.evaluateEL("#{bindings.ImgType.inputValue}").toString();
      //  System.out.println(imgLoc);
        File imgLocFIle = new File(imgLoc);      
        iter.getViewObject().removeCurrentRow();
       OperationBinding operation = (OperationBinding)BindingContext.getCurrent().getCurrentBindingsEntry().get("Commit");
        operation.execute();
       iter.getViewObject().executeQuery();
        imgLocFIle.delete();
   }

}
