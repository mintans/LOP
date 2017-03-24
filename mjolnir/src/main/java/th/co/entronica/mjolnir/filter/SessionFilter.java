/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Gam
 */
public class SessionFilter implements Filter{
    private FilterConfig config;

    @Override
    public void init(FilterConfig fc) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String url = request.getServletPath();
        boolean allowedRequest = false;


        if(request.getRequestURI().equals("/Mjolnir/main/login") || request.getRequestURI().equals("/Mjolnir/main/login-form") || request.getRequestURI().equals("/Mjolnir/main/companyInfo/getPhoto") || request.getRequestURI().contains("resetPassword")) {
            chain.doFilter(req, res);

        }else{
            HttpSession session = request.getSession(false);
            if (null == session) {
                response.sendRedirect("login-form");
            }else if(null == session.getAttribute("status")){
                response.sendRedirect("login-form");
            }else{
                chain.doFilter(req, res);
            }
        }

    }

    @Override
    public void destroy() {
        
    }
    
}
