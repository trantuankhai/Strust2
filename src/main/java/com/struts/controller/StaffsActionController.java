package com.struts.controller;

import java.util.List;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;
import com.struts.model.Staffs;
import com.struts.services.DepartServicesImpl;
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
	private List<Staffs> listStaffs;
	private Integer id;
	private Integer id_departs;
	private String name_staff;
	private Integer gender;
	private String birthday;
	private String email;
	private String phone;
	private String note;
	private StaffsServicesImpl staffsServicesImpl = new StaffsServicesImpl();
	private DepartServicesImpl departServicesImpl = new DepartServicesImpl();
	private Logger logger = Logger.getLogger(StaffsActionController.class);

	public String listStaffs() {

		if (staffsServicesImpl.listStaffs() != null) {
			listStaffs = staffsServicesImpl.listStaffs();
			logger.debug("Get All Staffs Success");
			return SUCCESS;
		} else {
			logger.debug("Get All Staffs Error. Because Stafss === null");
			return ERROR;
		}
	}

	public java.lang.String editStaff() {
		java.lang.String result = staffsServicesImpl.editStaffs(getId(),new Staffs(departServicesImpl.getDepartById(getId_departs()), getName_staff(), getGender(), getBirthday(), getEmail(), getPhone(), getNote()));
		if ("Success".equals(result)) {
			logger.debug("Edit staff success");
			listStaffs = staffsServicesImpl.listStaffs();
			return SUCCESS;
		} else if ("Nhân Viên Không Tồn Tại".equals(result)) {
			logger.debug("Staffs not exits");
			return ERROR;
		} else {
			logger.debug("Error while Edit");
			return ERROR;
		}
	}

	public java.lang.String addStaff() {
		java.lang.Integer result = staffsServicesImpl.addStaffs(new Staffs(departServicesImpl.getDepartById(getId_departs()), getName_staff(), getGender(), getBirthday(), getEmail(), getPhone(), getNote()));
		if (result != -1) {
			logger.debug("Add staff success");
			listStaffs = staffsServicesImpl.listStaffs();
			return SUCCESS;
		} else {
			logger.debug("Add staff error at controller");
			return ERROR;
		}
	}

	public java.lang.String removeStaff() {
		java.lang.String result = staffsServicesImpl.deleteStaffs(getId());
		if ("Success".equals(result)) {
			logger.debug("remove staff success");
			listStaffs = staffsServicesImpl.listStaffs();
			return SUCCESS;
		} else {
			logger.debug("remove staff error at controller");
			return ERROR;
		}
	}
}
