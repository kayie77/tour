package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.Line;
import org.lwt.tour.model.Scenic;

public interface LineDao {
	
	Line get(Integer id);//返回某个
	
	int delete(int id);//删除
	
	void update(Line object);//更新

	Integer save(Line object);//保存
	
	public List<Line> getAllObject();

	public List<Line> revealObject(String classword,String keyword);
	
	public List<Line> getObjectByCtg(String ctgId);
}
