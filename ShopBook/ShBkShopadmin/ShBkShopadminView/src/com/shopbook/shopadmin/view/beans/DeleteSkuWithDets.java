package com.shopbook.shopadmin.view.beans;

import com.shopbook.common.ui.ADFUtils;

import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.event.DialogEvent;

import oracle.jbo.Row;
import oracle.jbo.RowSet;

public class DeleteSkuWithDets {
    public DeleteSkuWithDets() {
    }

    public void deleteSku(DialogEvent dialogEvent) {
        // Add event code here...
        if (dialogEvent.getOutcome()==DialogEvent.Outcome.yes) {
            System.out.println("I am yes");
        DCIteratorBinding iter = ADFUtils.findIterator("CrudSkusVIterator");
        Row row = iter.getCurrentRow();
        while (row != null ) {
            RowSet rSet = (RowSet)row.getAttribute("SkuPropDetsV");  
            System.out.println(rSet.getEstimatedRowCount()); 
        }
        } else { System.out.println("I am no"); }
    }
}
