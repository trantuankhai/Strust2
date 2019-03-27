package com.struts.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.struts.services.UserServicesImpl;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserActionController extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserServicesImpl userServicesImpl = new UserServicesImpl();
	private java.lang.String userName, passWord;

	public String checkLogin1() {
		if (userServicesImpl.checkLogin(getUserName(), getPassWord()) == "success") {

			return SUCCESS;
		} else {
			String message = getText("error.login");
			addActionError(message);
			return ERROR;
		}
	}

}
