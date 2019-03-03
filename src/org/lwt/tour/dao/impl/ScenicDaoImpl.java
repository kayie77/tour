package org.lwt.tour.dao.impl;

import java.util.List;

import org.lwt.tour.model.City;
import org.lwt.tour.model.Scenic;
import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.dao.ScenicDao;

public class ScenicDaoImpl extends MyHibernateDaoSupport implements ScenicDao{
	
	@Override
	public Scenic get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(Scenic.class, id);
	}

	@Override
	public Integer save(Scenic object) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(object);
	}

	@Override
	public void update(Scenic object) {
		getHibernateTemplate().update(object);

	}
	
	@Override
	public int delete(int id) {
		Scenic object = get(id);
		try {
			getHibernateTemplate().delete(object);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		return 1;
	}
	
	@Override
	public List<Scenic> getAllObject() {
		return getHibernateTemplate().find("from Scenic s");
	}

	@Override
	public List<Scenic> revealObject(String cityword,String classword) {
		String sql = null;
		if(!classword.isEmpty()){
			sql = "from Scenic s where s.city.ct_id="+ cityword +" and s.scenicClass.sc_id= "+classword;
			
		}else if(classword.isEmpty()){
			sql = "from Scenic s where s.city.ct_id="+ cityword ;
		}
		return getHibernateTemplate().find(sql);
	}
	
	@Override
	public List<Scenic> getObjectByCtg(String ctgId){
		return getHibernateTemplate().find("from Scenic s where s.scenicClass.sc_id="+ ctgId );
	}
}
