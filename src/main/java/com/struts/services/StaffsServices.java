package com.struts.services;

import java.util.List;

import com.struts.model.Staffs;

public interface StaffsServices {
	public List<Staffs> listStaffs();

	public int addStaffs(Staffs staffs);

	public String deleteStaffs(int id);

	public String editStaffs(int id, Staffs staffs);

	public List<Staffs> layKhongNhanVien(int max);

	public long sumPage(long showOnePage);
}
