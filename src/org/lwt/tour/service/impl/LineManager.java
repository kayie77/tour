package org.lwt.tour.service.impl;

import java.util.List;

import org.lwt.tour.dao.LineDao;
import org.lwt.tour.model.Line;
import org.lwt.tour.model.Scenic;

public class LineManager {
	
	private LineDao lineDao;

	public LineDao getLineDao() {
		return lineDao;
	}

	public void setLineDao(LineDao lineDao) {
		this.lineDao = lineDao;
	}

	//新建分类
	public void saveObject(Line object) {
		lineDao.save(object);
		return;
	}
	
	//编辑分类
	public void updateObject(Line object) {
		lineDao.update(object);
		return;
	}
	
	//删除分类
	public void delObject(int[] ids) {
		for (int i = 0; i < ids.length; i++) {
			lineDao.delete(ids[i]);
		}
	}

	//根据分类返回对象
	public List<Line> getObjectByCtg(String ctgId){
		// TODO Auto-generated method stub
		return lineDao.getObjectByCtg(ctgId);
	}
}
