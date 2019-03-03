package org.lwt.tour.service.impl;

import java.util.List;

import org.lwt.tour.dao.ScenicDao;
import org.lwt.tour.model.City;
import org.lwt.tour.model.Scenic;

public class ScenicManager {
	
	private ScenicDao scenicDao;

	public ScenicDao getScenicDao() {
		return scenicDao;
	}

	public void setScenicDao(ScenicDao scenicDao) {
		this.scenicDao = scenicDao;
	}

	//新建分类
	public void saveObject(Scenic object) {
		scenicDao.save(object);
		return;
	}
	
	//编辑分类
	public void updateObject(Scenic object) {
		scenicDao.update(object);
		return;
	}
	
	//删除分类
	public void delObject(int[] ids) {
		for (int i = 0; i < ids.length; i++) {
			scenicDao.delete(ids[i]);
		}
	}
	
	//根据分类返回对象
	public List<Scenic> getObjectByCtg(String ctgId){
		// TODO Auto-generated method stub
		return scenicDao.getObjectByCtg(ctgId);
	}

}
