package org.lwt.tour.dao.impl;

import java.util.List;

import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.dao.UserDao;
import org.lwt.tour.model.User;

public class UserDaoImpl extends MyHibernateDaoSupport implements UserDao{
	
	@Override
	public User get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(User.class, id);
	}

	@Override
	public Integer save(User user) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(user);
	}

	@Override
	public void update(User user) {
		getHibernateTemplate().update(user);

	}
	
	@Override
	public int delete(int id) {
		User user = get(id);
		try {
			getHibernateTemplate().delete(user);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		return 1;
	}
	
	@Override
	public List findByAccount(int a_id) {
		return getHibernateTemplate().find("from User as u where u.account.a_id = ?", a_id); 
	}
	
	public List<User> findAllUsertInfo(){
		return getHibernateTemplate().find("from User"); 
		
	}

}
