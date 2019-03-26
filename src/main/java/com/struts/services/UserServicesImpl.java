package com.struts.services;

import javax.servlet.http.HttpServletRequest;

import com.struts.dao.UserDaoImpl;
import com.struts.model.User;

public class UserServicesImpl implements UserServices {
	private UserDaoImpl userDaoImpl = new UserDaoImpl();

	public User getUser(String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	public String checkLogin(String userName, String passWord) {
	//	if (userName != null && passWord != null) {
			return userDaoImpl.checkLogin(userName, passWord);
//		} else {
//			return null;
//		}

	}

	public User whoami(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

}
