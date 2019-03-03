package org.lwt.tour.model;

public class Line {

	private int l_id;
	private String l_name;
	private String price;
	private String imageUrl;
	private String bgUrl;
	private String description;
	private LineClass lineClass;

	public int getL_id() {
		return l_id;
	}

	public void setL_id(int l_id) {
		this.l_id = l_id;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getBgUrl() {
		return bgUrl;
	}

	public void setBgUrl(String bgUrl) {
		this.bgUrl = bgUrl;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LineClass getLineClass() {
		return lineClass;
	}

	public void setLineClass(LineClass lineClass) {
		this.lineClass = lineClass;
	}

	public Line(){
		super();
	}
	
}