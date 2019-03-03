package org.lwt.tour.dao.impl;

import java.util.List;

import org.lwt.tour.model.LineClass;
import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.dao.LineClassDao;

public class LineClassDaoImpl extends MyHibernateDaoSupport implements LineClassDao{
	
	@Override
	public LineClass get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(LineClass.class, id);
	}

	@Override
	public Integer save(LineClass object) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(object);
	}

	@Override
	public void update(LineClass object) {
		getHibernateTemplate().update(object);

	}
	
	@Override
	public int delete(int id) {
		LineClass object = get(id);
		try {
			getHibernateTemplate().delete(object);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		return 1;
	}
	
	@Override
	public List<LineClass> getAllObject() {
		return getHibernateTemplate().find("from LineClass");
	}

	@Override
	public List<LineClass> revealObject(String keyword) {
		return getHibernateTemplate().find("from LineClass where lc_name like '%"+keyword+"%'");
	}
}
