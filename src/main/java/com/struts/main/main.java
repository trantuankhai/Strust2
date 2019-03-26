package com.struts.main;

import com.struts.model.Departs;
import com.struts.services.DepartServicesImpl;

public class main {

	public static void main(String[] args) {
		DepartServicesImpl departServicesImpl = new DepartServicesImpl();
		System.out.println(departServicesImpl.addDeparts(new Departs("tesst")));	
		}

}
