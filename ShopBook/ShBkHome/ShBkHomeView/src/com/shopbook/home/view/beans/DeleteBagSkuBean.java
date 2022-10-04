package com.shopbook.home.view.beans;

import com.shopbook.common.ui.ADFUtils;

import javax.faces.event.ActionEvent;

import oracle.binding.OperationBinding;

import org.apache.myfaces.trinidad.context.RequestContext;

public class DeleteBagSkuBean {
    public DeleteBagSkuBean() {
    }

    public void deleteSku(ActionEvent actionEvent) {
        // Add event code here...
        OperationBinding oper = ADFUtils.findOperation("Delete");
        oper.execute();
        OperationBinding oper1 = ADFUtils.findOperation("Commit");
        oper1.execute();
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());   

    }
}
