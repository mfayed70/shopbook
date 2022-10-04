package com.shopbook.home.view.beans;

import com.shopbook.common.ui.ADFUtils;

import java.util.Iterator;
import java.util.List;

import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.data.RichListView;
import oracle.adf.view.rich.component.rich.output.RichOutputText;

import oracle.adfdt.model.objects.IteratorBinding;

import oracle.jbo.Key;

import oracle.jbo.Row;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;

import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.event.SelectionEvent;
import org.apache.myfaces.trinidad.model.RowKeySet;

public class ShippingTerms {
    private RichOutputText val;
    private RichListView shipTermLV;

    public ShippingTerms() {
    }

    public void singleSelectionListener(SelectionEvent selectionEvent) {
        // Add event code here...
        RowKeySet rksAdd = selectionEvent.getAddedSet();
        if (rksAdd.isEmpty())
            return;  // no selection
        Object oldRowKey = this.shipTermLV.getRowKey();
        try {
        if (rksAdd != null) {
            Iterator iter = rksAdd.iterator();
            if (iter != null && iter.hasNext()) {
                Object rowKey = iter.next();
                this.shipTermLV.setRowKey(rowKey);
 JUCtrlHierNodeBinding rowData = (JUCtrlHierNodeBinding)this.shipTermLV.getRowData();
this.shipTermLV.setRowKey(oldRowKey);
System.out.println(rowData.getCurrentRow().getAttribute("Value"));
            }
        }
        } finally {
            return;
        }
//    Object[] it = rksAdd.toArray();
//            // as this is for single selection there should only be one, but...
//            for (Object obj: (List) it[0]) {
//                Key k = (Key) obj;   // the object is the row key
//       Object[] kv = k.getKeyValues();  // get the key value for later
//          
        
 // strore the key value in a bean attribute: mLastSelectedOID is defined in the bean
//   mLastSelectedOID = (Integer) kv[0]; // store the key value (if the key has multiple parts you need to store them all)
//     System.out.println(rksAdd);
//    shipTermLV.setSelectedRowKeys(rksAdd);
//    RequestContext.getCurrentInstance().addPartialTarget(this.shipTermLV); 
//    Iterator iter = rksAdd.iterator();
//    JUCtrlHierNodeBinding rowData = (JUCtrlHierNodeBinding)shipTermLV.getRowData();
////    System.out.println(rowData.getRowKey().toString());
//    Row currentRow = rowData.getCurrentRow();
//    System.out.println(currentRow.getAttribute("Value"));
////    String xx = ADFUtils.evaluateEL("#{bindings.Value.inputValue}").toString();
////      this.val.setValue(xx);
//    System.out.println(this.val.getLocalValue());
//    RequestContext.getCurrentInstance().addPartialTarget(this.val);   
//                      
//}
    }

    public void setVal(RichOutputText val) {
        this.val = val;
    }

    public RichOutputText getVal() {
        return val;
    }

    public void setShipTermLV(RichListView shipTermLV) {
        this.shipTermLV = shipTermLV;
    }

    public RichListView getShipTermLV() {
        return shipTermLV;
    }

}
