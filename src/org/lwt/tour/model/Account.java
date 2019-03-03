package org.lwt.tour.model;

import java.util.HashSet;
import java.util.Set;

import org.lwt.tour.model.User;

public class Account {

	private int a_id;
	private String a_name;
	private String password;
	private Set<User> users = new HashSet<User>();
	private Set<Order> orders = new HashSet<Order>();
	
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public Account(){
		super();
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	
}