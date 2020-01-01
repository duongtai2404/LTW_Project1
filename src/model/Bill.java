package model;


public class Bill {
	private String idComputer;
	private String name;
	private int quantity;
	private int total;
	private String emailAddress;
	private String address;
	private int phone;
	private Date date;

	public Bill(String idComputer, String name, int quantity, int total,
			String emailAddress, String address, int phone, Date date) {
		super();
		this.idComputer = idComputer;
		this.name = name;
		this.quantity = quantity;
		this.total = total;
		this.emailAddress = emailAddress;
		this.address = address;
		this.phone = phone;
		this.date = date;
	}

	public String getIdComputer() {
		return idComputer;
	}

	public void setIdComputer(String idComputer) {
		this.idComputer = idComputer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public static void main(String[] args) {
		int d = java.time.LocalDate.now().getDayOfMonth();
		int m = java.time.LocalDate.now().getMonthValue();
		int y = java.time.LocalDate.now().getYear();
		System.out.println(d);
		System.out.println(m);
		System.out.println(y);
//		System.out.println(date.toString());
	}
}
