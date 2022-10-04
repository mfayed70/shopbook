package com.shopbook.home.model.view;

import com.shopbook.home.model.view.common.HmSkuV;

import java.sql.ResultSet;

import oracle.jbo.Row;
import oracle.jbo.RowSet;
import oracle.jbo.ViewObject;
import oracle.jbo.domain.Number;
import oracle.jbo.server.AssociationDefImpl;
import oracle.jbo.server.ViewObjectImpl;
import oracle.jbo.server.ViewRowImpl;
import oracle.jbo.server.ViewRowSetImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Mon Dec 27 10:52:05 EET 2021
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class HmSkuVImpl extends ViewObjectImpl implements HmSkuV {
    /**
     * This is the default constructor (do not remove).
     */
    public HmSkuVImpl() {
    }
    public void setClrSizeForDetailSkuAccessorViewObject(String _clrCode, String _szCode ) {
        Row r = getCurrentRow();
        if (r != null) {
            RowSet rs = (RowSet)r.getAttribute("SkuColorsV");
            if (rs != null) {
                ViewObject accessorVO = rs.getViewObject();
                accessorVO.setNamedWhereClauseParam("p0ClrCode", _clrCode);
                accessorVO.setNamedWhereClauseParam("p1SzCode", _szCode);
            }
            executeQuery();
        }
    }
    
    protected ViewRowSetImpl createViewLinkAccessorRS(AssociationDefImpl assocDef, 
                                                      ViewObjectImpl accessorVO, 
                                                      Row masterRow, 
                                                      Object[] values) {
        ViewRowSetImpl v = 
            super.createViewLinkAccessorRS(assocDef, accessorVO, masterRow, 
                                           values);
        String clr = (String)accessorVO.getNamedWhereClauseParam("p0ClrCode");
        String sz = (String)accessorVO.getNamedWhereClauseParam("p1SzCode");
        v.setNamedWhereClauseParam("p0ClrCode", clr);
        v.setNamedWhereClauseParam("p1SzCode", sz);
        return v;
    }

}
