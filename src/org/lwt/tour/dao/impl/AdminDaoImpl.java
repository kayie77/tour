package org.lwt.tour.dao.impl;

import java.util.List;

import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.dao.AdminDao;

public class AdminDaoImpl extends MyHibernateDaoSupport implements AdminDao{
	
	@Override
	public List findByNameAndPass(String name, String password) {
		List result = getHibernateTemplate().find("from Admin where ad_name = ? and password= ? ", name, password); 
		return result;
	}

}
