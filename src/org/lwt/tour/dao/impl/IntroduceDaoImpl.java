package org.lwt.tour.dao.impl;

import java.util.List;
import org.lwt.tour.model.About;
import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.dao.IntroduceDao;

public class IntroduceDaoImpl extends MyHibernateDaoSupport implements IntroduceDao{
	
	@Override
	public About get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(About.class, id);
	}

	@Override
	public Integer save(About object) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(object);
	}

	@Override
	public void update(About object) {
		getHibernateTemplate().update(object);

	}
	
	@Override
	public Object getObject() {
		return getHibernateTemplate().find("from About").get(0);
	}
	
}
