package com.shopbook.home.view.beans;

import com.shopbook.common.ui.ADFUtils;
import com.shopbook.common.ui.JSFUtil;
import javax.faces.event.ActionEvent;

import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.input.RichInputText;
import com.shopbook.home.model.am.ShBkHomeAmImpl;

import java.util.Iterator;

import oracle.adf.model.BindingContext;

import oracle.adf.model.binding.DCIteratorBinding;

import oracle.adf.view.rich.component.rich.output.RichOutputText;
import oracle.adf.view.rich.event.PopupFetchEvent;

import oracle.binding.BindingContainer;

import oracle.binding.OperationBinding;

import oracle.jbo.Row;
import oracle.jbo.RowSet;
import oracle.jbo.RowSetIterator;
import oracle.jbo.ViewCriteria;
import oracle.jbo.ViewCriteriaManager;
import oracle.jbo.ViewObject;

import oracle.jbo.uicli.binding.JUCtrlHierBinding;

import org.apache.myfaces.trinidad.component.UIXIterator;
import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.model.RowKeySet;

public class HomeWhereConditionBean {
    private RichInputText serchInpTxt;
    private UIXIterator skuIterator;
    private RichPopup childCategoryPopup;
    String prntCatName;
    String prntCatCode;
    int _noOfRecs=0;
    private RichOutputText noRecordsFoundTxt;

    public HomeWhereConditionBean() {
    }

    public void searchExecuteWithParam(ActionEvent actionEvent) {
        // Add event code here...
        try {
            OperationBinding oper = ADFUtils.findOperation("ExecuteWithParams");
            String xx = null;
            if (serchInpTxt.getValue().toString().isEmpty()) {
                xx = "%";
            } else {
                xx = this.serchInpTxt.getValue().toString();
            }
            System.out.println(xx);
        oper.getParamsMap().put("pSearchTxt", xx);
        oper.execute();
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());

        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }
        
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());        
 
    }
    
    public void searchByCategory(ActionEvent actionEvent) {
        // Add event code here...
        prntCatCode = (String) actionEvent.getComponent().getAttributes().get("catCode");
       prntCatName = (String) actionEvent.getComponent().getAttributes().get("catName");
//        System.out.println("cat code :"+this.prntCatCode);
        if (!prntCatCode.equals("G0000")) {
    ViewObject voDet = ADFUtils.findIterator("IndexChildCategories1Iterator").getViewObject();
        voDet.setNamedWhereClauseParam("pParentCat", prntCatCode);
        voDet.executeQuery();
    JSFUtil.storeOnSession("prntCat", prntCatCode);
    RichPopup.PopupHints hints = new RichPopup.PopupHints();
        hints.add(RichPopup.PopupHints.HintTypes.HINT_ALIGN_ID, actionEvent.getComponent());
        this.childCategoryPopup.show(hints);
        } else if("G0000".equals(prntCatCode)) {
//            System.out.println("cat is null");
            ViewObject _sku = ADFUtils.findIterator("newHmSkuVIterator").getViewObject();
             _sku.setNamedWhereClauseParam("p6ShopCatSubCode", prntCatCode);
            _sku.executeQuery();
    RequestContext.getCurrentInstance().addPartialTarget(skuIterator);
    RequestContext.getCurrentInstance().addPartialTarget(noRecordsFoundTxt);
        }
    }
    public void searchByDetCats(ActionEvent actionEvent) {
        // Add event code here...
        String _childCat = (String) actionEvent.getComponent().getAttributes().get("childCatCode");
//        System.out.println("cat is :"+_childCat);
        if(_childCat==null){
            _childCat = (String) JSFUtil.getFromSession("prntCat");
        } 
        ViewObject _sku = ADFUtils.findIterator("newHmSkuVIterator").getViewObject();
         _sku.setNamedWhereClauseParam("p6ShopCatSubCode", _childCat);
        _sku.executeQuery();
//        System.out.println("child cat code :"+_childCat);
        RequestContext.getCurrentInstance().addPartialTarget(skuIterator);
        RequestContext.getCurrentInstance().addPartialTarget(noRecordsFoundTxt);
        this.childCategoryPopup.hide();
        
    }
    public void searchViewCriteria(ActionEvent actionEvent) {
        // Add event code here...
        try {
          OperationBinding oper =  ADFUtils.findOperation("SetNamedSearch");
            String xx = null;
            if (serchInpTxt.getValue().toString().isEmpty()) {
                xx = "%";
            } else {
                xx = this.serchInpTxt.getValue().toString();
            }
            System.out.println(xx);
        oper.getParamsMap().put("searchString", xx);
        oper.execute();
   RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());        
   RequestContext.getCurrentInstance().addPartialTarget(noRecordsFoundTxt);
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }
       
        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());        
    }

    public void filterBy(ActionEvent actionEvent) {
        // Add event code here...
        String _brandCode="";String _modelCode="";String _mnfCode="";String _year="";
        String _clrCode="";String _sizeCode="";
 // for Brands Filter
        ViewObject _brandVo = ADFUtils.findIterator("BrandsVIterator").getViewObject();
        Row[] _brandSelectedRows = _brandVo.getFilteredRows("Selected", true);
        if (_brandSelectedRows.length > 0) {
        for(Row r : _brandSelectedRows) {
            _brandCode=_brandCode.concat((String) r.getAttribute("BrandCode"))+",";
//            System.out.println("brand in :"+_brandCode);
            }
        }
//        System.out.println("brand b4:"+_brandCode);
 // for Models Filter
        ViewObject _modelVo = ADFUtils.findIterator("ModelsVIterator").getViewObject();
        Row[] _modelsSelectedRows = _modelVo.getFilteredRows("Selected", true);
        if (_modelsSelectedRows.length > 0) {
        for(Row r : _modelsSelectedRows) {
            _modelCode=_modelCode.concat((String) r.getAttribute("ModelCode"))+",";
//            System.out.println("model in :"+_modelCode);
            }
        }
//        System.out.println("model b4:"+_modelCode);
 // for Manufactures Filter
        ViewObject _ManfVo = ADFUtils.findIterator("ManufacturesVIterator").getViewObject();
        Row[] _manfSelectedRows = _ManfVo.getFilteredRows("Selected", true);
        if (_manfSelectedRows.length > 0) {
        for(Row r : _manfSelectedRows) {
            _mnfCode=_mnfCode.concat((String) r.getAttribute("MnfCode"))+",";
//            System.out.println("manf in :"+_mnfCode);
            }
        }
//        System.out.println("manf b4:"+_brandCode);
 // for Years Filter
        ViewObject _yearVo = ADFUtils.findIterator("YearsVIterator").getViewObject();
        Row[] _yearSelectedRows = _yearVo.getFilteredRows("Selected", true);
        if (_yearSelectedRows.length > 0) {
        for(Row r : _yearSelectedRows) {
         Integer xx = (Integer) r.getAttribute("Year");
            _year=_year.concat(xx.toString())+",";
//            System.out.println("year in :"+_brandCode);
            }
        }
 // for Colors Filter
       ViewObject _clrVo = ADFUtils.findIterator("SkuFilterColorsVIterator").getViewObject();
       Row[] _clrSelectedRows = _clrVo.getFilteredRows("Selected", true);
       if (_clrSelectedRows.length > 0) {
       for(Row r : _clrSelectedRows) {
      _clrCode=_clrCode.concat((String) r.getAttribute("ClrName"))+",";
//           System.out.println("clr in :"+_clrCode);
           }
       }        
//        System.out.println("clr b4:"+_clrCode);
// for Sizes Filter
      ViewObject _sizeVo = ADFUtils.findIterator("SkuFilterSizesVIterator").getViewObject();
      Row[] _sizeSelectedRows = _sizeVo.getFilteredRows("Selected", true);
      if (_sizeSelectedRows.length > 0) {
      for(Row r : _sizeSelectedRows) {
     _sizeCode=_sizeCode.concat((String) r.getAttribute("SzDetCode"))+",";
//          System.out.println("size in :"+_sizeCode);
          }
      }        
//       System.out.println("size b4:"+_sizeCode);

// old newHome.jsf        ViewObject _sku = ADFUtils.findIterator("HmSkuV1Iterator").getViewObject();        
        ViewObject _sku = ADFUtils.findIterator("newHmSkuVIterator").getViewObject();
        
//   old newHome.jsf  
//        _sku.setNamedWhereClauseParam("p01Brand_code", _brandCode);
//        _sku.setNamedWhereClauseParam("p02ModelCode", _modelCode);
//        _sku.setNamedWhereClauseParam("p03MnfCode", _mnfCode);
//        _sku.setNamedWhereClauseParam("p04Year", _year);
//        _sku.setNamedWhereClauseParam("p05ClrCode", _clrCode);
//        _sku.setNamedWhereClauseParam("p06SizeCode", _sizeCode);
        
        _sku.setNamedWhereClauseParam("p0BrandCode", _brandCode);
        _sku.setNamedWhereClauseParam("p1ModelCode", _modelCode);
        _sku.setNamedWhereClauseParam("p2MnfCode", _mnfCode);
        _sku.setNamedWhereClauseParam("p3Year", _year);
        _sku.setNamedWhereClauseParam("p4ClrCode", _clrCode);
        _sku.setNamedWhereClauseParam("p5SzDetCode", _sizeCode);
//        _sku.setNamedWhereClauseParam("p6ShopCatSubCode", "%");

//        old newHome.jsf  
//        OperationBinding oper1 = (OperationBinding) ADFUtils.findOperation("setClrSizeForDetailSkuAccessorViewObject");
//        oper1.getParamsMap().put("_clrCode", _clrCode);
//        oper1.getParamsMap().put("_szCode", _sizeCode);
//            oper1.execute();

        _sku.executeQuery();
        RequestContext.getCurrentInstance().addPartialTarget(noRecordsFoundTxt);
    }

    public void setSkuIterator(UIXIterator skuIterator) {
        this.skuIterator = skuIterator;
    }

    public UIXIterator getSkuIterator() {
        return skuIterator;
    }
    public void setSerchInpTxt(RichInputText serchInpTxt) {
        this.serchInpTxt = serchInpTxt;
    }

    public RichInputText getSerchInpTxt() {
        return serchInpTxt;
    }

    public void setChildCategoryPopup(RichPopup childCategoryPopup) {
        this.childCategoryPopup = childCategoryPopup;
    }

    public RichPopup getChildCategoryPopup() {
        return childCategoryPopup;
    }

    public void setPrntCatName(String prntCatName) {
        this.prntCatName = prntCatName;
    }

    public String getPrntCatName() {
        return prntCatName;
    }

    public void setPrntCatCode(String prntCatCode) {
        this.prntCatCode = prntCatCode;
    }

    public String getPrntCatCode() {
        return prntCatCode;
    }

    public void setNoOfRecs(int _noOfRecs) {
        this._noOfRecs = _noOfRecs;
    }

    public int getNoOfRecs() {
        return _noOfRecs;
    }

    public void setNoRecordsFoundTxt(RichOutputText noRecordsFoundTxt) {
        this.noRecordsFoundTxt = noRecordsFoundTxt;
    }

    public RichOutputText getNoRecordsFoundTxt() {
        return noRecordsFoundTxt;
    }
}
//        try {
//            ViewObject ourVo = ADFUtils.findIterator("HmShopSubCatsVIterator").getViewObject();
//            ViewCriteriaManager vcm = ourVo.getViewCriteriaManager();
//            ViewCriteria vc = vcm.getViewCriteria("ShopSubCatsVC");
//            String xx = null;
//            if (serchInpTxt.getValue().toString().isEmpty()) {
//                xx = "%";
//            } else {
//                xx = this.serchInpTxt.getValue().toString();
//            }
//            System.out.println(xx);
//            ourVo.setNamedWhereClauseParam("pShopSubCatName", xx);
//            ourVo.executeQuery();
//        } catch (Exception e) {
//            // TODO: Add catch code
//            e.printStackTrace();
//        }
//       
//        RequestContext.getCurrentInstance().addPartialTarget(actionEvent.getComponent().getParent().getParent());        
//    }