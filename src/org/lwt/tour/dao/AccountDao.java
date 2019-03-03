package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.Account;

public interface AccountDao {
	
	Account get(Integer id);//返回某个
	
	int delete(int id);//删除
	
	void update(Account account);//更新

	Integer save(Account account);//保存
	
	public List findByStudentID(String name);
	
	public List findByStudentIDAndPass(String name, String password);

}
