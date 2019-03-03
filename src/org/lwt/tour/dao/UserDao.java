package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.User;

public interface UserDao {
	
	User get(Integer id);//返回某个
	
	int delete(int id);//删除
	
	void update(User user);//更新

	Integer save(User user);//保存
	
	public List findByAccount(int a_id);
	
	public List<User> findAllUsertInfo();

}
