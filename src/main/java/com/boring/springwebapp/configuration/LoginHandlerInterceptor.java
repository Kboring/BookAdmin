package com.boring.springwebapp.configuration;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object username = request.getSession().getAttribute("username");
        if (username != null){
            return true;
        }else {
            request.getSession().setAttribute("warn",1);
            response.sendRedirect("/index");
            return false;
        }
    }
}
