package com.shopbook.home.view.beans;

import com.shopbook.common.ui.ADFUtils;
import com.shopbook.common.ui.JSFUtil;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;

import oracle.adf.view.rich.component.rich.input.RichSelectOneChoice;

import oracle.binding.OperationBinding;

import oracle.jbo.Row;
import oracle.jbo.ViewObject;

public class ServingOrders {

    public ServingOrders() {
    }

    public void skuStatusChange(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        UIComponent comp = valueChangeEvent.getComponent();
        comp.processUpdates(FacesContext.getCurrentInstance());
        ADFUtils.findOperation("Commit").execute();
    //    System.out.println("status :"+ADFUtils.getBoundAttributeValue("SkuStatus"));
        Long x = (Long)JSFUtil.resolveExpression("#{bindings.ServingOrderDetsV1Iterator.estimatedRowCount}");
        System.out.println("row count :"+x);
        ADFUtils.findIterator("ServingOrderDetsV1Iterator").executeQuery();
        ViewObject vo = ADFUtils.findIterator("ServingOrderDetsV1Iterator").getViewObject();
//  if the sku status is collected
        Row[] selectedRowsR = vo.getFilteredRows("SkuStatus", "R");
        Row[] selectedRowsC = vo.getFilteredRows("SkuStatus", "C");
        Row[] selectedRowsP = vo.getFilteredRows("SkuStatus", "P");
//        System.out.println("packed sku's :"+selectedRows.length);
        if (x==selectedRowsC.length) {
            ADFUtils.setBoundAttributeValue("TransStatus", "C");
            ADFUtils.findOperation("Commit").execute();
            ADFUtils.findIterator("ServingOrderMastV1Iterator").executeQuery();
        }     
//  if the sku status is packed
//        System.out.println("packed sku's :"+selectedRows.length);
        else if (x==selectedRowsP.length) {
            ADFUtils.setBoundAttributeValue("TransStatus", "P");
            ADFUtils.findOperation("Commit").execute();
            ADFUtils.findIterator("ServingOrderMastV1Iterator").executeQuery();
        }   
//  if one or more of SKUs is Received / Collected / Packed, not all SKUs        
    
       else if (selectedRowsR.length!=0 && selectedRowsR.length < x) {
            ADFUtils.setBoundAttributeValue("TransStatus", "R");
            ADFUtils.findOperation("Commit").execute();
            ADFUtils.findIterator("ServingOrderMastV1Iterator").executeQuery(); 
        }
        else if (selectedRowsR.length==0 &&selectedRowsC.length!=0 && selectedRowsC.length < x) {
            ADFUtils.setBoundAttributeValue("TransStatus", "C");
            ADFUtils.findOperation("Commit").execute();
            ADFUtils.findIterator("ServingOrderMastV1Iterator").executeQuery(); 
        }
//  if the sku status is shipped        
        
        
    }
}
