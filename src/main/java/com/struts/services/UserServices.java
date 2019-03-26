package com.struts.services;

import javax.servlet.http.HttpServletRequest;

import com.struts.model.User;

public interface UserServices {
	public User getUser(String userName);
	public String checkLogin(String userName, String passWord);
	public User whoami(HttpServletRequest req);
}
