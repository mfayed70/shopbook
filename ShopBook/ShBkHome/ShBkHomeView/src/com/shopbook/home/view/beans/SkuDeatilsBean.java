package com.shopbook.home.view.beans;

import com.shopbook.common.ui.ADFUtils;
import com.shopbook.common.ui.JSFUtil;
import com.shopbook.common.ui.JSFUtil;

import javax.faces.event.ActionEvent;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import oracle.adf.controller.ControllerContext;
import oracle.adf.controller.TaskFlowId;
import oracle.adf.model.BindingContext;

import oracle.adf.model.binding.DCIteratorBinding;

import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.layout.RichPanelGroupLayout;

import oracle.adf.view.rich.component.rich.output.RichOutputText;

import oracle.binding.BindingContainer;

import oracle.jbo.Key;
import oracle.jbo.Row;
import oracle.jbo.ViewObject;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;

import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;

import org.apache.myfaces.trinidad.component.UIXIterator;
import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.event.AttributeChangeEvent;
import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;

public class SkuDeatilsBean {
    
    private final String taskflowId = "sku-det-tf";
    private final String taskflowDocument = "/WEB-INF/sku-det-tf.xml";
    private String param="../shop/ProductPage?";
    private String xx;
    private String yy;
    private RichPopup infoPopup;

    public SkuDeatilsBean() {
    }

    public void setParam(String param) {
        this.param=param;
    }

    public String getParam() {
        return param;//+"pSkuCode="+this.getXx();
    }


    public void skuDetMethod(ActionEvent actionEvent) {
        // Add event code here...
//        List key = (List) actionEvent.getComponent().getAttributes().get("rowKey");
//        BindingContext bctx = BindingContext.getCurrent();
//        BindingContainer bindings = bctx.getCurrentBindingsEntry();
//        //get reference to tree binding by its ID in the PageDef
//        JUCtrlHierBinding treeBinding = (JUCtrlHierBinding) bindings.get("HmSkuColorsV");
//        
//        JUCtrlHierNodeBinding currentNode =  treeBinding.findNodeByKeyPath((List) key);
//        Row rw = currentNode.getRow();
//        Key rowkey = rw.getKey();
//        DCIteratorBinding iter = treeBinding.getDCIteratorBinding();
//        iter.setCurrentRowWithKey(rowkey.toStringFormat(true));
//        System.out.println("clr code "+iter.getCurrentRow().getAttribute("SkuClrCode"));
//this.hmSkuIterator.setRowKey();   
   this.xx = ADFUtils.evaluateEL("#{pageFlowScope.pSkuCode}").toString();
    this.setParam(param+"pSkuCode="+xx);
    this.setYy(ADFUtils.evaluateEL("#{pageFlowScope.pSkuClrCode}").toString());
    String zz = ADFUtils.evaluateEL("#{skus.LastPrice}").toString();
    String ww = "No";
    String aa = ADFUtils.evaluateEL("#{skus.OlpPrice}").toString();
    String bb = ADFUtils.evaluateEL("#{skus.ClrName}").toString();
        FacesContext fctx = FacesContext.getCurrentInstance();
        Map<String, Object> params = new HashMap<String, Object>();
         params.put("pSkuCode",xx);
         params.put("pSkuClrCode", yy);
         params.put("pSkuSzClrCode","");
         params.put("pSkuDetails", ww);
         params.put("pClrLprice",zz);
         params.put("pClrOprice",aa);
         params.put("pSzLprice",0.00);
         params.put("pSzOprice",0.00);
         params.put("pClrName",bb);
System.out.println(params.get(xx));         
//    String taskflowURL = ControllerContext.getInstance().getTaskFlowURL(false,
//         new TaskFlowId(taskflowDocument,taskflowId),params);
//    ExtendedRenderKitService erks = Service.getRenderKitService(fctx, 
//        ExtendedRenderKitService.class);    
//        StringBuilder script = new StringBuilder();
//         script.append("window.open(\""+taskflowURL+"\");");
//         erks.addScript(FacesContext.getCurrentInstance(),
//         script.toString()); 
    }

    public void ClrLinkActionListener(ActionEvent actionEvent) {
        // Add event code here...
        DCIteratorBinding iter = ADFUtils.findIterator("DetSkuColorsVIterator");
        String xx = ADFUtils.evaluateEL("#{sClr.SkuClrCode}").toString();
        iter.setCurrentRowWithKeyValue(xx);
//        DCIteratorBinding iter1 = ADFUtils.findIterator("DetSkuSizeColorsVIterator");  
//        String zz = ADFUtils.evaluateEL("#{sClr.MinSkuSzClrCode}").toString();
//                   System.out.println(zz);
//        iter1.executeQuery();
//                      iter1.setCurrentRowWithKeyValue(xx);
 RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());        
//RequestContext.getCurrentInstance().addPartialTarget(skuSzClrPgl);
        }

    public void setXx(String xx) {
        this.xx = xx;
    }

    public String getXx() {
        return xx;
    }

    public void setYy(String yy) {
        this.yy = yy;
    }

    public String getYy() {
        return yy;
    }

    public void setInfoPopup(RichPopup infoPopup) {
        this.infoPopup = infoPopup;
    }

    public RichPopup getInfoPopup() {
        return infoPopup;
    }
}
