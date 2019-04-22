package com.struts.interceptor;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class AuthorizationInterceptor implements Interceptor, ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7111429480093662622L;
	private Cookie[] cookie = null;
	protected HttpServletRequest httpServletRequest;
	private Logger logger = Logger.getLogger(this.getClass().getName());

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void init() {

	}

	public String intercept(ActionInvocation invocation) throws Exception {
		logger.debug("Qua Ngo Nha Em. Interceptor Authorization");
//		 cookie = httpServletRequest.getCookies();
//		if (cookie != null) {
//			for (Cookie cookie2 : cookie) {
//				if ("authorzizationStruts".equals(cookie2.getName())) {
//					System.out.println(cookie2.getValue());
//					return cookie2.getValue();
//				}else {
//					invocation.invoke();
//				}
//			}
//		} else {
//			invocation.invoke();
//		}
		System.out.println("Qua Ngo Nha EM");
		return invocation.invoke();
	}

	public void setServletRequest(HttpServletRequest request) {

	}

	public HttpServletRequest getHttpServletRequest() {
		return httpServletRequest;
	}

	public void setHttpServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}

}
