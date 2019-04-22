package com.struts.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.struts.services.UserServicesImpl;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserActionController extends ActionSupport implements ServletResponseAware, ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserServicesImpl userServicesImpl = new UserServicesImpl();
	private java.lang.String userName, passWord;
	private Cookie cookie;

	public String checkLogin1() {
		if ("success".equals(userServicesImpl.checkLogin(getUserName(), getPassWord()))) {
			cookie = new Cookie("authorzitationStruts", "thisiscookie");
			cookie.setMaxAge(300);
			servletResponse.addCookie(cookie);
			return SUCCESS;
		} else {
			String message = getText("error.login");
			addActionError(message);
			return ERROR;
		}
	}

	protected HttpServletResponse servletResponse;

	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;

	}

	protected HttpServletRequest servletRequest;

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;

	}

}
