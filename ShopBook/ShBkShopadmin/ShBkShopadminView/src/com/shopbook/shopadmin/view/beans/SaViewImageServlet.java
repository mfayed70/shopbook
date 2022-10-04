package com.shopbook.shopadmin.view.beans;

import com.shopbook.common.ui.ADFUtils;

import com.shopbook.common.ui.JSFUtil;

import groovy.ui.SystemOutputInterceptor;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//@WebServlet(name = "SaViewImageServlet", urlPatterns = { "/ViewImageServlet" })
public class SaViewImageServlet extends HttpServlet {
//    @SuppressWarnings("compatibility:-3748776433209710701")
//    private static final long serialVersionUID = 1L;
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = (request.getParameter("path"));   
        OutputStream os = response.getOutputStream();
        if (path.equalsIgnoreCase("No")) {
       //  path = "/home/mfayed/Desktop/MyShop/NoImage.png";
        //String ter = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/resources/images/NoImage.png");
        //System.out.println(path);
        }
        if (request.getParameter("path") == "") {
        //    path = "D:\\sample\\NoImage.png";
        //    path = "/resources/images/NoImage.png";
        }
        InputStream inputStream = null;
        try {
            File outputFile = new File(path);
            inputStream = new FileInputStream(outputFile);
            BufferedInputStream in = new BufferedInputStream(inputStream);
            int b;
            byte[] buffer = new byte[10240];
            while ((b = in.read(buffer, 0, 10240)) != -1) {
               os.write(buffer, 0, b);
            }
        
        in.close();
        } catch (Exception e) {
            System.out.println(e);
        } 
        finally {           
            if (os != null) {
                os.close();
            }
            if (inputStream != null) {
                inputStream.close();
            }
        }
 
    }
}
