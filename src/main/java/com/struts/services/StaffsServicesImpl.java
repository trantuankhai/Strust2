package com.struts.services;

import java.util.List;

import org.apache.log4j.Logger;

import com.struts.dao.StaffsDaoImpl;
import com.struts.model.Staffs;

public class StaffsServicesImpl implements StaffsServices {
	private StaffsDaoImpl staffsDaoImpl = new StaffsDaoImpl();
	private Logger logger = Logger.getLogger(StaffsServicesImpl.class);

	public List<Staffs> listStaffs() {
		return staffsDaoImpl.listStaffs();
	}

	public int addStaffs(Staffs staffs) {
		if (staffs != null) {
			return staffsDaoImpl.addStaffs(staffs);

		} else {
			logger.debug("Null Staffs At Services");
			return -1;
		}
	}

	public String deleteStaffs(int id) {
		return staffsDaoImpl.deleteStaffs(id);
	}

	public String editStaffs(int id, Staffs staffs) {
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
