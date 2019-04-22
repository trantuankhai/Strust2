package com.struts.controller;

import java.util.List;

import org.apache.log4j.Logger;

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
	private Logger logger = Logger.getLogger(DepartsActionController.class.getName());

	public String departs() {
		return SUCCESS;

	}

	public String listDeparts() {
		logger.debug("Get List Departs");
		if (departServicesImpl.listDeparts() != null) {
			departs = departServicesImpl.listDeparts();
			return SUCCESS;
		} else {
			logger.debug("get list departs eror at controller");
			return ERROR;

		}
	}

	public String addDeparts() {
		System.out.println("this is name departs: " + getNameDeparts());
		if (departServicesImpl.addDeparts(new Departs(getNameDeparts())) != -1) {
			departs = departServicesImpl.listDeparts();
			logger.debug("Add departs with name " + getNameDeparts());
			return SUCCESS;
		} else {
			logger.debug("Add departs with name " + getNameDeparts() + " error at controller");
			return ERROR;
		}

	}

	public String removeDepartsById() {
		String result = departServicesImpl.deleteDeparts(getIdDeparts());
		if ("Success".equals(result)) {
			departs = departServicesImpl.listDeparts();
			logger.debug("Delete departs with id " + getIdDeparts());
			return SUCCESS;
		} else if("exist staffs".equals(result)) {
			logger.debug("Exist staffs in depart");
			System.out.println("Exist staffs in depart");
			return INPUT;
		}else {
			logger.debug("error while delete depart");
			return ERROR;
		}
	}

	public String editDeparts() {
		if ("Success".equals(departServicesImpl.editDeparts(getIdDeparts(), getNameDeparts()))) {
			logger.debug("Update departs with name " + getNameDeparts() + " & id " + getIdDeparts());
			departs = departServicesImpl.listDeparts();
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

}
