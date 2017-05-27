package org.cg.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = Logger.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("login Interceptor !!!!");
		
		HttpSession session =  request.getSession();
		
		if (session.getAttribute("login")==null) {
			
			logger.info("current user is not logined");
			
			response.sendRedirect("/store/login");
			
			return false;
			
		}
		
		return true;
	}

	
	
}
