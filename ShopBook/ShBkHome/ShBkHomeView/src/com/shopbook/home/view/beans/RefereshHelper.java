package com.shopbook.home.view.beans;

import javax.faces.event.ActionEvent;

import oracle.adf.controller.ControllerContext;

public class RefereshHelper {
    public String refreshToken;

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public String getRefreshToken() {
        return String.valueOf(System.currentTimeMillis());
    }

    public RefereshHelper() {
        super();
    }

    public void getCurrPageURL(ActionEvent actionEvent) {
        // Add event code here...
        String url = ControllerContext.getInstance().getCurrentViewPort().getViewId();
        System.out.println("curr pg : "+url);
    }
}
