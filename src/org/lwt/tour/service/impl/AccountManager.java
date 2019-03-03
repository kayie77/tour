package org.lwt.tour.service.impl;

import java.util.List;

import org.lwt.tour.model.Account;
import org.lwt.tour.dao.AccountDao;

public class AccountManager {

	private AccountDao accountDao;

	public AccountDao getAccountDao() {
		return accountDao;
	}

	public void setAccountDao(AccountDao accountDao) {
		this.accountDao = accountDao;
	}
	
	public Object login(String studentID, String password) {
		// TODO Auto-generated method stub
		List result = accountDao.findByStudentIDAndPass(studentID, password);
		return result.size()==0 ? null: result.get(0);
	}
	
	public Object findByStudentID(String studentID) {
		// TODO Auto-generated method stub
		List result = accountDao.findByStudentID(studentID);
		return result.size()==0 ? null: result.get(0);
	}
	
	//新建用户
	public void saveAccount(Account account) {
		accountDao.save(account);
		return;
	}
	
	//修改用户信息
	public void update(Account account) {
		accountDao.update(account);
		return;
	}
	
}
