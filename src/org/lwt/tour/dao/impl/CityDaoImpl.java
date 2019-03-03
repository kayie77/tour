package org.lwt.tour.dao.impl;

import java.util.List;

import org.lwt.tour.model.City;
import org.lwt.tour.model.Province;
import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.dao.CityDao;

public class CityDaoImpl extends MyHibernateDaoSupport implements CityDao{
	
	@Override
	public City get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(City.class, id);
	}

	@Override
	public Integer save(City object) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(object);
	}

	@Override
	public void update(City object) {
		getHibernateTemplate().update(object);

	}
	
	@Override
	public int delete(int id) {
		City object = get(id);
		try {
			getHibernateTemplate().delete(object);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		return 1;
	}
	
	@Override
	public List<City> getAllObject() {
		return getHibernateTemplate().find("from City c order by c.province.country.c_name");
	}

	@Override
	public List<City> revealObject(String classword,String keyword) {
		String sql = null;
		if(!classword.isEmpty()){
			sql = "from City c where c.province.p_id="+ classword +" and ct_name like '%"+keyword+"%'";
		}else{
			sql = "from City c where ct_name like '%"+keyword+"%'";
		}
		return getHibernateTemplate().find(sql);
	}
	
	@Override
	public List<City> getCityByProvince(String pId){
		return getHibernateTemplate().find("from City c where c.province.p_id="+ pId );
	}
}
