package org.lwt.tour.dao.impl;

import java.util.List;

import org.lwt.tour.model.ScenicClass;
import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.dao.ScenicClassDao;

public class ScenicClassDaoImpl extends MyHibernateDaoSupport implements ScenicClassDao{
	
	@Override
	public ScenicClass get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(ScenicClass.class, id);
	}

	@Override
	public Integer save(ScenicClass object) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(object);
	}

	@Override
	public void update(ScenicClass object) {
		getHibernateTemplate().update(object);

	}
	
	@Override
	public int delete(int id) {
		ScenicClass object = get(id);
		try {
			getHibernateTemplate().delete(object);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		return 1;
	}
	
	@Override
	public List<ScenicClass> getAllObject() {
		return getHibernateTemplate().find("from ScenicClass");
	}

	@Override
	public List<ScenicClass> revealObject(String keyword) {
		return getHibernateTemplate().find("from ScenicClass where sc_name like '%"+keyword+"%'");
	}
}
