package com.struts.services;

import java.util.List;

import com.struts.*;
import com.struts.model.Departs;

public interface DepartsServises {
	public int addDeparts(Departs departs);

	public String deleteDeparts(int id);

	public String editDeparts(int id, String name);

	public List<Departs> listDeparts();

	public long sumPage(long showInPage);

	public List<Departs> showPagination(int min, int max);

	public long countStaffsInDeparts(int id);

}
