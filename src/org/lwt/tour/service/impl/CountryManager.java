package org.lwt.tour.service.impl;

import java.util.List;

import org.lwt.tour.dao.CountryDao;
import org.lwt.tour.model.Country;

public class CountryManager {
	
	private CountryDao countryDao;
	
	public CountryDao getCountryDao() {
		return countryDao;
	}

	public void setCountryDao(CountryDao countryDao) {
		this.countryDao = countryDao;
	}

	//新建分类
	public void saveObject(Country object) {
		countryDao.save(object);
		return;
	}
	
	//编辑分类
	public void updateObject(Country object) {
		countryDao.update(object);
		return;
	}
	
	//删除分类
	public void delObject(int[] ids) {
		for (int i = 0; i < ids.length; i++) {
			countryDao.delete(ids[i]);
		}
	}

}
