package com.shopbook.shopadmin.view.beans;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.view.rich.component.rich.input.RichInputText;

public class SkuBdataBean {
    private RichInputText oldPriceFromLastPrice;
    private RichInputText skuLastSavedPrice;

    public SkuBdataBean() {
    }

    public void lastPriceChange(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
//        System.out.println("old value" +valueChangeEvent.getOldValue());
//        System.out.println("new value" +valueChangeEvent.getNewValue());
        if (valueChangeEvent.getOldValue()==null) {
            this.oldPriceFromLastPrice.setValue(valueChangeEvent.getNewValue());    
        } else {
        this.oldPriceFromLastPrice.setValue(valueChangeEvent.getOldValue());
        }
    }

    public void setOldPriceFromLastPrice(RichInputText oldPriceFromLastPrice) {
        this.oldPriceFromLastPrice = oldPriceFromLastPrice;
    }

    public RichInputText getOldPriceFromLastPrice() {
        return oldPriceFromLastPrice;
    }

    public void setSkuLastSavedPrice(RichInputText skuLastSavedPrice) {
        this.skuLastSavedPrice = skuLastSavedPrice;
    }

    public RichInputText getSkuLastSavedPrice() {
        return skuLastSavedPrice;
    }
}
