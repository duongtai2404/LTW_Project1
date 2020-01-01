package model;

public class Review {
	private String nameUser;
	private String idComputer;
	private String review;
	private int rate;
	private String avatarUser;
	
	public Review() {

	}

	public Review(String nameUser, String idComputer, String review, int rate,String avatarUser) {
		super();
		this.nameUser = nameUser;
		this.idComputer = idComputer;
		this.review = review;
		this.rate = rate;
		this.avatarUser = avatarUser;
	}

	public String getAvatarUser() {
		return avatarUser;
	}

	public void setAvatarUser(String avatarUser) {
		this.avatarUser = avatarUser;
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	public String getIdComputer() {
		return idComputer;
	}

	public void setIdComputer(String idComputer) {
		this.idComputer = idComputer;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}
	
	
}
