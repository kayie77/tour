package org.lwt.tour.dao.impl;

import java.util.List;

import org.lwt.tour.model.Line;
import org.lwt.tour.model.Province;
import org.lwt.tour.model.Scenic;
import org.lwt.tour.dao.MyHibernateDaoSupport;
import org.lwt.tour.dao.LineDao;

public class LineDaoImpl extends MyHibernateDaoSupport implements LineDao{
	
	@Override
	public Line get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(Line.class, id);
	}

	@Override
	public Integer save(Line object) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(object);
	}

	@Override
	public void update(Line object) {
		getHibernateTemplate().update(object);

	}
	
	@Override
	public int delete(int id) {
		Line object = get(id);
		try {
			getHibernateTemplate().delete(object);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		return 1;
	}
	
	@Override
	public List<Line> getAllObject() {
		return getHibernateTemplate().find("from Line");
	}

	@Override
	public List<Line> revealObject(String classword,String keyword) {
		String sql = null;
		if(!classword.isEmpty()){
			sql = "from Line l where l.lineClass.lc_id="+ classword +" and l.l_name like '%"+keyword+"%'";
		}else{
			sql = "from Line l where l_name like '%"+keyword+"%'";
		}
		return getHibernateTemplate().find(sql);
	}
	
	@Override
	public List<Line> getObjectByCtg(String ctgId){
		return getHibernateTemplate().find("from Line l where l.lineClass.lc_id="+ ctgId );
	}
}
