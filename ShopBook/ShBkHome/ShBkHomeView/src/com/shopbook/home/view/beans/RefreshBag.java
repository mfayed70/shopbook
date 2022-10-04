package com.shopbook.home.view.beans;

import com.shopbook.common.ui.ADFUtils;

import com.shopbook.common.ui.JSFUtil;

import java.math.BigDecimal;

import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.binding.DCIteratorBinding;

import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.input.RichInputNumberSpinbox;

import oracle.adf.view.rich.component.rich.input.RichInputText;
import oracle.adf.view.rich.component.rich.output.RichOutputFormatted;

import oracle.binding.OperationBinding;

import oracle.jbo.Row;
import oracle.jbo.ViewObject;

import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.event.PollEvent;

public class RefreshBag {
    private RichInputNumberSpinbox bagQty;
    private RichInputText reqQty;
    private RichPopup cashOnDeliveryOkPopup;

    public RefreshBag() {
    }
    public void refBag() {
        // Add event code here...
        OperationBinding oper = ADFUtils.findOperation("Commit");
        oper.execute();
        DCIteratorBinding iter = ADFUtils.findIterator("ShoppingDetVIterator");
        DCIteratorBinding iter1 = ADFUtils.findIterator("ShoppingMasterVIterator");
        iter1.executeQuery();
        ViewObject vo = iter.getViewObject();
        vo.executeQuery();
    }

    public void minusReqQtyLink(ActionEvent actionEvent) {
        // Add event code here...
        BigDecimal xx = (BigDecimal) JSFUtil.resolveExpression("#{item.bindings.StepQty.inputValue}");
        BigDecimal minXX = (BigDecimal) JSFUtil.resolveExpression("#{item.bindings.MinQty.inputValue}");
            BigDecimal aa;
            aa = (BigDecimal) this.reqQty.getValue();
                if (!aa.equals(minXX)) {
            aa = aa.subtract(xx);
            this.reqQty.setValue(aa); 
            ADFUtils.setEL("#{item.bindings.Qty.inputValue}", aa);
            ADFUtils.findOperation("Commit").execute();
        }//  System.out.println("qty :"+this.reqQty.getValue()+" step qty :"+xx+" min qty :"+minXX);
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());        

    }


    public void plusReqQtyLink(ActionEvent actionEvent) {
        // Add event code here...
        BigDecimal xx = (BigDecimal) JSFUtil.resolveExpression("#{item.bindings.StepQty.inputValue}");
        BigDecimal maxXX = (BigDecimal) JSFUtil.resolveExpression("#{item.bindings.MaxQty.inputValue}");
            BigDecimal bb;
            bb = (BigDecimal) this.reqQty.getValue();
                if (!bb.equals(maxXX)) {
            bb = bb.add(xx);
            this.reqQty.setValue(bb); 
            ADFUtils.setEL("#{item.bindings.Qty.inputValue}", bb);
        
            ADFUtils.findOperation("Commit").execute();
        }//System.out.println("qty :"+this.reqQty.getValue()+" step qty :"+xx+" max qty :"+maxXX);
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());        
    }

    public String cashOnDeliveruOkBtn() {
        // Add event code here...
        ADFUtils.setBoundAttributeValue("TransStatus", "R");
        ViewObject vo = ADFUtils.findIterator("ShoppingDetVIterator").getViewObject();
        Row[] selectedRows = vo.getFilteredRows("TransId", ADFUtils.getBoundAttributeValue("TransId"));
        for (Row r : selectedRows) {
            r.setAttribute("SkuStatus", "R");
        }
        this.cashOnDeliveryOkPopup.hide();
        return "adfMenu_home";
    }
    
    public void setBagQty(RichInputNumberSpinbox bagQty) {
        this.bagQty = bagQty;
    }

    public RichInputNumberSpinbox getBagQty() {
        return bagQty;
    }

    public void setReqQty(RichInputText reqQty) {
        this.reqQty = reqQty;
    }

    public RichInputText getReqQty() {
        return reqQty;
    }

    public void setCashOnDeliveryOkPopup(RichPopup cashOnDeliveryOkPopup) {
        this.cashOnDeliveryOkPopup = cashOnDeliveryOkPopup;
    }

    public RichPopup getCashOnDeliveryOkPopup() {
        return cashOnDeliveryOkPopup;
    }
}
