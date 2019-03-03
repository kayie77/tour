package org.lwt.tour.model;

import java.util.HashSet;
import java.util.Set;

public class ScenicClass {

	private int sc_id;
	private String sc_name;
	private Set<Scenic> scenics = new HashSet<Scenic>();
	
	public int getSc_id() {
		return sc_id;
	}

	public void setSc_id(int sc_id) {
		this.sc_id = sc_id;
	}

	public String getSc_name() {
		return sc_name;
	}

	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}

	public Set<Scenic> getScenics() {
		return scenics;
	}

	public void setScenics(Set<Scenic> scenics) {
		this.scenics = scenics;
	}

	public ScenicClass(){
		super();
	}
	
}