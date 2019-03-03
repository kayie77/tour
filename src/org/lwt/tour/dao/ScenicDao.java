package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.City;
import org.lwt.tour.model.Scenic;

public interface ScenicDao {
	
	Scenic get(Integer id);//返回某个
	
	int delete(int id);//删除
	
	void update(Scenic object);//更新

	Integer save(Scenic object);//保存
	
	public List<Scenic> getAllObject();

	public List<Scenic> revealObject(String cityword,String classword);
	
	public List<Scenic> getObjectByCtg(String ctgId);
}
