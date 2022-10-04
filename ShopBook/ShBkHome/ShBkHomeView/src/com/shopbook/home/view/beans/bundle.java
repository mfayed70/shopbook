package com.shopbook.home.view.beans;

import com.shopbook.common.ui.ADFUtils;
import com.shopbook.common.ui.JSFUtil;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import javax.faces.application.Application;
import javax.faces.application.ViewHandler;
import javax.faces.component.UIViewRoot;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;

import oracle.adf.model.binding.DCIteratorBinding;

@SuppressWarnings("oracle.jdeveloper.java.serialversionuid-field-missing")

public class bundle implements Serializable{
    
    private String locale;
    
    public void setLocale(String locale) {
        this.locale = locale;
    }

    public String getLocale() {
        if (locale == null) {
                   locale = FacesContext.getCurrentInstance().getViewRoot()
                       .getLocale().toString();
        JSFUtil.storeOnSession("lang", this.locale); 
        DCIteratorBinding iter = ADFUtils.findIterator("LangCurrVIterator");
        iter.executeQuery();
        ADFUtils.findIterator("ReferencesNamesVIterator").executeQuery();
    }
    return locale;
    }  
    //gets all the supported locals plus the default locale defined in the faces-config.xml
       //and add it to the list of selectItems

       public List<SelectItem> getLocales() {
           List<SelectItem> localList = new ArrayList<SelectItem>();
           Application application = FacesContext.getCurrentInstance().getApplication();
           Iterator supportedLocales = application.getSupportedLocales();
           while (supportedLocales.hasNext()) {
               Locale locale = (Locale) supportedLocales.next();
               localList.add(new SelectItem(locale.toString(), locale.getDisplayName(locale)));
           }
           Locale defaultLocale = application.getDefaultLocale();
           localList.add(new SelectItem(defaultLocale.toString(), defaultLocale.getDisplayName(defaultLocale)));
           return localList;
       }  
       
    private void changeLocale(String locale){
        this.locale = locale;
    Locale newLocale;
    newLocale = new Locale(this.locale);
    FacesContext context = FacesContext.getCurrentInstance();
    context.getViewRoot().setLocale(newLocale);        
       String currentView = context.getViewRoot().getViewId();
       ViewHandler vh = context.getApplication().getViewHandler();
       UIViewRoot x = vh.createView(context, currentView);
       context.setViewRoot(x);
       x.setViewId(context.getViewRoot().getViewId());
    }
 
    public void localeChangeListener(ValueChangeEvent valueChangeEvent) {
        changeLocale(valueChangeEvent.getNewValue().toString());
        JSFUtil.storeOnSession("lang", this.locale);
        DCIteratorBinding iter = ADFUtils.findIterator("LangCurrVIterator");
        iter.executeQuery();
   // System.out.println(this.locale.toString());
    }
}
