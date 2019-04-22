package com.struts.services;

import java.util.List;

import org.apache.log4j.Logger;

import com.struts.model.Departs;
import com.struts.dao.DepartsDaoImpl;
import com.struts.dao.StaffsDaoImpl;

public class DepartServicesImpl implements DepartsServises {
	private DepartsDaoImpl departsDaoImpl = new DepartsDaoImpl();
	private StaffsDaoImpl staffsDaoImpl = new StaffsDaoImpl();
	private Logger logger = Logger.getLogger(this.getClass().getName());

	public int addDeparts(Departs departs) {
		if (departs != null) {
			return departsDaoImpl.addDeparts(departs);
		} else {
			logger.debug("null depart at services");
			return -1;
		}

	}

	public String deleteDeparts(int id) {
//		if(staffsDaoImpl.getListStaffsByIdDepart(id) != null) {
//			return "exist staffs";
//		}else {
			return departsDaoImpl.deleteDeparts(id);
//		}
		
	}

	public String editDeparts(int id, String name) {
		// TODO Auto-generated method stub
		return departsDaoImpl.editDeparts(id, name);
	}

	public List<com.struts.model.Departs> listDeparts() {

		return departsDaoImpl.listDeparts();
	}

	public long sumPage(long showInPage) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<com.struts.model.Departs> showPagination(int min, int max) {
		// TODO Auto-generated method stub
		return null;
	}

	public long countStaffsInDeparts(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Departs getDepartById(Integer id_departs) {

		if (id_departs != null) {
			return departsDaoImpl.getDepartById(id_departs);
		} else {
			return null;
		}

	}

}
