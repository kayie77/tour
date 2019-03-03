package org.lwt.tour.dao.impl;

import java.util.List;

import org.lwt.tour.model.Order;
import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.dao.OrderDao;


public class OrderDaoImpl extends MyHibernateDaoSupport implements OrderDao{
	
	@Override
	public Order get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(Order.class, id);
	}

	@Override
	public Integer save(Order object) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(object);
	}

	@Override
	public int delete(int id) {
		Order object = get(id);
		try {
			getHibernateTemplate().delete(object);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		return 1;
	}
	
	@Override
	public List<Order> getAllObject() {
		return getHibernateTemplate().find("from Order");
	}
	
	@Override
	public List<Order> getObjectByUser(int aId){
		return getHibernateTemplate().find("from Order o where o.account.a_id="+ aId );
	}
}
