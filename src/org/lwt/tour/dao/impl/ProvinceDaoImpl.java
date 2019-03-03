package org.lwt.tour.dao.impl;

import java.util.List;

import org.lwt.tour.model.Province;
import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.dao.ProvinceDao;

public class ProvinceDaoImpl extends MyHibernateDaoSupport implements ProvinceDao{
	
	@Override
	public  Province get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get( Province.class, id);
	}

	@Override
	public Integer save(Province object) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(object);
	}

	@Override
	public void update(Province object) {
		getHibernateTemplate().update(object);

	}
	
	@Override
	public int delete(int id) {
		Province object = get(id);
		try {
			getHibernateTemplate().delete(object);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		return 1;
	}
	
	@Override
	public List<Province> getAllObject() {
		return getHibernateTemplate().find("from Province p order by p.country.c_name");
	}

	@Override
	public List<Province> revealObject(String classword,String keyword) {
		String sql = null;
		if(!classword.isEmpty()){
			sql = "from Province p where p.country.c_id="+ classword +" and p_name like '%"+keyword+"%'";
		}else{
			sql = "from Province p where p_name like '%"+keyword+"%'";
		}
		return getHibernateTemplate().find(sql);
	}
	
	@Override
	public List<Province> getProvinceBycountry(String cId){
		return getHibernateTemplate().find("from Province p where p.country.c_id="+ cId );
	}
}
