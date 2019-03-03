package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.City;
import org.lwt.tour.model.Province;

public interface CityDao {
	
	City get(Integer id);//返回某个
	
	int delete(int id);//删除
	
	void update(City object);//更新

	Integer save(City object);//保存
	
	public List<City> getAllObject();

	public List<City> revealObject(String classword,String keyword);
	
	public List<City> getCityByProvince(String pId);
}
