package org.lwt.tour.dao;

import java.util.List;

import org.lwt.tour.model.Account;


public interface AdminDao {
	
	public List findByNameAndPass(String name, String password);

}
