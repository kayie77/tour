package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.About;


public interface IntroduceDao {
	
	About get(Integer id);//返回某个
		
	void update(About object);//更新

	Integer save(About object);//保存
	
	public Object getObject();
	
}
