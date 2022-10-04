package com.shopbook.shopadmin.view.beans;

import com.shopbook.common.ui.ADFUtils;

import javax.faces.event.ActionEvent;

import oracle.adf.view.rich.component.rich.input.RichSelectOneChoice;
import oracle.adf.view.rich.component.rich.output.RichOutputText;
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
public class DropHandlerBean {


    private RichInputText puserId;
    private RichInputText puserName;
    private RichInputText pfamilyName;
    private RichInputText pfirstName;
    private RichInputText padminShpCatCode;
    private RichInputText pshopCatSubCode;

    public DropHandlerBean() {
    }

    public DnDAction dropHandler(DropEvent dropEvent) {
        // Add event code here...
        RichTable table = (RichTable) dropEvent.getDragComponent();
        Transferable t = dropEvent.getTransferable();
        DataFlavor<RowKeySet> df = DataFlavor.getDataFlavor(RowKeySet.class, "copyAdmin");
        RowKeySet rks = t.getData(df);
        Iterator iter = rks.iterator();   
        if (iter.hasNext()) {
            List key = (List) iter.next();
            table.setRowKey(key);   
   RichPanelFormLayout panelFormLayout = (RichPanelFormLayout) dropEvent.getDropComponent();
            JUCtrlHierNodeBinding rowBinding = (JUCtrlHierNodeBinding) table.getRowData();
            Row DropRow = rowBinding.getRow();
             if (DropRow !=null) {
              puserId.resetValue();
              puserId.setValue(DropRow.getAttribute("UserId")); 
                       
            FacesContext fctx = FacesContext.getCurrentInstance();
             ExtendedRenderKitService erks =
             Service.getRenderKitService(fctx,
             ExtendedRenderKitService.class);
             erks.addScript(fctx,"AdfPage.PAGE.clearAllMessages();");             
            return DnDAction.COPY;
            } 
        }
        return DnDAction.NONE;
    }

    public void setPuserId(RichInputText puserId) {
        this.puserId = puserId;
    }

    public RichInputText getPuserId() {
        return puserId;
    }

    public void setPuserName(RichInputText puserName) {
        this.puserName = puserName;
    }

    public RichInputText getPuserName() {
        return puserName;
    }

    public void setPfamilyName(RichInputText pfamilyName) {
        this.pfamilyName = pfamilyName;
    }

    public RichInputText getPfamilyName() {
        return pfamilyName;
    }

    public void setPfirstName(RichInputText pfirstName) {
        this.pfirstName = pfirstName;
    }

    public RichInputText getPfirstName() {
        return pfirstName;
    }


    public void setPadminShpCatCode(RichInputText padminShpCatCode) {
        this.padminShpCatCode = padminShpCatCode;
    }

    public RichInputText getPadminShpCatCode() {
        return padminShpCatCode;
    }

    public void setPshopCatSubCode(RichInputText pshopCatSubCode) {
        this.pshopCatSubCode = pshopCatSubCode;
    }

    public RichInputText getPshopCatSubCode() {
        return pshopCatSubCode;
    }
}
