package com.shopbook.shopadmin.view.beans;

import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;

import com.shopbook.common.ui.*;

import java.math.BigDecimal;

import java.util.HashMap;

import javax.faces.context.FacesContext;

import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.data.RichListItem;
import oracle.adf.view.rich.component.rich.input.RichInputComboboxListOfValues;
import oracle.adf.view.rich.component.rich.input.RichInputDate;
import oracle.adf.view.rich.component.rich.input.RichInputText;
import oracle.adf.view.rich.component.rich.input.RichSelectBooleanCheckbox;
import oracle.adf.view.rich.component.rich.layout.RichShowDetailHeader;
import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.event.ReturnPopupDataEvent;

import oracle.binding.OperationBinding;

import oracle.jbo.Row;
import oracle.jbo.RowSet;
import oracle.jbo.RowSetIterator;
import oracle.jbo.ViewObject;

import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.event.ReturnEvent;
import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;


public class OffersBean {
    Boolean PriceCols;
    Boolean emailCols;
    private RichInputText skuCode;
    private RichInputText skuClrCode;
    private RichInputText skuClrSzCode;
    private RichInputComboboxListOfValues skuName;
    private RichSelectBooleanCheckbox adsEmailCheckBx;
    private RichInputText lastPrice;
    private RichInputDate adsEmailDate;
    String _offerType;
    String popupMsg;
    private RichPopup msgPopup;
    boolean lockCampaignHeader=false;
    boolean campaignSave;
    private RichShowDetailHeader headerPanel;
    private RichInputText _perc;
    private RichSelectBooleanCheckbox selectItemChkBx;
    private String _offerMastId;
    private RichPopup delCampaignPopup;
    private RichListItem offerMastListItem;

    public OffersBean() {
    }

    public void addItemsToCampaign(ActionEvent actionEvent) {
        // Add event code here...
        //       System.out.println("1---: "+this._perc.getValue());
        String _perc = (String) this._perc.getValue();
        String _adsEmlSendDt = (String) this.adsEmailDate.getValue();
        //        System.out.println("1---: "+_adsEmlSendDt);
        if (this._offerType.equals("I") && (_perc == null || _perc.equals("00.00"))) {
            this.setPopupMsg("Please enter value for Percentage");
            RichPopup.PopupHints hint = new RichPopup.PopupHints();
            this.msgPopup.show(hint);
        } else if (this._offerType.equals("D") && (_perc == null || _perc.equals("00.00"))) {
            this.setPopupMsg("Please enter value for Percentage");
            RichPopup.PopupHints hint = new RichPopup.PopupHints();
            this.msgPopup.show(hint);
        } else if (this.adsEmailCheckBx.getValue().equals(true) && _adsEmlSendDt == null) {
            this.setPopupMsg("Please enter a date for sending Ads Emails");
            RichPopup.PopupHints hint = new RichPopup.PopupHints();
            this.msgPopup.show(hint);
            // -----
        } 
//        else if (this._offerType.equals("E") && this.adsEmailCheckBx.getValue().equals(true) ) {
//                
//        }
        // -----
        else {
            ViewObject vo = ADFUtils.findIterator("OfferDetsIterator").getViewObject();
//            vo.executeQuery();
            Row[] sr = vo.getAllRowsInRange();
            System.out.println("no of records b4 :" + vo.getEstimatedRowCount());            
            if (vo.getEstimatedRowCount() == 0) {
                this.setLockCampaignHeader(true);
                this.adsEmailCheckBx.setDisabled(true);
                if (this._offerType.equals("E")) {
                    ADFUtils.findOperation("CreateItemsForEmail").execute();
                    this.selectItemChkBx.setDisabled(true);
                this.setCampaignSave(false);   
                }else {
                ADFUtils.findOperation("CreateInsertItems").execute();
                this.selectItemChkBx.setDisabled(false);
                this.setCampaignSave(false);
                }
            } else {
                Boolean emptyRowExist=false;
                for (Row r : sr) {
                    if (r.getAttribute("OldPrice")!=null ) {
//                        this.setLockCampaignHeader(true);
//                        this.adsEmailCheckBx.setDisabled(true);
 System.out.println("from add item row loop, old price != null : "+this.isCampaignSave());
//                        return;
                    } 
                    else  {
                        emptyRowExist=true; 
System.out.println("from add item row loop, else : "+this.isCampaignSave());  
                    }
                }

                if (!emptyRowExist) {
                    if (this._offerType.equals("E") && this.adsEmailCheckBx.getValue().equals(true)
                    && vo.getEstimatedRowCount()==12) {
                this.setPopupMsg("You have reached the maximum items to be exist in Ads Email.");
                RichPopup.PopupHints hint = new RichPopup.PopupHints();
                this.msgPopup.show(hint);    
                    } else {
                        if (this._offerType.equals("E")) {
                    ADFUtils.findOperation("CreateItemsForEmail").execute();
                    this.selectItemChkBx.setDisabled(true);
                this.setCampaignSave(false);
            }
                    else {
                    ADFUtils.findOperation("CreateInsertItems").execute();
                    this.selectItemChkBx.setDisabled(false);
                    this.setCampaignSave(false);
                    }
                }   } else {
                    this.setPopupMsg("Please select Item before adding new one.");
                    RichPopup.PopupHints hint = new RichPopup.PopupHints();
                    this.msgPopup.show(hint);         
                }
            }
        } System.out.println("from add item last : "+this.isCampaignSave());
    }

    public String saveOffer() {
        // Add event code here...
        String rtrn = null;
        String _defImgPath = (String)ADFUtils.getBoundAttributeValue("FileServerPath")+
                             (String)ADFUtils.getBoundAttributeValue("NoimagePath");
        String _currCode = (String) ADFUtils.getBoundAttributeValue("CurrCode");
        ViewObject vo = ADFUtils.findIterator("OfferDetsIterator").getViewObject(); 
//                System.out.println("email checkbox 1:"+this.adsEmailCheckBx.getValue());
        if (vo.getEstimatedRowCount()==0){
            this.setPopupMsg("Please choose at least one item in Campaign items.");
            RichPopup.PopupHints hint = new RichPopup.PopupHints();
            this.msgPopup.show(hint);  
        }
        
        else if ((this._offerType.equals("I") || this._offerType.equals("D") )&& !this.isCampaignSave()) {
            this.setPopupMsg("Please press show prices in Campaign first");
            RichPopup.PopupHints hint = new RichPopup.PopupHints();
            this.msgPopup.show(hint);
        } 
        else if (this._offerType.equals("D") && this.adsEmailCheckBx.getValue().equals(true)) {
            Row[] selectedRows = vo.getFilteredRows("Selected", true);
            if (selectedRows.length==0) {
                this.setPopupMsg("Please select Items to be send in Ads Email, max 12 item.");
                RichPopup.PopupHints hint = new RichPopup.PopupHints();
                this.msgPopup.show(hint);
            } else if(selectedRows.length>12) {
                this.setPopupMsg("Please select max 12 Items to be send in Ads Email, not more.");
                RichPopup.PopupHints hint = new RichPopup.PopupHints();
                this.msgPopup.show(hint);   
            }
            else { 
                this.setPopupMsg("You have selected "+selectedRows.length+" Items");
                RichPopup.PopupHints hint = new RichPopup.PopupHints();
                this.msgPopup.show(hint); 
//              System.out.println("selected Items are : "+selectedRows.length);                
//                if (this._offerType.equals("E") && this.adsEmailCheckBx.getValue().equals(true)){
               int i=0;
        String _http = (String) ADFUtils.getBoundAttributeValue("WebServerName");
            HashMap<Integer, String[]> inlineImg = new HashMap<>();
                   Row[] allRows = vo.getAllRowsInRange();
                   for (Row r : allRows) {
//    System.out.println("img path :"+(String)r.getAttribute("ImgPath"));
                       if((String)r.getAttribute("ImgPath")==null) {
                    r.setAttribute("ImgPath", _defImgPath);
//                    System.out.println("---- : "+r.getAttribute("TT"));
                       }
                       i++;
//System.out.println("old :"+r.getAttribute("OldPrice")+"-- temp : "+r.getAttribute("TempOldPrice")+"-- last : "+r.getAttribute("LastPrice"));                       
                       r.setAttribute("LastPrice", r.getAttribute("OldPrice"));
                       r.setAttribute("OldPrice", r.getAttribute("TempOldPrice"));
   String[] xx = new String[]{r.getAttribute("OfferDetId").toString(),
    _http+"ProductPage?p1="+r.getAttribute("SkuCode")+"&p2="+r.getAttribute("SkuClrCodeLnk")+"&p3="
    +r.getAttribute("ClrName")+"&p4=No",r.getAttribute("OfferName").toString(),r.getAttribute("ImgPath").toString(),
     r.getAttribute("OldPrice").toString()+" "+_currCode,r.getAttribute("LastPrice").toString()+" "+_currCode };
          inlineImg.put(i, xx);
   //    System.out.println("array :"+inlineImg.get(i)[0]+"--"+inlineImg.get(i)[1]+"--"+inlineImg.get(i)[2]+"--"
   //                   +inlineImg.get(i)[3]+"--"+inlineImg.get(i)[4]+"--"+inlineImg.get(i)[5]);
   CreateAdsEmailBody xxx = new CreateAdsEmailBody();
   String _Email = xxx.inline(inlineImg, ADFUtils.getBoundAttributeValue("Notes").toString(),// "Shop Book");
                    ADFUtils.getBoundAttributeValue("ShopNameInEmails").toString(),
ADFUtils.getBoundAttributeValue("StreetAdd1").toString().concat(ADFUtils.getBoundAttributeValue("StreetAdd2").toString()).concat(ADFUtils.getBoundAttributeValue("StreetAdd3").toString()),
            ADFUtils.getBoundAttributeValue("Tel").toString(),
            ADFUtils.getBoundAttributeValue("DomainName").toString());
   ADFUtils.setBoundAttributeValue("EmailBody", _Email);
   System.out.println("Lang is :");
//                       return "toSave";                       
                   }
                   return "toSave";
            }
        }
        else if (this._offerType.equals("E") && this.adsEmailCheckBx.getValue().equals(true)) {
            Row[] allRows = vo.getAllRowsInRange();
               int i=0;
        String _http = (String) ADFUtils.getBoundAttributeValue("WebServerName");
            HashMap<Integer, String[]> inlineImg = new HashMap<>();
        
               for (Row r : allRows) {
                   if((String)r.getAttribute("ImgPath")==null) {
                   r.setAttribute("ImgPath", _defImgPath);
                   //                    System.out.println("---- : "+r.getAttribute("TT"));
                   }
                   i++;
//System.out.println("old :"+r.getAttribute("OldPrice")+"-- temp : "+r.getAttribute("TempOldPrice")+"-- last : "+r.getAttribute("LastPrice"));
  
        r.setAttribute("LastPrice", r.getAttribute("OldPrice"));    
        r.setAttribute("OldPrice", r.getAttribute("TempOldPrice"));
                   
   String[] xx = new String[]{r.getAttribute("OfferDetId").toString(),
    _http+"ProductPage?p1="+r.getAttribute("SkuCode")+"&p2="+r.getAttribute("SkuClrCodeLnk")+"&p3="
    +r.getAttribute("ClrName")+"&p4=No",r.getAttribute("OfferName").toString(),r.getAttribute("ImgPath").toString(),
     r.getAttribute("OldPrice").toString()+" "+_currCode,r.getAttribute("LastPrice").toString()+" "+_currCode };
          inlineImg.put(i, xx);
//    System.out.println("array :"+inlineImg.get(i)[0]+"--"+inlineImg.get(i)[1]+"--"+inlineImg.get(i)[2]+"--"
//                   +inlineImg.get(i)[3]+"--"+inlineImg.get(i)[4]+"--"+inlineImg.get(i)[5]);
               }

               CreateAdsEmailBody adsEmail = new CreateAdsEmailBody();
             String _Email = adsEmail.inline(inlineImg, ADFUtils.getBoundAttributeValue("Notes").toString(),// "Shop Book");
                        ADFUtils.getBoundAttributeValue("ShopNameInEmails").toString(),
ADFUtils.getBoundAttributeValue("StreetAdd1").toString().concat(ADFUtils.getBoundAttributeValue("StreetAdd2").toString()).concat(ADFUtils.getBoundAttributeValue("StreetAdd3").toString()),
            ADFUtils.getBoundAttributeValue("Tel").toString(),
            ADFUtils.getBoundAttributeValue("DomainName").toString());                 
             ADFUtils.setBoundAttributeValue("EmailBody", _Email);
            rtrn = "toSave"; 
        }
        else {
          System.out.println("save status Last : "+this.isCampaignSave());                
            rtrn = "toSave";
        }

        return rtrn;
    }

    public void applyCampaignPrices(ActionEvent actionEvent) {
        // Add event code here...
        String perc = (String) ADFUtils.getBoundAttributeValue("Percentage");
        if (perc == null) {
            this.setPopupMsg("Please enter value for Percentage");
            RichPopup.PopupHints hint = new RichPopup.PopupHints();
            this.msgPopup.show(hint);
        } else {
            BigDecimal perc1 = new BigDecimal(perc);
            BigDecimal fullPerc = new BigDecimal("100");
            BigDecimal finalPerc = new BigDecimal("00.00");
            //        System.out.println("perc : "+perc1+"------ offer type :"+this._offerType);
            ViewObject vo = ADFUtils.findIterator("OfferDetsIterator").getViewObject();
            Row[] rws = vo.getAllRowsInRange();
          Boolean applyCampPriceRowIsEmpty = false;
            if (this._offerType.equals("I")) {
                finalPerc = perc1.add(fullPerc).divide(fullPerc);
                for (Row r : rws) {
                    if(vo.getEstimatedRowCount()==1 && r.getAttribute("OldPrice")==null) {
                        this.setPopupMsg("Please select Item before press show prices in Campaign");
                        RichPopup.PopupHints hint = new RichPopup.PopupHints();
                        this.msgPopup.show(hint);
                        this.setCampaignSave(false);
                    }
                    else {
                    if (r.getAttribute("OldPrice") == null ) {
                        r.remove();
                       applyCampPriceRowIsEmpty = true;
                    } else {
//                        System.out.println("perc : " + finalPerc + "------ offer type :" + this._offerType);
                        r.setAttribute("LastPrice",
                                       new BigDecimal(r.getAttribute("OldPrice").toString()).multiply(finalPerc));
//    System.out.println("from apply camp , row cnt >1 & old  price != null :"+this.campaignSave);
                    }
                        if(applyCampPriceRowIsEmpty == true) {
              this.setPopupMsg("There were records with no Items selected, so deleted.");
              RichPopup.PopupHints hint = new RichPopup.PopupHints();
              this.msgPopup.show(hint);
                        }
                      this.setCampaignSave(true);
                  } 
                }
//      System.out.println("from apply campaign : "+this.campaignSave);
            } 
            else if (this._offerType.equals("D")) {
                finalPerc = fullPerc.subtract(perc1).divide(fullPerc);
                for (Row r : rws) {
                    if(vo.getEstimatedRowCount()==1 && r.getAttribute("OldPrice")==null) {
                        this.setPopupMsg("Please select Item before press show prices in Campaign");
                        RichPopup.PopupHints hint = new RichPopup.PopupHints();
                        this.msgPopup.show(hint);
                        this.setCampaignSave(false);
                    }
                    else {
                    if (r.getAttribute("OldPrice") == null) {
                        r.remove();
                        applyCampPriceRowIsEmpty = true;
                    } else {
//                        System.out.println("perc : " + finalPerc + "------ offer type :" + this._offerType);
                        r.setAttribute("LastPrice",
                                       new BigDecimal(r.getAttribute("OldPrice").toString()).multiply(finalPerc));
                    }
  //                    System.out.println("row data : " + r.getAttribute("OldPrice"));
                  if(applyCampPriceRowIsEmpty == true) {
                  this.setPopupMsg("There were records with no Items selected, so deleted.");
                  RichPopup.PopupHints hint = new RichPopup.PopupHints();
                  this.msgPopup.show(hint);
                  }
                  this.setCampaignSave(true);
                }

            }
        } 
      }
    }
    
    public void sendEmailsChngLrnr(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        System.out.println("ads : "+valueChangeEvent.getNewValue());
        if (valueChangeEvent.getNewValue().equals(true)) {
            this.setEmailCols(true);
            this.adsEmailDate.setVisible(true);
        } else {
            this.setEmailCols(false);
            this.adsEmailDate.setVisible(false);   
        }
    }
    
    public void offerTypeValueChangeLsnr(ValueChangeEvent vce) {
        // Add event code here...
        System.out.println("val : "+vce.getNewValue());
        this.setOfferType(vce.getNewValue().toString());
        if(vce.getNewValue().equals("I") ){
            this.setPriceCols(true);
          this.setEmailCols(false);
          this.adsEmailDate.setVisible(false);
        this.setCampaignSave(false);
        } else if (vce.getNewValue().equals("D")) {
            this.setPriceCols(true);
            this.setEmailCols(false);
            this.adsEmailCheckBx.setDisabled(false);
            this.adsEmailCheckBx.setValue(false);
            this.setCampaignSave(false);    
            }      
        else if (vce.getNewValue().equals("E")){ 
            this.setPriceCols(false);
            this.adsEmailCheckBx.setValue(true);
            this.setEmailCols(true);
            this.adsEmailCheckBx.setDisabled(true);
            this.adsEmailDate.setVisible(true);
//            this._perc.setRequired(false);
//            this._perc.setVisible(false);
            }
//        System.out.println("var : "+JSFUtil.resolveExpressionAsBoolean("#{viewScope.OffersBean.oldPriceCol}"));
    }


    public void setPriceCols(Boolean PriceCols) {
        this.PriceCols = PriceCols;
    }

    public Boolean getPriceCols() {
        return PriceCols;
    }

    public void skuTypeValChngLsnr(ValueChangeEvent valueChangeEvent) {
        // Add event code here...

        System.out.println("new val : "+valueChangeEvent.getNewValue());
        if(valueChangeEvent.getOldValue().toString().equalsIgnoreCase("0")) {
//            System.out.println("sku val : "+this.skuCode.getValue());
            this.skuCode.setValue(null); this.skuName.setValue(null);
        }else if (valueChangeEvent.getOldValue().toString().equalsIgnoreCase("1")) {
//            System.out.println("sku val : "+this.skuCode.getValue());
            this.skuClrCode.setValue(null); this.skuName.setValue(null);
        }else if (valueChangeEvent.getOldValue().toString().equalsIgnoreCase("2")) {
//            System.out.println("sku val : "+this.skuCode.getValue());
            this.skuClrSzCode.setValue(null); this.skuName.setValue(null);
        }
    }
    
    public void delCampaign(ActionEvent actionEvent) {
        // Add event code here...
        this.setOfferMastId(JSFUtil.resolveExpression("#{item.bindings.OfferMastId.inputValue}").toString());
    System.out.println("offer Id : "+ _offerMastId);
        RichPopup.PopupHints hint = new RichPopup.PopupHints();
        this.delCampaignPopup.show(hint);
                       //JSFUtil.resolveExpression("#{item.bindings.OfferMastId.inputValue}")); //
//    OperationBinding oper = ADFUtils.findOperation("setCurrentRowWithKeyValue");
//    oper.getParamsMap().put("OfferMastId", JSFUtil.resolveExpression("#{item.bindings.OfferMastId.inputValue}"));
     DCIteratorBinding iter = ADFUtils.findIterator("OffersVIterator"); 
//     iter.setCurrentRowWithKeyValue(JSFUtil.resolveExpression("#{item.bindings.OfferMastId.inputValue}").toString());
//     Row row = iter.getCurrentRow();  
//
//         RowSet rSet = (RowSet)row.getAttribute("OfferDets");  
//         System.out.println("no of det rows : "+rSet.getEstimatedRowCount());
//        DCIteratorBinding iter1 = ADFUtils.findIterator("OfferDetsIterator");
//        iter1.executeQuery();
//        Row[] rr = iter1.getAllRowsInRange();
//        for(Row res : rr){
//             res.remove();
//         }
//        
//    ADFUtils.findOperation("DeleteOffer").execute();
    iter.executeQuery();
 RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());

    }
    
    public void delCampaignOptions(DialogEvent dialogEvent) {
        // Add event code here...
        if (dialogEvent.getOutcome()==DialogEvent.Outcome.yes) {
            System.out.println("I am yes :"+ this.getOfferMastId());
//            System.out.println("offer Id : "+JSFUtil.resolveExpression("#{item.bindings.OfferMastId.inputValue}")); //
            OperationBinding oper = ADFUtils.findOperation("setCurrentRowWithKeyValue");
            oper.getParamsMap().put("OfferMastId", this.getOfferMastId());
             DCIteratorBinding iter = ADFUtils.findIterator("OffersVIterator"); 
             iter.setCurrentRowWithKeyValue(this.getOfferMastId());
             Row row = iter.getCurrentRow();  

                 RowSet rSet = (RowSet)row.getAttribute("OfferDets");  
                 System.out.println("no of det rows : "+rSet.getEstimatedRowCount());
                DCIteratorBinding iter1 = ADFUtils.findIterator("OfferDetsIterator");
                iter1.executeQuery();
                Row[] rr = iter1.getAllRowsInRange();
                for(Row res : rr){
                     res.remove();
            }
            ADFUtils.findOperation("DeleteOffer").execute();
            iter.executeQuery();  
            ADFUtils.findOperation("Commit").execute();
RequestContext.getCurrentInstance().addPartialTarget(dialogEvent.getComponent().getParent().getParent());

                   } else { 
            System.out.println("I am no"); 
            }
    }
    
    public void setSkuCode(RichInputText skuCode) {
        this.skuCode = skuCode;
    }

    public RichInputText getSkuCode() {
        return skuCode;
    }

    public void setSkuClrCode(RichInputText skuClrCode) {
        this.skuClrCode = skuClrCode;
    }

    public RichInputText getSkuClrCode() {
        return skuClrCode;
    }

    public void setSkuClrSzCode(RichInputText skuClrSzCode) {
        this.skuClrSzCode = skuClrSzCode;
    }

    public RichInputText getSkuClrSzCode() {
        return skuClrSzCode;
    }

    public void setSkuName(RichInputComboboxListOfValues skuName) {
        this.skuName = skuName;
    }

    public RichInputComboboxListOfValues getSkuName() {
        return skuName;
    }

    public void setEmailCols(Boolean emailCols) {
        this.emailCols = emailCols;
    }

    public Boolean getEmailCols() {
        return emailCols;
    }

    public void setAdsEmailCheckBx(RichSelectBooleanCheckbox adsEmailCheckBx) {
        this.adsEmailCheckBx = adsEmailCheckBx;
    }

    public RichSelectBooleanCheckbox getAdsEmailCheckBx() {
        return adsEmailCheckBx;
    }

    public void setLastPrice(RichInputText lastPrice) {
        this.lastPrice = lastPrice;
    }

    public RichInputText getLastPrice() {
        return lastPrice;
    }

    public void setAdsEmailDate(RichInputDate adsEmailDate) {
        this.adsEmailDate = adsEmailDate;
    }

    public RichInputDate getAdsEmailDate() {
        return adsEmailDate;
    }


    public void setOfferType(String _offerType) {
        this._offerType = _offerType;
    }

    public String getOfferType() {
        return _offerType;
    }

    public void setPopupMsg(String popupMsg) {
        this.popupMsg = popupMsg;
    }

    public String getPopupMsg() {
        return popupMsg;
    }

    public void setMsgPopup(RichPopup msgPopup) {
        this.msgPopup = msgPopup;
    }

    public RichPopup getMsgPopup() {
        return msgPopup;
    }

    public void setLockCampaignHeader(boolean lockCampaignHeader) {
        this.lockCampaignHeader = lockCampaignHeader;
    }

    public boolean isLockCampaignHeader() {
        return lockCampaignHeader;
    }

    public void setHeaderPanel(RichShowDetailHeader headerPanel) {
        this.headerPanel = headerPanel;
    }

    public RichShowDetailHeader getHeaderPanel() {
        return headerPanel;
    }

    public void set_perc(RichInputText _perc) {
        this._perc = _perc;
    }

    public RichInputText get_perc() {
        return _perc;
    }

    public void setCampaignSave(boolean campaignSave) {
        this.campaignSave = campaignSave;
    }

    public boolean isCampaignSave() {
        return campaignSave;
    }

    public void setSelectItemChkBx(RichSelectBooleanCheckbox selectItemChkBx) {
        this.selectItemChkBx = selectItemChkBx;
    }

    public RichSelectBooleanCheckbox getSelectItemChkBx() {
        return selectItemChkBx;
    }

    public void setOfferMastId(String _offerMastId) {
        this._offerMastId = _offerMastId;
    }

    public String getOfferMastId() {
        return _offerMastId;
    }

    public void setDelCampaignPopup(RichPopup delCampaignPopup) {
        this.delCampaignPopup = delCampaignPopup;
    }

    public RichPopup getDelCampaignPopup() {
        return delCampaignPopup;
    }

    public void setOfferMastListItem(RichListItem offerMastListItem) {
        this.offerMastListItem = offerMastListItem;
    }

    public RichListItem getOfferMastListItem() {
        return offerMastListItem;
    }

    public void returnFrmDelete(ReturnEvent returnEvent) {
        // Add event code here...
        ADFUtils.findIterator("OffersVIterator").executeQuery();
    }
}
