package com.shopbook.home.view.beans;

import com.shopbook.common.ui.ADFUtils;

import com.shopbook.common.ui.JSFUtil;

import java.sql.Timestamp;

import java.text.DateFormat;

import java.text.SimpleDateFormat;

import java.util.Date;

import javax.faces.event.ActionEvent;

import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.faces.bi.component.gauge.UIRatingGauge;
import oracle.adf.view.rich.component.rich.input.RichInputText;

import oracle.binding.OperationBinding;

import oracle.jbo.Row;
import oracle.jbo.ViewObject;

import org.apache.myfaces.trinidad.context.RequestContext;

import org.apache.myfaces.trinidad.event.DisclosureEvent;

import org.eclipse.persistence.jpa.jpql.parser.DateTime;

public class SkuUserPostClass {
    private RichInputText postTxt;
    private UIRatingGauge userRate;

    public SkuUserPostClass() {
    }

    public void postMethod(ActionEvent actionEvent) {
        // Add event code here...
        DCIteratorBinding iter = ADFUtils.findIterator("SkuPostsVIterator");
        ViewObject vo = iter.getViewObject();
        Row nr = vo.createRow();
//    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
//    Date date = new Date();
//    Double y = Double.valueOf(dateFormat.format(date));
//    int i = y.intValue();
    nr.setAttribute("UserId", JSFUtil.getFromSession("userId"));
        nr.setAttribute("PostText", this.postTxt.getValue());
        nr.setAttribute("Rate", this.userRate.getValue());
//       nr.setAttribute("PostCode", i);
        nr.setAttribute("SkuCode", 
        (String)ADFUtils.evaluateEL("#{bindings.SkuCode.inputValue}"));        
        vo.insertRow(nr);
 //       System.out.println(vo.getQuery());
        OperationBinding oper = ADFUtils.findOperation("Commit");
        oper.execute();
        iter.executeQuery();
        postTxt.resetValue();
RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());   
    }

    public void setPostTxt(RichInputText postTxt) {
        this.postTxt = postTxt;
    }

    public RichInputText getPostTxt() {
        return postTxt;
    }

    public void deletePost(ActionEvent actionEvent) {
        // Add event code here...
        OperationBinding oper = ADFUtils.findOperation("Delete");
        oper.execute();
        OperationBinding oper1 = ADFUtils.findOperation("Commit");
        oper1.execute();
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());   
    }

    public void refreshPosts(ActionEvent actionEvent) {
        // Add event code here...
        OperationBinding oper = ADFUtils.findOperation("Commit");
        oper.execute();
        DCIteratorBinding iter = ADFUtils.findIterator("SkuPostsVIterator");
        ViewObject vo = iter.getViewObject();
//        OperationBinding oper = ADFUtils.findOperation("Rollback");
//        oper.execute();
        vo.executeQuery();
//        iter.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());   

    }

    public void refPosts(DisclosureEvent disclosureEvent) {
        // Add event code here...
        OperationBinding oper = ADFUtils.findOperation("Commit");
        oper.execute();
        DCIteratorBinding iter = ADFUtils.findIterator("SkuPostsVIterator");
        ViewObject vo = iter.getViewObject();
        //        OperationBinding oper = ADFUtils.findOperation("Rollback");
        //        oper.execute();
        vo.executeQuery();
        //        iter.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(disclosureEvent.getComponent().getParent().getParent());   

    }

    public void setUserRate(UIRatingGauge userRate) {
        this.userRate = userRate;
    }

    public UIRatingGauge getUserRate() {
        return userRate;
    }
}
