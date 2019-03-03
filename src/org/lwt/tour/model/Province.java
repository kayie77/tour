package org.lwt.tour.model;

import java.util.HashSet;
import java.util.Set;

public class Province {

	private int p_id;
	private String p_name;
	private Country country ;//  (Íâ¼ü)
	private Set<City> citys = new HashSet<City>();
	
	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public Set<City> getCitys() {
		return citys;
	}

	public void setCitys(Set<City> citys) {
		this.citys = citys;
	}

	public Province(){
		super();
	}
	
}