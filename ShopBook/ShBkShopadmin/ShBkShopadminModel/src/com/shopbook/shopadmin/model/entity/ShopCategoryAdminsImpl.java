package com.shopbook.shopadmin.model.entity;

import java.sql.Timestamp;

import oracle.jbo.AttributeList;
import oracle.jbo.Key;
import oracle.jbo.server.EntityDefImpl;
import oracle.jbo.server.EntityImpl;
import oracle.jbo.server.TransactionEvent;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Mon Mar 30 20:44:18 EET 2020
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class ShopCategoryAdminsImpl extends EntityImpl {

    /**
     * AttributesEnum: generated enum for identifying attributes and accessors. DO NOT MODIFY.
     */
    public enum AttributesEnum {
        AdminShpCatCode,
        Active,
        UserId,
        ShopCatSubCode,
        Notes,
        LastModified,
        ShopSubCats,
        Users;
        private static AttributesEnum[] vals = null;
        private static final int firstIndex = 0;

        public int index() {
            return AttributesEnum.firstIndex() + ordinal();
        }

        public static final int firstIndex() {
            return firstIndex;
        }

        public static int count() {
            return AttributesEnum.firstIndex() + AttributesEnum.staticValues().length;
        }

        public static final AttributesEnum[] staticValues() {
            if (vals == null) {
                vals = AttributesEnum.values();
            }
            return vals;
        }
    }


    public static final int ADMINSHPCATCODE = AttributesEnum.AdminShpCatCode.index();
    public static final int ACTIVE = AttributesEnum.Active.index();
    public static final int USERID = AttributesEnum.UserId.index();
    public static final int SHOPCATSUBCODE = AttributesEnum.ShopCatSubCode.index();
    public static final int NOTES = AttributesEnum.Notes.index();
    public static final int LASTMODIFIED = AttributesEnum.LastModified.index();
    public static final int SHOPSUBCATS = AttributesEnum.ShopSubCats.index();
    public static final int USERS = AttributesEnum.Users.index();

    /**
     * This is the default constructor (do not remove).
     */
    public ShopCategoryAdminsImpl() {
    }

    /**
     * @return the definition object for this instance class.
     */
    public static synchronized EntityDefImpl getDefinitionObject() {
        return EntityDefImpl.findDefObject("com.shopbook.shopadmin.model.entity.ShopCategoryAdmins");
    }

    /**
     * Gets the attribute value for AdminShpCatCode, using the alias name AdminShpCatCode.
     * @return the value of AdminShpCatCode
     */
    public String getAdminShpCatCode() {
        return (String) getAttributeInternal(ADMINSHPCATCODE);
    }

    /**
     * Sets <code>value</code> as the attribute value for AdminShpCatCode.
     * @param value value to set the AdminShpCatCode
     */
    public void setAdminShpCatCode(String value) {
        String xx = getUserId();
        xx = xx.concat(getShopCatSubCode());
        setAttributeInternal(ADMINSHPCATCODE, xx);
    }

    /**
     * Gets the attribute value for Active, using the alias name Active.
     * @return the value of Active
     */
    public String getActive() {
        return (String) getAttributeInternal(ACTIVE);
    }

    /**
     * Sets <code>value</code> as the attribute value for Active.
     * @param value value to set the Active
     */
    public void setActive(String value) {
        setAttributeInternal(ACTIVE, value);
    }

    /**
     * Gets the attribute value for UserId, using the alias name UserId.
     * @return the value of UserId
     */
    public String getUserId() {
        return (String) getAttributeInternal(USERID);
    }

    /**
     * Sets <code>value</code> as the attribute value for UserId.
     * @param value value to set the UserId
     */
    public void setUserId(String value) {
        setAttributeInternal(USERID, value);
    }

    /**
     * Gets the attribute value for ShopCatSubCode, using the alias name ShopCatSubCode.
     * @return the value of ShopCatSubCode
     */
    public String getShopCatSubCode() {
        return (String) getAttributeInternal(SHOPCATSUBCODE);
    }

    /**
     * Sets <code>value</code> as the attribute value for ShopCatSubCode.
     * @param value value to set the ShopCatSubCode
     */
    public void setShopCatSubCode(String value) {
        setAttributeInternal(SHOPCATSUBCODE, value);
    }

    /**
     * Gets the attribute value for Notes, using the alias name Notes.
     * @return the value of Notes
     */
    public String getNotes() {
        return (String) getAttributeInternal(NOTES);
    }

    /**
     * Sets <code>value</code> as the attribute value for Notes.
     * @param value value to set the Notes
     */
    public void setNotes(String value) {
        setAttributeInternal(NOTES, value);
    }

    /**
     * Gets the attribute value for LastModified, using the alias name LastModified.
     * @return the value of LastModified
     */
    public Timestamp getLastModified() {
        return (Timestamp) getAttributeInternal(LASTMODIFIED);
    }

    /**
     * Sets <code>value</code> as the attribute value for LastModified.
     * @param value value to set the LastModified
     */
    public void setLastModified(Timestamp value) {
        setAttributeInternal(LASTMODIFIED, value);
    }

    /**
     * @return the associated entity oracle.jbo.server.EntityImpl.
     */
    public EntityImpl getShopSubCats() {
        return (EntityImpl) getAttributeInternal(SHOPSUBCATS);
    }

    /**
     * Sets <code>value</code> as the associated entity oracle.jbo.server.EntityImpl.
     */
    public void setShopSubCats(EntityImpl value) {
        setAttributeInternal(SHOPSUBCATS, value);
    }

    /**
     * @return the associated entity oracle.jbo.server.EntityImpl.
     */
    public EntityImpl getUsers() {
        return (EntityImpl) getAttributeInternal(USERS);
    }

    /**
     * Sets <code>value</code> as the associated entity oracle.jbo.server.EntityImpl.
     */
    public void setUsers(EntityImpl value) {
        setAttributeInternal(USERS, value);
    }

    /**
     * @param adminShpCatCode key constituent

     * @return a Key object based on given key constituents.
     */
    public static Key createPrimaryKey(String adminShpCatCode) {
        return new Key(new Object[] { adminShpCatCode });
    }
    protected void doDML(int operation, TransactionEvent e) {
       
        if (operation == DML_INSERT || operation == DML_UPDATE) {
            setAdminShpCatCode("AAAAA000@0000");
 //       System.out.println(getAdminShpCatCode());
        super.doDML(operation, e);
        } else if (operation == DML_DELETE) {
            super.doDML(operation, e);
        }
    }

}

