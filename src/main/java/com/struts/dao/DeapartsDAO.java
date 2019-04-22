package com.struts.dao;

import java.util.List;

import com.struts.model.Departs;

public interface DeapartsDAO {
	public List<Departs> listDeparts();

	public int addDeparts(Departs departs);

	public String editDeparts(int id, String name);

	public String deleteDeparts(int id);

	public long sumPage(long showInPage);

	public List<Departs> showPagination(int min, int max);

	public long countStaffsInDeparts(int id);

	Departs getDepartById(Integer id_departs);

}
