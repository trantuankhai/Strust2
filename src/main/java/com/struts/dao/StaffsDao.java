package com.struts.dao;

import com.struts.model.Staffs;

import java.util.*;

public interface StaffsDao {
	public List<Staffs> listStaffs();

	public int addStaffs(Staffs staffs);

	public String editStaffs(int id, Staffs staffs);

	public String deleteStaffs(int id);

	public Staffs getStaffsById(java.lang.Integer id);

	public List<Staffs> layKhoangNhanVien(int max);

	public long sumPage(long showOnePage);

	public List<Staffs> chuyenHuongTrang(int min, int max);

	public List<Staffs> getListStaffsByIdDepart(Integer id_departs);

}
