package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.ScenicClass;

public interface ScenicClassDao {
	
	ScenicClass get(Integer id);//返回某个
	
	int delete(int id);//删除
	
	void update(ScenicClass object);//更新

	Integer save(ScenicClass object);//保存
	
	public List<ScenicClass> getAllObject();

	public List<ScenicClass> revealObject(String keyword);
}
