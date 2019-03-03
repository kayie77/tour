package org.lwt.tour.model;

import java.util.HashSet;
import java.util.Set;

public class City {

	private int ct_id;
	private String ct_name;
	private Province province;
	private Set<Scenic> scenics = new HashSet<Scenic>();

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public int getCt_id() {
		return ct_id;
	}

	public void setCt_id(int ct_id) {
		this.ct_id = ct_id;
	}

	public String getCt_name() {
		return ct_name;
	}

	public void setCt_name(String ct_name) {
		this.ct_name = ct_name;
	}

	public Set<Scenic> getScenics() {
		return scenics;
	}

	public void setScenics(Set<Scenic> scenics) {
		this.scenics = scenics;
	}

	public City(){
		super();
	}
	
}