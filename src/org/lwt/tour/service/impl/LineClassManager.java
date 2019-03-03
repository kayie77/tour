package org.lwt.tour.service.impl;

import java.util.List;

import org.lwt.tour.dao.LineClassDao;
import org.lwt.tour.model.LineClass;

public class LineClassManager {
	
	private LineClassDao lineClassDao;

	public LineClassDao getLineClassDao() {
		return lineClassDao;
	}

	public void setLineClassDao(LineClassDao lineClassDao) {
		this.lineClassDao = lineClassDao;
	}

	//新建分类
	public void saveObject(LineClass object) {
		lineClassDao.save(object);
		return;
	}
	
	//编辑分类
	public void updateObject(LineClass object) {
		lineClassDao.update(object);
		return;
	}
	
	//删除分类
	public void delObject(int[] ids) {
		for (int i = 0; i < ids.length; i++) {
			lineClassDao.delete(ids[i]);
		}
	}

}
