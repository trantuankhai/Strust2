package com.struts.controller;

import com.opensymphony.xwork2.ActionSupport;

public class errorPageActionController extends ActionSupport {
	public String show404Page() {
		return SUCCESS;
	}
}
