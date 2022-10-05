package com.shopbook.sysadmin.view.bean;

import com.shopbook.common.ui.ADFUtils;
import com.shopbook.common.ui.JSFUtil;
import java.util.List;

import javax.faces.component.UIComponent;
import javax.faces.event.ActionEvent;

import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.input.RichInputText;

import oracle.adf.view.rich.component.rich.layout.RichPanelTabbed;

import oracle.adf.view.rich.component.rich.layout.RichShowDetailItem;

import oracle.jbo.Row;
import oracle.jbo.ViewObject;

import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.event.DisclosureEvent;
import org.apache.myfaces.trinidad.event.LaunchEvent;
import org.apache.myfaces.trinidad.event.ReturnEvent;

public class ReferenceNamingUpdate {
    private RichInputText enName1;
    private RichInputText arName1;
    private RichPanelTabbed panelTabbed;
    private RichInputText enName2;
    private RichInputText arName2;
    private RichInputText enName3;
    private RichInputText arName3;
    private RichShowDetailItem tab1;

    public ReferenceNamingUpdate() {
    }

    public void updateNames(ActionEvent actionEvent) {
        // Add event code here...
String _tab = (String) actionEvent.getComponent().getAttributes().get("tab");
    ViewObject vo = ADFUtils.findIterator("ReferencesV1Iterator").getViewObject();
    Row[] rEn = vo.getFilteredRows("Lang", "en");
    Row[] rAr = vo.getFilteredRows("Lang", "ar");
    for(Row rE : rEn) {        
    if("t1".equals(_tab)){
        if (this.enName1.getValue()!=null) {
        rE.setAttribute("BrPlural", this.enName1.getValue());
        }
    } else if("t2".equals(_tab)){
        if(this.enName2.getValue()!=null){
        rE.setAttribute("MdPlural", this.enName2.getValue());
        }
    } else if("t3".equals(_tab)){
        if(this.enName3.getValue()!=null){
        rE.setAttribute("MnPluran", this.enName3.getValue());
        }
    }
 }     
        for(Row rA : rAr) { 
        if("t1".equals(_tab)){
            if (this.arName1.getValue()!=null) {
            rA.setAttribute("BrPlural", this.arName1.getValue());
            }
        } else if("t2".equals(_tab)){
            if(this.arName2.getValue()!=null){
            rA.setAttribute("MdPlural", this.arName2.getValue());
            }
        } else if("t3".equals(_tab)){
            if(this.arName3.getValue()!=null){
            rA.setAttribute("MnPluran", this.arName3.getValue());
            }
        }
         }   
   ADFUtils.findOperation("Commit").execute();

    }
    public void disclosureLsnr(DisclosureEvent disclosureEvent) {
//        UIComponent myChildList = this.getPanelTabbed();
//        for (UIComponent child : myChildList.getChildren()) {
//            System.out.println("childs :"+child.getId());
//            RichShowDetailItem sdi1 = (RichShowDetailItem)child.findComponent("tab1");
//            RichShowDetailItem sdi2 = (RichShowDetailItem)child.findComponent("tab2");
//            
//            sdi2.setDisclosed(true);
//            sdi1.setDisclosed(false);
//            
//            sdi2.setDisclosed(false);
//            sdi1.setDisclosed(true);        
//        }        
    }

    public void setPanelTabbed(RichPanelTabbed panelTabbed) {
        this.panelTabbed = panelTabbed;
    }

    public RichPanelTabbed getPanelTabbed() {
        return panelTabbed;
    }

    public void setEnName1(RichInputText enName1) {
        this.enName1 = enName1;
    }

    public RichInputText getEnName1() {
        return enName1;
    }

    public void setArName1(RichInputText arName1) {
        this.arName1 = arName1;
    }

    public RichInputText getArName1() {
        return arName1;
    }

    public void setEnName2(RichInputText enName2) {
        this.enName2 = enName2;
    }

    public RichInputText getEnName2() {
        return enName2;
    }

    public void setArName2(RichInputText arName2) {
        this.arName2 = arName2;
    }

    public RichInputText getArName2() {
        return arName2;
    }

    public void setEnName3(RichInputText enName3) {
        this.enName3 = enName3;
    }

    public RichInputText getEnName3() {
        return enName3;
    }

    public void setArName3(RichInputText arName3) {
        this.arName3 = arName3;
    }

    public RichInputText getArName3() {
        return arName3;
    }

    public void setTab1(RichShowDetailItem tab1) {
        this.tab1 = tab1;
    }

    public RichShowDetailItem getTab1() {
        return tab1;
    }

    public void refNameModifyRLSNR(ReturnEvent returnEvent) {
        // Add event code here...
        DCIteratorBinding it = ADFUtils.findIterator("ReferencesNamesVIterator");
        ViewObject vo = it.getViewObject();
        vo.clearCache();
        vo.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(returnEvent.
                    getComponent().getParent().getParent().getParent().getParent().getParent());
        this.enName1.resetValue();
        this.enName2.resetValue();
        this.enName3.resetValue();
        this.arName1.resetValue();
        this.arName2.resetValue();
        this.arName3.resetValue();
    }
}
