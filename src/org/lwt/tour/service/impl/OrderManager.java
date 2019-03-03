package org.lwt.tour.service.impl;

import java.util.List;

import org.lwt.tour.dao.OrderDao;
import org.lwt.tour.model.Order;

public class OrderManager {
	
	private OrderDao orderDao;

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	//新建分类
	public void saveObject(Order object) {
		orderDao.save(object);
		return;
	}
	
	//删除分类
	public void delObject(int[] ids) {
		for (int i = 0; i < ids.length; i++) {
			orderDao.delete(ids[i]);
		}
	}

	//根据分类返回对象
	public List<Order> getObjectByUser(int aId){
		// TODO Auto-generated method stub
		return orderDao.getObjectByUser(aId);
	}
}
