package org.lwt.tour.service.impl;

import java.util.List;

import org.lwt.tour.dao.ProvinceDao;
import org.lwt.tour.model.Province;

public class ProvinceManager {
	
	private ProvinceDao provinceDao;
	
	public ProvinceDao getProvinceDao() {
		return provinceDao;
	}

	public void setProvinceDao(ProvinceDao provinceDao) {
		this.provinceDao = provinceDao;
	}

	//新建分类
	public void saveObject(Province object) {
		provinceDao.save(object);
		return;
	}
	
	//编辑分类
	public void updateObject(Province object) {
		provinceDao.update(object);
		return;
	}
	
	//删除分类
	public void delObject(int[] ids) {
		for (int i = 0; i < ids.length; i++) {
			provinceDao.delete(ids[i]);
		}
	}
	
	//根据国家返回省会
	public List<Province> getProvinceBycountry(String cId){
		// TODO Auto-generated method stub
		return provinceDao.getProvinceBycountry(cId);
	}

}
