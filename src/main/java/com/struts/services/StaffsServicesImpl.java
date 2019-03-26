package com.struts.services;

import java.util.List;

import com.struts.dao.StaffsDaoImpl;
import com.struts.model.Staffs;

public class StaffsServicesImpl implements StaffsServices {
	private StaffsDaoImpl staffsDaoImpl = new StaffsDaoImpl();

	public List<Staffs> listStaffs() {
		return staffsDaoImpl.listStaffs();
	}

	public int addStaffs(Staffs staffs) {
		// TODO Auto-generated method stub
		return staffsDaoImpl.addStaffs(staffs);
	}

	public String deleteStaffs(int id) {
		// TODO Auto-generated method stub
		return staffsDaoImpl.deleteStaffs(id);
	}

	public String editStaffs(int id, Staffs staffs) {
		// TODO Auto-generated method stub
		return staffsDaoImpl.editStaffs(id, staffs);
	}

	public List<Staffs> layKhongNhanVien(int max) {
		// TODO Auto-generated method stub
		return staffsDaoImpl.layKhoangNhanVien(max);
	}

	public long sumPage(long showOnePage) {
		// TODO Auto-generated method stub
		return staffsDaoImpl.sumPage(showOnePage);
	}

}
