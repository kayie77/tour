package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.LineClass;

public interface LineClassDao {
	
	LineClass get(Integer id);//返回某个
	
	int delete(int id);//删除
	
	void update(LineClass object);//更新

	Integer save(LineClass object);//保存
	
	public List<LineClass> getAllObject();

	public List<LineClass> revealObject(String keyword);
}
