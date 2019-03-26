package com.struts.dao;

import com.struts.model.User;

public interface UserDAO {
	public User getUser(String userName);
	public String checkLogin(String userName, String passWord);

}
