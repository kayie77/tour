package org.lwt.tour.service.impl;

import java.util.List;

import org.lwt.tour.dao.AccountDao;
import org.lwt.tour.model.Account;
import org.lwt.tour.model.User;
import org.lwt.tour.dao.UserDao;

public class UserManager {

	private UserDao userDao;
	private AccountDao accountDao;

	public AccountDao getAccountDao() {
		return accountDao;
	}

	public void setAccountDao(AccountDao accountDao) {
		this.accountDao = accountDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	//根据学号返回学生信息
	public Object getUserByAccount(int a_id) {
			// TODO Auto-generated method stub
			List result = userDao.findByAccount(a_id);
			return result.size()==0 ? null: result.get(0);
	}
	
	//返回全部用户信息
	public List<User> getAllUserInfo() {
		List<User> result = userDao.findAllUsertInfo();
		return result;
	}
	
	//新建用户信息
	public void save(User user,Account account) {
		user.setAccount(account);
		userDao.save(user);
		return;
	}
	
	//修改用户信息
	public void update(User user) {
		userDao.update(user);
		return;
	}
	
	//删除用户信息
	public void del(int[] ids) {		
		for (int i = 0; i < ids.length; i++) {
			userDao.delete(ids[i]);
			accountDao.delete(ids[i]);
		}
	}
}
