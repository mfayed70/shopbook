package com.shopbook.sysadmin.view.servlet;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.faces.context.FacesContext;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "SysViewImageServlet", urlPatterns = { "/sysviewimageservlet" })

public class SysViewImageServlet extends HttpServlet {
    @SuppressWarnings("compatibility:6434921774315222912")
    private static final long serialVersionUID = 1L;
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    /**
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @SuppressWarnings("oracle.jdeveloper.java.nested-assignment")
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = (request.getParameter("path"));   
        
        
        OutputStream os = response.getOutputStream();
        //If path is null or file is not an image
        if (path.equalsIgnoreCase("No")) {
      //      path = "D:\\shopbook\\NoImage.png";
//String ter = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/resources/images/NoImage.png");
//System.out.println(ter);
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