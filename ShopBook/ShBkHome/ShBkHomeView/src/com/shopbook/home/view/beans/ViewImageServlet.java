package com.shopbook.home.view.beans;

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

@WebServlet(name = "ViewImageServlet", urlPatterns = { "/viewimageservlet" })
@SuppressWarnings("oracle.jdeveloper.java.serialversionuid-field-missing")
public class ViewImageServlet extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

     public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        String path = (request.getParameter("path"));
        
        OutputStream os = response.getOutputStream();
        //if path is null or file is not an image
        if (path.equalsIgnoreCase("No")) {
//            path = "C://sample//NoImage.png";
        }
        if ((request.getParameter("path")=="")) {
//            path = "C://sample//NoImage.png";
        }
        
        InputStream inputStream = null;
        try {
        File outputFile = new File(path);
        inputStream = new FileInputStream(outputFile);
        BufferedInputStream in = new BufferedInputStream(inputStream);
        int b;
        byte [] buffer = new byte[10240];
            while ((b = in.read(buffer , 0 , 10240)) != -1) {
                os.write(buffer, 0, b);
            }
        } catch (Exception e) {
        System.out.println(e);
        } finally {
            if (os != null) {
                os.close();
            }
            if (inputStream != null) {
                inputStream.close();
            }
        }
//        response.setContentType(CONTENT_TYPE);
//        PrintWriter out = response.getWriter();
//        out.println("<html>");
//        out.println("<head><title>ViewImageServlet</title></head>");
//        out.println("<body>");
//        out.println("<p>The servlet has received a GET. This is the reply.</p>");
//        out.println("</body></html>");
//        out.close();
    }
}
