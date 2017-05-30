package org.cg.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.cg.domain.StoreVO;
import org.cg.service.StoreService;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = Logger.getLogger(AuthInterceptor.class);
	
	@Inject
	private StoreService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("login Interceptor !!!!");
		
		HttpSession session =  request.getSession();
		
		if (session.getAttribute("login")==null) {
			
			logger.info("current user is not logined");
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				 StoreVO  storeVO = service.checkSessionKey(loginCookie.getValue());
				 
				 if (storeVO != null) {
					 session.setAttribute("login",	storeVO);
					 return true;
					
				}
				
			}
			
			response.sendRedirect("/store/login");
			
			return false;
			
		}
		
		return true;
	}

	
	
}
