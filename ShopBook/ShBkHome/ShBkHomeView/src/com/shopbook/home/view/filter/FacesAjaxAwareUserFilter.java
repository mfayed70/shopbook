package com.shopbook.home.view.filter;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.UserFilter;
import org.apache.shiro.web.util.SavedRequest;

public class FacesAjaxAwareUserFilter extends UserFilter {
    @Override
    public void afterCompletion(ServletRequest servletRequest, ServletResponse servletResponse,
                                Exception exception) throws Exception {
        // TODO Implement this method
//        System.out.println("afterCompletion");
        super.afterCompletion(servletRequest, servletResponse, exception);
    }


    @Override
    protected void saveRequestAndRedirectToLogin(ServletRequest servletRequest,
                                                 ServletResponse servletResponse) throws IOException {
        // TODO Implement this method
        System.out.println("saveRequestAndRedirectToLogin");
        servletRequest.getServletContext().getContextPath();
        


        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        String requestURLBefore = httpRequest.getRequestURL().toString();
        System.out.println("requestURLBefore= URI"+httpRequest.getRequestURI().toString());
        
        System.out.println("Ctx Path " + httpRequest.getContextPath() );
        System.out.println("Ctx getQueryString " + httpRequest.getQueryString() );
        
        
        System.out.println("requestURLBefore="+requestURLBefore);
        
        SavedRequest savedRequest = new SavedRequest(httpRequest);
        String requestURLAfter = savedRequest.getRequestUrl().toString();
        System.out.println("requestURLAfter="+requestURLAfter);
        
        session.setAttribute("shiroSavedRequest", savedRequest);


        super.saveRequestAndRedirectToLogin(servletRequest, servletResponse);
    }

    public FacesAjaxAwareUserFilter() {
        super();
    }
    private static final String FACES_REDIRECT_XML =
        "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + "<partial-response><redirect " +
        "url=\"%s\"></redirect></partial-response>";

    @Override
    protected void redirectToLogin(ServletRequest req, ServletResponse res) throws IOException {
        System.out.println("redirectToLogin");
        HttpServletRequest request = (HttpServletRequest) req;
        if ("partial/ajax".equals(request.getHeader("Faces-Request"))) {
            res.setContentType("text/xml");
            res.setCharacterEncoding("UTF-8");
            res.getWriter().printf(FACES_REDIRECT_XML, request.getContextPath() + getLoginUrl());
        } else {
            super.redirectToLogin(req, res);
        }
    }
}
