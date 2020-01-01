package model;

public class ShoppingCartItem {
	private Computer computer;
	private int quantity;
	private int price;
	
	public ShoppingCartItem(Computer computer) {
		this.computer = computer;
		this.quantity = 1;
		this.price = computer.getNewPrice();
	}
	
	public ShoppingCartItem(Computer computer,int quantity) {
		this.computer = computer;
		this.quantity = quantity;
		this.price = computer.getNewPrice() * quantity;
	}

	public ShoppingCartItem(Computer computer, int quantity, int price) {
		super();
		this.computer = computer;
		this.quantity = quantity;
		this.price = price;
	}

	public Computer getComputer() {
		return computer;
	}

	public void setComputer(Computer computer) {
		this.computer = computer;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	/*The quantity been increased 1 => return true;
	 * @parameter: null
	 * @return: boolean
	 */
	public boolean increasingTheQuantity(){
		quantity = quantity + 1;
		price = price + computer.getNewPrice();
		return true;
	}
	
	/*The quantity been increased quatity(parameter) => return true
	 * @parameter: int quantity
	 * @return: boolean
	 */
	public boolean increasingTheQuantityWithQuantity(int quantity){
		this.quantity = this.quantity + quantity;
		price = computer.getNewPrice() * this.quantity;
		return true;
	}
	
	/*The quantity been decreased 1
	 * @parameter: null
	 * @return: boolean
	 */
	public boolean decreasingTheQuantity(){
		quantity = quantity -1;
		price = price - computer.getNewPrice();
		return true;
	}

	@Override
	public String toString() {
		return computer.getNameComputer() + "\t" + quantity + "\t $" + computer.getNewPrice() + "\t $" + price;
	}
	
	
}
