package org.lwt.tour.model;

import java.util.HashSet;
import java.util.Set;

public class LineClass {

	private int lc_id;
	private String lc_name;
	private Set<Line> lines = new HashSet<Line>();

	public int getLc_id() {
		return lc_id;
	}

	public void setLc_id(int lc_id) {
		this.lc_id = lc_id;
	}

	public String getLc_name() {
		return lc_name;
	}

	public void setLc_name(String lc_name) {
		this.lc_name = lc_name;
	}

	public Set<Line> getLines() {
		return lines;
	}

	public void setLines(Set<Line> lines) {
		this.lines = lines;
	}

	public LineClass(){
		super();
	}
	
}