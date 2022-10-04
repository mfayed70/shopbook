package com.shopbook.shopadmin.view.beans;

import com.shopbook.common.ui.ADFUtils;

import com.shopbook.common.ui.JSFUtil;

import java.sql.CallableStatement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import java.sql.Timestamp;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;

import javax.faces.component.UIComponent;
import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.adf.view.rich.component.rich.data.RichListView;

import oracle.adf.view.rich.component.rich.input.RichSelectOneRadio;

import oracle.adf.view.rich.component.rich.nav.RichLink;

import oracle.binding.OperationBinding;

import oracle.jbo.Row;

import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.event.ReturnEvent;

import oracle.adf.model.binding.DCIteratorBinding;

import oracle.jbo.Key;
import oracle.jbo.ViewObject;
import oracle.jbo.server.DBTransaction;
import oracle.jbo.server.DBTransactionImpl;

public class RefreshBean {

    private RichListView skuPropBox;
    private RichLink addToAssLink;

    public RefreshBean() {
    }

    public void catPropsReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("ShopSubCatPropClassesVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
        //
        DCIteratorBinding itDet = ADFUtils.findIterator("ShopSubCatPropClassDetsVIterator");
        itDet.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void shopCrudNewReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        //System.out.println((JSFUtil.resolveExpression("#{pageFlowScope.rShopCode}")) );
        if ( /*(!JSFUtil.resolveExpression("#{pageFlowScope.rShopCode}").toString().isEmpty()) ||*/
            (!JSFUtil.resolveExpression("#{pageFlowScope.rShopCode}").equals("EG0000001"))) {
            Object oldLevel = ADFUtils.getBoundAttributeValue("Level");
            //        System.out.println(oldLevel);
            int xx = Integer.parseInt(oldLevel.toString()) - 1;
            ADFUtils.setBoundAttributeValue("Level", xx);
            //    ADFUtils.saveAndContinue();
            OperationBinding oper = ADFUtils.findOperation("Commit");
            oper.execute();

            DCIteratorBinding it = ADFUtils.findIterator("ShopsVIterator");
            it.executeQuery();
            RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
            DCIteratorBinding ittree = ADFUtils.findIterator("ShopsTreeVIterator");
            ittree.executeQuery();
            RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
        } else {
        }
    }

    public void shopCrudEditReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("ShopsVIterator");
        it.executeQuery();
        DCIteratorBinding it1 = ADFUtils.findIterator("ShopsTreeVIterator");
        it1.executeQuery();                              
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void editPrdctActionListener(ActionEvent actionEvent) {
        // Add event code here...
        String xx = (String) ADFUtils.evaluateEL("#{pageFlowScope.vShopSubCatCode}");
        DCIteratorBinding iter = ADFUtils.findIterator("SpShopSubCatsVIterator");
        iter.setCurrentRowWithKeyValue(xx);
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());
    }


    public void NewPrdctActionListener(ActionEvent actionEvent) {
        // Add event code here...
        // System.out.println(ADFUtils.evaluateEL("#{pageFlowScope.vShopProductCode}"));
        String xx = (String) ADFUtils.evaluateEL("#{pageFlowScope.vShopSubCatCode}");
        DCIteratorBinding iter = ADFUtils.findIterator("SpShopSubCatsVIterator");
        iter.setCurrentRowWithKeyValue(xx);
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());

    }

    public void NewPrdctReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("SpShopSubCatsVIterator");
        //it.refresh(Row.REFRESH_UNDO_CHANGES | Row.REFRESH_WITH_DB_FORGET_CHANGES);
        //it.getViewObject().executeQuery();
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
//        JSFUtil.setExpressionValue("#{pageFlowScope.vShopSubCatCode}", null);
    }

    public void editSkuBdataRlistener(ReturnEvent returnEvent) {
        // Add event code here...
        String xx = (String)ADFUtils.evaluateEL("#{bindings.SkuCode.inputValue}");
        DCIteratorBinding iter = ADFUtils.findIterator("CrudSkusVIterator");
        iter.setCurrentRowWithKeyValue(xx);
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
        
        DCIteratorBinding iter1 = ADFUtils.findIterator("SkuSizeColorsVIterator");
        iter1.getViewObject().executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
        
        DCIteratorBinding iter2 = ADFUtils.findIterator("SkuPropDetsVIterator");
        iter2.getViewObject().executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
   
    }

    public void newSkuBdataRlistener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding iter = ADFUtils.findIterator("CrudSkusVIterator");
     //   iter.setCurrentRowWithKeyValue(xx);
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
    }

    public void addEditColorReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        ViewObject voc = ADFUtils.findIterator("CrudSkuColorsVIterator").getViewObject();
        Row [] selectedRows = voc.getFilteredRows("LastPrice", null);
        for (Row r : selectedRows) {
            
            r.setAttribute("LastPrice",ADFUtils.getBoundAttributeValue("LastPrice") );
            r.setAttribute("OldPrice", ADFUtils.getBoundAttributeValue("OldPrice"));
        }
        ADFUtils.findOperation("Commit").execute();
        DCIteratorBinding iter = ADFUtils.findIterator("CrudSkuColorsVIterator");
        iter.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void addEditClrImgsReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding iter = ADFUtils.findIterator("CrudSkuClrImagesVIterator");
        iter.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
    }

    public void setSkuPropBox(RichListView skuPropBox) {
        this.skuPropBox = skuPropBox;
    }

    public RichListView getSkuPropBox() {
        return skuPropBox;
    }

    public void addEditSkuPropsReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding iter2 = ADFUtils.findIterator("SkuPropDetsVIterator");
        iter2.getViewObject().executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void createAsAssSaveActionListener(ActionEvent actionEvent) {
        // Add event code here...
        if (ADFUtils.evaluateEL("#{pageFlowScope.skuAssAction}").toString().equals("createAsAss")){
        ADFUtils.setBoundAttributeValue("Assembly", "Y");
        } else {
            
        }
    }

    public void addToAssemblyActionListener(ActionEvent actionEvent) {
        // Add event code here...
        DCIteratorBinding iter = ADFUtils.findIterator("SkuAddToAssembliesVIterator");
//        String currRow = iter.getCurrentRowWithKeyValue();
        OperationBinding oper = ADFUtils.findOperation("CreateWithParams");
        oper.execute();
        this.addToAssLink.setDisabled(true);
        iter.executeQuery();
//        iter.setCurrentRowWithKeyValue(currRow);
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());        
    }

    public void createAsAssReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
       // String xx = (String)ADFUtils.evaluateEL("#{bindings.SkuCode.inputValue}");
        DCIteratorBinding iter = ADFUtils.findIterator("SkuAssemblyCompsVIterator");
        DCIteratorBinding iter1 = ADFUtils.findIterator("SkuCompAssembliesVIterator");
        //iter.setCurrentRowWithKeyValue(xx);  
        iter.executeQuery();
        iter1.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
    }

    public void editSetCompsReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        String xx = (String)ADFUtils.evaluateEL("#{pageFlowScope.vSkuCode}");
        DCIteratorBinding iter = ADFUtils.findIterator("CrudSkusVIterator");
        iter.setCurrentRowWithKeyValue(xx);
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
  
    }

//    public void editCompSetsReturnListener(ReturnEvent returnEvent) {
//        // Add event code here...
//        String xx = (String)ADFUtils.evaluateEL("#{pageFlowScope.vSkuAssComp}");
//        DCIteratorBinding iter = ADFUtils.findIterator("CrudSkusVIterator");
//        iter.setCurrentRowWithKeyValue(xx);
//        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
//
//    }
    public void skuUnitsReturnListener (ReturnEvent returnEvent) {
        DCIteratorBinding iter = ADFUtils.findIterator("SkuUnitsVIterator");
        iter.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void catAdminReturnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("ShopCategoryAdminsVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
        
    }

    public void generalTermRtrnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("GeneralTermsVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void returnTermRtrnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("RtrnTermsVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());
    }

    public void shippingTermRtrnListener(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("ShippingTermsVIterator");
        it.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.getComponent().getParent().getParent());

    }

    public void setAddToAssLink(RichLink addToAssLink) {
        this.addToAssLink = addToAssLink;
    }

    public RichLink getAddToAssLink() {
        return addToAssLink;
    }

    public void checkJdbcAccess(ActionEvent actionEvent) {
        // Add event code here...
        Map<String, String> inlineImages = new HashMap<String, String>();
        HashMap<Integer,String[]> toAddress = new HashMap<Integer,String[]>();
        int i=0;int k = 0;
        Date dNow = new Date();
        SimpleDateFormat ft =  new SimpleDateFormat ("yyyy-MM-dd  HH:00:00");
        String xx = ft.format(dNow);
        System.out.println("Current Date: " + ft.format(dNow));
        try {
            Connection conn = Helper.getOracleConnection();
            Statement stmt= conn.createStatement();              
//            ResultSet rs=stmt.executeQuery("select * from offers where UNIX_TIMESTAMP(VALID_FRM_DATE) " +
//                                           "= (SELECT UNIX_TIMESTAMP(date_format(now(),'%Y-%m-%d %H')))");  
        ResultSet rs=stmt.executeQuery("select * from offers,sys_parameters where ALREADY_SEND = 'false'");
      // where VALID_FRM_DATE ='"+xx+"'
            while(rs.next()) {               
            System.out.println( rs.getTimestamp(4)+"  "+"----"+ rs.getLong(4)+"---"+ft.format(dNow)+"---");
              // get items images to be put in table
                try {
                    Statement stmnt_det = conn.createStatement();
                    ResultSet rs_det = stmnt_det.executeQuery("select * from offer_dets where OFFER_ID="+rs.getInt(1));
//                    System.out.println("query : "+"select * from offer_dets where OFFER_ID="+rs.getInt(1));
                    while(rs_det.next())  {
                        i++;
//                        System.out.println("image -"+rs_det.getString(1)+rs_det.getString(18));
                        inlineImages.put(rs_det.getString(1), rs_det.getString(18));
                    }
                    
                }catch (Exception e) {
        } 
           // get list of users
            try {
                Statement stmnt_usrs = conn.createStatement();
                ResultSet _usr_rs = stmnt_usrs.executeQuery("select * from users");
                while(_usr_rs.next())  {
                    k++;
                    String[] user = {_usr_rs.getString(2),_usr_rs.getString(1)};
                    toAddress.put(k, user);
                    System.out.println("users :"+toAddress.get(k)[1]);
                }
                
            }catch (Exception e) {
            }
//                //{"mohd_fayed@yahoo.com","mohamed.fayed@gmail.com"};
//
//                String[] user1 ={"Mohd Fayed","mohd_fayed@yahoo.com"};
//                String[] user2 ={"Mohamed Fayed","mohamed.fayed@gmail.com"};
//                toAddress.put(1, user1);
//                toAddress.put(2, user2);
                CreateAdsEmailBody sendEmail = new CreateAdsEmailBody();
//                System.out.println("Add size : "+toAddress.size());
                
//                sendEmail.senEmail("mail.mymr.health"
//                , "465", "registeration@mymr.health", "bIY,i_]jRAAK",
//           //     "mohamed.fayed@gmail.com"
//                     toAddress ,rs.getString(3),
//                rs.getString(11), rs.getString(29),inlineImages);
            // get list of users
             try {
                 Statement stmnt_end = conn.createStatement();
                stmnt_end.executeUpdate("update offers set ALREADY_SEND = 'true' where OFFER_MAST_ID="+rs.getInt(1));
             }catch (Exception e) {
             }
            conn.close(); 
        }
        } catch (Exception e) {
        }
    }
}
