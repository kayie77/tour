package org.lwt.tour.service.impl;

import java.util.List;

import org.lwt.tour.dao.AdminDao;

public class AdminManager {

	private AdminDao adminDao;

	public AdminDao getAdminDao() {
		return adminDao;
	}
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public Object login(String name, String password) {
		// TODO Auto-generated method stub
		List result = adminDao.findByNameAndPass(name, password);
		return result.size()==0 ? null: result.get(0);
	}
	
}
