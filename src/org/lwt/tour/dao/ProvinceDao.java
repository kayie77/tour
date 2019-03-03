package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.Province;

public interface ProvinceDao {
	
	Province get(Integer id);//返回某个
	
	int delete(int id);//删除
	
	void update(Province object);//更新

	Integer save(Province object);//保存
	
	public List<Province> getAllObject();

	public List<Province> revealObject(String classword,String keyword);
	
	public List<Province> getProvinceBycountry(String cId);
	
	
}
