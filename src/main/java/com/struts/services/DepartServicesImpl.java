package com.struts.services;

import java.util.List;
import com.struts.model.Departs;
import com.struts.dao.DepartsDaoImpl;



public class DepartServicesImpl implements DepartsServises {
	private DepartsDaoImpl departsDaoImpl = new DepartsDaoImpl();
	public int addDeparts(Departs departs) {
		// TODO Auto-generated method stub
		return departsDaoImpl.addDeparts(departs);
	}

	public String deleteDeparts(int id) {
		// TODO Auto-generated method stub
		return departsDaoImpl.deleteDeparts(id);
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



}
