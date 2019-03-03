package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.Order;

public interface OrderDao {
	
	Order get(Integer id);//·µ»ØÄ³¸ö
	
	int delete(int id);//É¾³ý
	
	Integer save(Order object);//±£´æ
	
	public List<Order> getAllObject();
	
	public List<Order> getObjectByUser(int uId);
}
