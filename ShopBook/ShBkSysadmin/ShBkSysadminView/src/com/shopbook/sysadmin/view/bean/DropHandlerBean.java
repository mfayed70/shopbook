package com.shopbook.sysadmin.view.bean;

import com.shopbook.common.ui.ADFUtils;

import javax.faces.event.ActionEvent;

import oracle.adf.view.rich.component.rich.input.RichSelectOneChoice;
import oracle.adf.view.rich.dnd.DnDAction;
import oracle.adf.view.rich.event.DropEvent;

import java.util.Iterator;
import java.util.List;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.component.rich.input.RichInputText;
import oracle.adf.view.rich.component.rich.layout.RichPanelFormLayout;
import oracle.adf.view.rich.datatransfer.DataFlavor;
import oracle.adf.view.rich.datatransfer.Transferable;
import oracle.adf.view.rich.dnd.DnDAction;
import oracle.adf.view.rich.event.DropEvent;

import oracle.binding.BindingContainer;

import oracle.jbo.Row;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;

import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.model.RowKeySet;
import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;

/**
 * Drag and drop handler that handles the table row drop onto
 * an input form
 * @author Frank Nimphius (8/2012)
 */
public class DropHandlerBean {
    private RichSelectOneChoice brandCode;
    private RichInputText cmbmyCode;
    private RichSelectOneChoice mnfCode;
    private RichSelectOneChoice modelCode;
    private RichSelectOneChoice yer;

    public DropHandlerBean() {
    }
    //method referenced from the af:dropTarget
    public DnDAction dropHandler(DropEvent dropEvent) {
        // Add event code here...
        //access the drag source, the table to read the rowKey
        //representing the row
        RichTable table = (RichTable) dropEvent.getDragComponent();
        Transferable t = dropEvent.getTransferable();
        DataFlavor<RowKeySet> df = DataFlavor.getDataFlavor(RowKeySet.class, "copyRef");
        RowKeySet rks = t.getData(df);
        Iterator iter = rks.iterator();
        //sample is set up for dragging single row
        if (iter.hasNext()) {
            //get next selected row key
            List key = (List) iter.next();
            table.setRowKey(key);
            //get handle to drop component
 RichPanelFormLayout panelFormLayout = (RichPanelFormLayout) dropEvent.getDropComponent();
            //JUCtrlHierNodeBinding is the object in ADF that represents
            //a row in a table or a node in a tree. The object wraps the
            //actual table row object, which in the case of ADF BC is oracle.jbo.Row
            JUCtrlHierNodeBinding rowBinding = (JUCtrlHierNodeBinding) table.getRowData();
            //the row that is actually dragged from the ADF Faces table
            Row DropRow = rowBinding.getRow();
             if (DropRow !=null) {
        if (rowBinding.getViewObject().getName()=="BrandsV") { 
         brandCode.resetValue();
         brandCode.setValue(DropRow.getAttribute("BrandCode"));
    }
        else if (rowBinding.getViewObject().getName()=="ManufacturersV") {
         mnfCode.resetValue();
         mnfCode.setValue(DropRow.getAttribute("MnfCode"));
   }
        else if (rowBinding.getViewObject().getName()=="ModelsV") {
         modelCode.resetValue();
         modelCode.setValue(DropRow.getAttribute("ModelCode"));
        }
        else if (rowBinding.getViewObject().getName()=="YearsV") {
         yer.resetValue();
         yer.setValue(DropRow.getAttribute("Year"));
   }
      FacesContext fctx = FacesContext.getCurrentInstance();
ExtendedRenderKitService erks = Service.getRenderKitService(fctx, ExtendedRenderKitService.class);
       erks.addScript(fctx,"AdfPage.PAGE.clearAllMessages();");
      RequestContext.getCurrentInstance().addPartialTarget(dropEvent.getDropComponent().getParent().getParent());

        return DnDAction.COPY; 
  } 
        }
        return DnDAction.NONE;
    }
    
    public void setBrandCode(RichSelectOneChoice brandCode) {
        this.brandCode = brandCode;
    }

    public RichSelectOneChoice getBrandCode() {
        return brandCode;
    }

    public void setCmbmyCode(RichInputText cmbmyCode) {
        this.cmbmyCode = cmbmyCode;
    }

    public RichInputText getCmbmyCode() {
        return cmbmyCode;
    }

    public void setMnfCode(RichSelectOneChoice mnfCode) {
        this.mnfCode = mnfCode;
    }

    public RichSelectOneChoice getMnfCode() {
        return mnfCode;
    }

    public void setModelCode(RichSelectOneChoice modelCode) {
        this.modelCode = modelCode;
    }

    public RichSelectOneChoice getModelCode() {
        return modelCode;
    }

    public void setYer(RichSelectOneChoice yer) {
        this.yer = yer;
    }

    public RichSelectOneChoice getYer() {
        return yer;
    }
}
