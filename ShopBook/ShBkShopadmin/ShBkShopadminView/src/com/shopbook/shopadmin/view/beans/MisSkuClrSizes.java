package com.shopbook.shopadmin.view.beans;

import com.shopbook.common.ui.ADFUtils;

import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.adf.view.rich.component.rich.input.RichInputText;

import oracle.binding.OperationBinding;

import org.apache.myfaces.trinidad.context.RequestContext;

public class MisSkuClrSizes {
    private RichInputText clrLastprice;
    private RichInputText oldClrPrice;
    private RichInputText sizeLastPrice;
    private RichInputText sizeOldPrice;

    public MisSkuClrSizes() {
    }

    public void genMisdSkuClrSizes(ActionEvent actionEvent) {
        // Add event code here...
        OperationBinding oB = (OperationBinding)BindingContext.getCurrent().getCurrentBindingsEntry().get("insMissedSkuSizes");
        String xx = (String)ADFUtils.evaluateEL("#{bindings.SkuClrCode.inputValue}");
        oB.getParamsMap().put("vSkuClrCode", xx);
        System.out.println(xx);
        //  System.out.println(oB.isOperationEnabled());
        oB.execute();
  //      System.out.println(oB.getErrors()+"-"+oB.getResult());
        DCIteratorBinding iter = ADFUtils.findIterator("SkuSizeColorsVIterator");
        iter.getViewObject().executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());

    }

    public void createNewSKUClr(ActionEvent actionEvent) {
        // Add event code here...
        ADFUtils.findOperation("CreateInsertClr").execute();
        
    }

    public void setClrLastprice(RichInputText clrLastprice) {
        this.clrLastprice = clrLastprice;
    }

    public RichInputText getClrLastprice() {
        return clrLastprice;
    }

    public void setOldClrPrice(RichInputText oldClrPrice) {
        this.oldClrPrice = oldClrPrice;
    }

    public RichInputText getOldClrPrice() {
        return oldClrPrice;
    }

    public void setSizeLastPrice(RichInputText sizeLastPrice) {
        this.sizeLastPrice = sizeLastPrice;
    }

    public RichInputText getSizeLastPrice() {
        return sizeLastPrice;
    }

    public void setSizeOldPrice(RichInputText sizeOldPrice) {
        this.sizeOldPrice = sizeOldPrice;
    }

    public RichInputText getSizeOldPrice() {
        return sizeOldPrice;
    }

    public void clrLastPriceChange(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        if (valueChangeEvent.getOldValue()==null) {
            this.oldClrPrice.setValue(valueChangeEvent.getNewValue());    
        } 
        else if (valueChangeEvent.getOldValue()!=null &&
                 valueChangeEvent.getNewValue()==null) {
                     this.oldClrPrice.setValue(null);
                 }
        else {
        this.oldClrPrice.setValue(valueChangeEvent.getOldValue());
        }
    }

    public void sizeLastPriceChange(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        if (valueChangeEvent.getOldValue()==null) {
            this.sizeOldPrice.setValue(valueChangeEvent.getNewValue());    
        } 
        else if (valueChangeEvent.getOldValue()!=null &&
                 valueChangeEvent.getNewValue()==null) {
             this.sizeOldPrice.setValue(null);        
                 }
        else {
        this.sizeOldPrice.setValue(valueChangeEvent.getOldValue());
        }  
    }
}
