package com.shopbook.sysadmin.view.bean;

import com.shopbook.common.ui.ADFUtils;

import java.io.File;

import java.io.FileInputStream;

import java.io.FileOutputStream;

import java.io.IOException;

import java.nio.file.DirectoryStream;
import java.nio.file.Files;

import java.nio.file.LinkOption;
import java.nio.file.Path;

import java.nio.file.StandardCopyOption;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import oracle.adf.model.binding.DCIteratorBinding;


import oracle.adf.view.rich.dnd.DnDAction;
import oracle.adf.view.rich.event.DropEvent;

import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.event.ReturnEvent;



public class RefereshBean {

    public RefereshBean() {
    }

    public void categoriesReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
  
        DCIteratorBinding it = ADFUtils.findIterator("CategoriesVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
        
               }

    public void unitsReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("UnitsVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void sizeClassesReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("SizeClassesVIterator");
        it.executeQuery();
        System.out.println(ADFUtils.evaluateEL("#{viewScope.vSzClsCode}"));
        it.setCurrentRowWithKeyValue(ADFUtils.evaluateEL("#{viewScope.vSzClsCode}").toString());
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void BrandsReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("BrandsVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void manufReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("ManufacturersVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void modelsReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("ModelsVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void currPricesReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("CurrencyPricesVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void catSizesReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
//        DCIteratorBinding it = ADFUtils.findIterator("CategoriesVIterator");
//        it.executeQuery();
        DCIteratorBinding it1 = ADFUtils.findIterator("CatSizeClassesVIterator");
        it1.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void catRefReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
//        DCIteratorBinding it = ADFUtils.findIterator("CategoriesVIterator");
//        it.executeQuery();
        DCIteratorBinding it1 = ADFUtils.findIterator("CatMnfBrndMdlYersVIterator");
        it1.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void SysPrmtrsReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("SysParametersVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void SaveLnkSysPrmtrs(ActionEvent actionEvent) throws IOException {
        // Add event code here...
String ter = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/icons/NoImage.png");
//System.out.println("scope is "+ADFUtils.evaluateEL("#{pageFlowScope.vFileServPath}").toString());
     if (ADFUtils.getBoundAttributeValue("FileServerPath")==null ||
         ADFUtils.getBoundAttributeValue("FileServerPath").toString().isEmpty()) {
             
     }else { 
         if (ADFUtils.evaluateEL("#{pageFlowScope.vFileServPath}")== null ||
         ADFUtils.evaluateEL("#{pageFlowScope.vFileServPath}").toString().isEmpty()) {
//             System.out.println("file server path scope is null");
             File dir = new File(ADFUtils.getBoundAttributeValue("FileServerPath").toString());
                              System.out.println(dir.toString());
                                boolean sucessful = dir.mkdir();
                                if (sucessful) {
                                    File newDir = new File(dir.toString().concat("/Categories"));
                                 boolean newSucess = newDir.mkdir();
                                 if (newSucess) {
                                // start of my code
                                File myFile = new File(ter);
                                    FileInputStream in = null;
                                          FileOutputStream out = null;
                                          try {
                                             in = new FileInputStream(myFile);
                                             out = new FileOutputStream(dir+"/NoImage.png");
                                             
                                             int c;
                                             while ((c = in.read()) != -1) {
                                                out.write(c);
                                             }
                                          }finally {
                                             if (in != null) {
                                                in.close();
                                             }
                                             if (out != null) {
                                                out.close();
                 }
                     }
                                }
         }
         }
         else  {
             if(ADFUtils.getBoundAttributeValue("FileServerPath")==
             ADFUtils.evaluateEL("#{pageFlowScope.vFileServPath}").toString()) { 
             } else { System.out.println("both are not equal");
     File sourceLoc = new File(ADFUtils.evaluateEL("#{pageFlowScope.vFileServPath}").toString());
     File targetLoc = new File(ADFUtils.getBoundAttributeValue("FileServerPath").toString());
    copyFolder(sourceLoc,targetLoc);
               System.out.println(sourceLoc.getParent());
     deleteDirectoryRecursionJava6(sourceLoc);
             }
     }
     }    
      File dir = new File(ADFUtils.getBoundAttributeValue("FileServerPath").toString());
      boolean isDir = dir.isDirectory();
      System.out.println(isDir);
         
} 
    public static void copyFolder(File sourceFolder, File destinationFolder) throws IOException {
        if (sourceFolder.isDirectory())
               {
                   //Verify if destinationFolder is already present; If not then create it
                   if (!destinationFolder.exists())
                   {
                       destinationFolder.mkdir();
                  //     System.out.println("Directory created :: " + destinationFolder);
                   }
                    
                   //Get all files from source directory
                   String files[] = sourceFolder.list();
                    
                   //Iterate over all files and copy them to destinationFolder one by one
                   for (String file : files)
                   {
                       File srcFile = new File(sourceFolder, file);
                       File destFile = new File(destinationFolder, file);
                        
                       //Recursive function call
                       copyFolder(srcFile, destFile);
                   }
               }
               else
               {
                   //Copy the file content from one place to another
                   Files.copy(sourceFolder.toPath(), destinationFolder.toPath(), StandardCopyOption.REPLACE_EXISTING);
               //    System.out.println("File copied :: " + destinationFolder);
               }
    }
   
   public void deleteDirectoryRecursionJava6(File file) throws IOException {
  if (file.isDirectory()) {
    File[] entries = file.listFiles();
    if (entries != null) {
      for (File entry : entries) {
        deleteDirectoryRecursionJava6(entry);
      }
    }
  }
  if (!file.delete()) {
    throw new IOException("Failed to delete " + file);
  }
}

    public void CatTreeReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("CategoryHierarchyVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void UserAdminsReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("UsersVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
    }

    public void CitiesReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("CitiesVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void refNameModifyRLSNR(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("ReferencesNamesVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.
                    getComponent().getParent().getParent().getParent().getParent().getParent());
//        DCIteratorBinding it1 = ADFUtils.findIterator("BrandsVIterator");
//        it1.executeQuery();
//        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }
}
