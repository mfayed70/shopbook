package com.shopbook.home.view.beans;

import com.shopbook.common.ui.ADFUtils;

import com.shopbook.common.ui.JSFUtil;

import java.math.BigDecimal;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;


import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.input.RichInputNumberSpinbox;

import oracle.adf.view.rich.component.rich.nav.RichCommandNavigationItem;

import oracle.adf.view.rich.component.rich.nav.RichLink;

import oracle.adf.view.rich.component.rich.output.RichOutputText;

import oracle.binding.OperationBinding;

import org.apache.myfaces.trinidad.context.RequestContext;

public class AddToMyBagBean {
    private RichInputNumberSpinbox skuQty;
    private RichLink szName;
    private RichOutputText reqQty;
    private RichPopup addToBagPopup;
    //    public BigDecimal qty = (BigDecimal) (JSFUtil.resolveExpression("#{bindings.MinQty.inputValue}"));
    
    public AddToMyBagBean() {
    }

    public void minusReqQtyLink(ActionEvent actionEvent) {
        // Add event code here...
    BigDecimal xx = (BigDecimal) JSFUtil.resolveExpression("#{bindings.StepQty.inputValue}");

    BigDecimal minXX = (BigDecimal) JSFUtil.resolveExpression("#{bindings.MinQty.inputValue}");
        BigDecimal aa;
        aa = (BigDecimal) this.reqQty.getValue();
            if (!aa.equals(minXX)) {
        aa = aa.subtract(xx);
        this.reqQty.setValue(aa);   
    }
//        System.out.println("req qty- :"+this.reqQty.getValue());
    }

    public void plusReqQtyLink(ActionEvent actionEvent) {
        // Add event code here...
        BigDecimal xx = (BigDecimal) JSFUtil.resolveExpression("#{bindings.StepQty.inputValue}");
        BigDecimal maxXX = (BigDecimal) JSFUtil.resolveExpression("#{bindings.MaxQty.inputValue}");
            BigDecimal bb;
            bb = (BigDecimal) this.reqQty.getValue();
                if (!bb.equals(maxXX)) {
            bb = bb.add(xx);
            this.reqQty.setValue(bb);   
        }
//            System.out.println("req qty+ :"+this.reqQty.getValue());
    }
    
    public void addSkuToBag(ActionEvent actionEvent) {
        // Add event code here...
        String usrnm = JSFUtil.resolveExpressionAsString("#{request.remoteUser}");//#{request.userId}");
        if (usrnm!=null) {
        try {
        OperationBinding op = ADFUtils.findOperation("addToMyBag");
        String x1 = usrnm; //"mohd_fayed@yahoo.com";
        String x2 = (String)ADFUtils.evaluateEL("#{pageFlowScope.pSkuClrCode}");
        String x3 = (String)ADFUtils.evaluateEL("#{pageFlowScope.pSkuSzClrCode}");
        System.out.println("b4 - "+x1+"***"+x2 +"***"+x3);
        String x4 = (String)ADFUtils.evaluateEL("#{bindings.BasicUnit.inputValue}");
        BigDecimal x5 = (BigDecimal) this.reqQty.getValue();
        BigDecimal x6 = (BigDecimal) ADFUtils.evaluateEL("#{bindings.LastPrice.inputValue}");
        op.getParamsMap().put("pUserId", x1);
        op.getParamsMap().put("pSkuClrCode",x2);
        op.getParamsMap().put("pSizeCode",x3);
        op.getParamsMap().put("pUnitCode",x4);
        op.getParamsMap().put("pQty",x5);
        op.getParamsMap().put("pUnitPrice",x6);
        System.out.println("after "+x1+"--"+x2+"--"+x3+"--"+x4+"--"+x5+"--"+x6);

            if (x3==null || x3.isEmpty()) {
//                FacesContext ctx = FacesContext.getCurrentInstance();
//                FacesMessage fm = new FacesMessage(FacesMessage.SEVERITY_WARN, "Please choose size!.", "");
//                ctx.addMessage(getSzName().getClientId(ctx),fm); 
                JSFUtil.addFacesInformationMessage("Please choose size!.");
            } else {
//     System.out.println("2- "+x1+"--"+x2+"--"+x3+"--"+x4+"--"+x5+"--"+x6);
        op.execute();
//                JSFUtil.addFacesErrorMessage(op.getErrors().toString());
            RichPopup.PopupHints hint = new RichPopup.PopupHints();
                this.addToBagPopup.show(hint);
        System.out.println(op.getErrors());
                }
        } catch(Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }       
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());        
        }
    }

    public void setSkuQty(RichInputNumberSpinbox skuQty) {
        this.skuQty = skuQty;
    }

    public RichInputNumberSpinbox getSkuQty() {
        return skuQty;
    }

    public void setSzName(RichLink szName) {
        this.szName = szName;
    }

    public RichLink getSzName() {
        return szName;
    }

    public void setReqQty(RichOutputText reqQty) {
        this.reqQty = reqQty;
    }

    public RichOutputText getReqQty() {
        return reqQty;
    }

//    public void setQty(BigDecimal qty) {
//        this.qty = qty;
//    }
//
//    public BigDecimal getQty() {
//        return qty;
//    }

    public void setAddToBagPopup(RichPopup addToBagPopup) {
        this.addToBagPopup = addToBagPopup;
    }

    public RichPopup getAddToBagPopup() {
        return addToBagPopup;
    }

    public void addToBagOkay(ActionEvent actionEvent) {
        // Add event code here...
        this.addToBagPopup.hide();
    }
}
