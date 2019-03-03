package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.Country;

public interface CountryDao {
	
	 Country get(Integer id);//返回某个
	
	int delete(int id);//删除
	
	void update(Country object);//更新

	Integer save(Country object);//保存
	
	public List<Country> getAllObject();

	public List<Country> revealObject(String keyword);
}
