package com.sirLiu.ttt_ssm.filter;

import com.sirLiu.ttt_ssm.service.UserManagementService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author sirLiu
 * @Date 2017/12/26 19:32
 */
public class UserLoginFilter implements Filter {

    @Autowired
    private UserManagementService userManagementService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
//        if (req.getSession().getAttribute("users") == null && userManagementService != null) {
//            req.getSession().setAttribute("users", userManagementService.listAllUsers());
//        }
        chain.doFilter(req,resp);
    }

    @Override
    public void destroy() {

    }
}
