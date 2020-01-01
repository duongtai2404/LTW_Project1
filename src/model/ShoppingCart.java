package model;

import java.util.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class ShoppingCart {
	private Map<String , ShoppingCartItem> cart;
	
	public ShoppingCart() {
		cart = new HashMap<String, ShoppingCartItem>();
	}

	public ShoppingCart(Map<String, ShoppingCartItem> cart) {
		super();
		this.cart = cart;
	}

	public Map<String, ShoppingCartItem> getCart() {
		return cart;
	}

	public void setCart(Map<String, ShoppingCartItem> cart) {
		this.cart = cart;
	}
	
	/*get size(number of item in cart)
	 * @parameter: null
	 * @return : int
	 */
	public int getSize(){
		return cart.size();
	}
	
	public int getSubtotal(){
		List<ShoppingCartItem> items = getItems();
		int subTotal = 0;
		for (ShoppingCartItem item : items) {
			subTotal = subTotal + item.getPrice();
		}
		return subTotal;
	}
	
	/*get key of cart(map)
	 * @parameter: null
	 * @return: Set<String>
	 */
	public Set<String> getKey(){
		return cart.keySet();
	}
	
	public ArrayList<ShoppingCartItem> getItems(){
		ArrayList<ShoppingCartItem> items = new ArrayList<ShoppingCartItem>();
		ShoppingCartItem shoppingCartItem;
		Set<String> keys = getKey();
		for (String key : keys) {
			shoppingCartItem = cart.get(key);
			items.add(shoppingCartItem);
		}
		return items;
	}
	
	/*get item in cart
	 *@parameter: String key
	 *@return: ShoppingCartItem1 
	 */
	public ShoppingCartItem getItem(String key){
		return cart.get(key);
	}
	
	/*add item to shopping cart, if this item is exists, increasing the quantity, if no, add to cart
	 * @parameter: String key,Object object
	 *@return: boolean
	 */
	public boolean addItem(String key,Computer computer){
		if(cart.containsKey(key)){
			cart.get(key).increasingTheQuantity();
		}
		else{
			ShoppingCartItem item = new ShoppingCartItem(computer);
			cart.put(key,item);
		}
		return true;
	}
	
	public boolean addItemWithQuantity(String key,Computer computer,int quantity){
		if(cart.containsKey(key)){
			cart.get(key).increasingTheQuantityWithQuantity(quantity);
		}
		else{
			ShoppingCartItem item = new ShoppingCartItem(computer, quantity);
			cart.put(key,item);
		}
		return true;
	}
	
	/*decrease quantity of item which cart has
	 * @parameter: String key
	 * @return: boolean
	 */
	public boolean decreaseQuantityItem(String key){
		if(cart.containsKey(key)){
			cart.get(key).decreasingTheQuantity();
			if(cart.get(key).getQuantity() == 0){
				cart.remove(key);
			}
			return true;
		}
		return false;
	}
	
	/*remove item from cart
	 * @parameter: String key
	 * @return: boolean
	 */
	public boolean removeItem(String key){
		if(cart.containsKey(key)){
			cart.remove(key);
			return true;
		}
		return false;
	}
}
