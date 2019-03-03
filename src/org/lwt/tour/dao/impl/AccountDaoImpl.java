package org.lwt.tour.dao.impl;

import java.util.List;

import org.lwt.tour.dao.AccountDao;
import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.model.Account;

public class AccountDaoImpl extends MyHibernateDaoSupport implements AccountDao{
	
	@Override
	public Account get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(Account.class, id);
	}

	@Override
	public Integer save(Account account) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(account);
	}

	@Override
	public void update(Account account) {
		getHibernateTemplate().update(account);

	}
	
	@Override
	public int delete(int id) {
		Account account = get(id);
		try {
			getHibernateTemplate().delete(account);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		return 1;
	}
	
	@Override
	public List  findByStudentID(String studentID) {
		List result = getHibernateTemplate().find("from Account where a_name = ? ", studentID); 
		return result;
	}
	
	@Override
	public List findByStudentIDAndPass(String studentID, String password) {
		List result = getHibernateTemplate().find("from Account where a_name = ? and password= ? ", studentID, password); 
		return result;
	}

}
