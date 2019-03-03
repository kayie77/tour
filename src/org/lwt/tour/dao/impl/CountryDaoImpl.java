package org.lwt.tour.dao.impl;

import java.util.List;

import org.lwt.tour.model.Country;
import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.dao.CountryDao;

public class CountryDaoImpl extends MyHibernateDaoSupport implements CountryDao{
	
	@Override
	public Country get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(Country.class, id);
	}

	@Override
	public Integer save(Country object) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(object);
	}

	@Override
	public void update(Country object) {
		getHibernateTemplate().update(object);

	}
	
	@Override
	public int delete(int id) {
		Country object = get(id);
		try {
			getHibernateTemplate().delete(object);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		return 1;
	}
	
	@Override
	public List<Country> getAllObject() {
		return getHibernateTemplate().find("from Country");
	}

	@Override
	public List<Country> revealObject(String keyword) {
		return getHibernateTemplate().find("from Country where c_name like '%"+keyword+"%'");
	}
}
