package model;


public class User {
	private String userName;
	private String password;
	private String emailAddress;
	private String address;
	private int phone;
	private String role;
	
	public User(){
		
	}
	
	public User(String userName, String password, String emailAddress,
			String address, int phone, String role) {
		super();
		this.userName = userName;
		this.password = password;
		this.emailAddress = emailAddress;
		this.address = address;
		this.phone = phone;
		this.role = role;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmailAddress() {
		return emailAddress;
	}


	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getPhone() {
		return phone;
	}


	public void setPhone(int phone) {
		this.phone = phone;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [userName=" + userName + ", password=" + password
				+ ", emailAddress=" + emailAddress + ", address=" + address
				+ ", phone=" + phone + ", role=" + role + "]";
	}
	
}
