package com.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest Request = (HttpServletRequest) request;
        HttpServletResponse Response = (HttpServletResponse) response;
        HttpSession session = Request.getSession();
        String username = (String) session.getAttribute("username");
        String path = Request.getRequestURI();
        if(path.indexOf("/jsp/Login/login.jsp") > -1) {
            chain.doFilter(Request, Response);
            return;
        }
        if (username == null || "".equals(username)) {
            // 跳转到登陆页面
            Response.sendRedirect("/jsp/Login/login.jsp");
        } else {
            // 已经登陆,继续此次请求
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
