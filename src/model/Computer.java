package model;

import java.util.List;

public class Computer {
	private String idComputer;
	private String nameComputer;
	private String description;
	private String type;
	private String status;
	private int oldPrice;
	private int newPrice;
	private List<String> images;
	private int rate;
	
	public Computer() {
	
	}

	public Computer(String idComputer, String nameComputer, String description,
			String type, String status, int oldPrice, int newPrice,
			List<String> images, int rate) {
		super();
		this.idComputer = idComputer;
		this.nameComputer = nameComputer;
		this.description = description;
		this.type = type;
		this.status = status;
		this.oldPrice = oldPrice;
		this.newPrice = newPrice;
		this.images = images;
		this.rate = rate;
	}

	public String getIdComputer() {
		return idComputer;
	}

	public void setIdComputer(String idComputer) {
		this.idComputer = idComputer;
	}

	public String getNameComputer() {
		return nameComputer;
	}

	public void setNameComputer(String nameComputer) {
		this.nameComputer = nameComputer;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(int oldPrice) {
		this.oldPrice = oldPrice;
	}

	public int getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(int newPrice) {
		this.newPrice = newPrice;
	}

	public List<String> getImages() {
		return images;
	}

	public void setImages(List<String> images) {
		this.images = images;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}
	
	//get computer's represent image
	public String getRepresentImage(){
		return images.get(0);
	}
	
	public static void main(String[] args) {
		System.out.println(5%3);
		
	}
}
