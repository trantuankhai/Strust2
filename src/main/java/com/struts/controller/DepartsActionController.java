package com.struts.controller;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.struts.model.Departs;
import com.struts.services.DepartServicesImpl;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DepartsActionController extends ActionSupport {
	private static final long serialVersionUID = 2156794792864214519L;
	private String nameDeparts;
	private java.lang.Integer idDeparts;
	private DepartServicesImpl departServicesImpl = new DepartServicesImpl();
	private List<Departs> departs;

	public String departs() {
		return SUCCESS;

	}

	public String listDeparts() {
		if (departServicesImpl.listDeparts() != null) {
			departs = departServicesImpl.listDeparts();
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	public String addDeparts() {
		System.out.println(getNameDeparts());
		if (departServicesImpl.addDeparts(new Departs(getNameDeparts())) != -1) {
			return SUCCESS;
		} else {
			return ERROR;
		}

	}

	public String removeDepartsById() {
		if ("Success".equals(departServicesImpl.deleteDeparts(getIdDeparts()))) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	public String editDeparts() {
		if ("Success".equals(departServicesImpl.editDeparts(getIdDeparts(), getNameDeparts()))) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

}
