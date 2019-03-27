package com.struts.controller;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.struts.model.Staffs;
import com.struts.services.StaffsServicesImpl;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class StaffsActionController extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Staffs> staffs;
	private StaffsServicesImpl staffsServicesImpl = new  StaffsServicesImpl();
	public String listStaffs() {
		if (staffsServicesImpl.listStaffs() != null) {
			staffs = staffsServicesImpl.listStaffs();
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
}
