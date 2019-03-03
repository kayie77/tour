package org.lwt.tour.model;

public class Scenic {

	private int s_id;
	private String s_name;
	private String price;
	private String address;
	private String imageUrl;
	private String bgUrl;
	private String description;
	private City city;
	private ScenicClass scenicClass;

	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getBgUrl() {
		return bgUrl;
	}

	public void setBgUrl(String bgUrl) {
		this.bgUrl = bgUrl;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public ScenicClass getScenicClass() {
		return scenicClass;
	}

	public void setScenicClass(ScenicClass scenicClass) {
		this.scenicClass = scenicClass;
	}

	public Scenic(){
		super();
	}
}