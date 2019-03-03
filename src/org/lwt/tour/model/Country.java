package org.lwt.tour.model;

import java.util.HashSet;
import java.util.Set;

import org.lwt.tour.model.Province;

public class Country {

	private int c_id;
	private String c_name;
	private Set<Province> provinces = new HashSet<Province>();

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public Set<Province> getProvinces() {
		return provinces;
	}

	public void setProvinces(Set<Province> provinces) {
		this.provinces = provinces;
	}

	public Country(){
		super();
	}
	
}