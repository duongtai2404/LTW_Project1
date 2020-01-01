package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import model.Computer;
import model.ConnectToDatabase;

public class ComputerDao implements ObjectDao{
	private ConnectToDatabase connectToDatabase;
	
	public ComputerDao() {
		connectToDatabase = new ConnectToDatabase();
	}
	
	
	@Override
	public boolean add(Object object) {
		//cast object to computer
		Computer computer = (Computer)object;
		List<String> images = computer.getImages();
		//if computer is exists, return false;
		if(find(computer.getIdComputer()) ==null){
			String insertValue = "'" + computer.getIdComputer() + "','" + computer.getNameComputer() + "','" + computer.getDescription()
					+ "','" + computer.getType() + "','" + computer.getStatus() + "','" + computer.getOldPrice() 
					+  "','" + computer.getNewPrice() + "','" + images.get(0) + "','" + images.get(1) 
					+ "','" + images.get(2) + "','" + images.get(3) + "','" + computer.getRate() + "'"; 
			
			String sql = "INSERT INTO computers(idcomputer,namecomputer,description,type,status,oldprice,newprice,image1,image2,image3,image4,rate) VALUES (" + insertValue +");";
			//insert computer to database
			try {
				connectToDatabase.excuteSQL(sql);
			} catch (Exception e) {
				System.out.println("Couldn't not insert computer to database : " + e);
				e.printStackTrace();
				return false;
			}
			return true;
		}
		else{
			return false;			
		}
	}
	
	/*@parameter: String idComputer,int quantity
	 * @return: boolean
	 * update quantity of computer which has idcomputer
	 */
	public boolean updateQuantityWithIdComputer(String idComputer,int quantity){
		//if idComputer is exists, update quantity
		if(find(idComputer)!=null){
			String updateSQL = "UPDATE computers SET quantity =" + quantity + " WHERE idcomputer='" + idComputer + "';" ;
			try {
				//update in database
				connectToDatabase.excuteSQL(updateSQL);
			} catch (Exception e) {
				System.out.println("Couldn't not update quantity of computer in database computers" + e);
				e.printStackTrace();
				return false;
			}
			return true;
		}
		//if idComputer is not exists => return false;
		else{			
			return false;
		}
	}
	
	/*add new computer to database with quantity, if adding is success, return true 
	 * @parameter: Computer computer, int quantity
	 * @return: boolean
	 */
	public boolean addNewComputerWithQuantity(Computer computer,int quantity){
		//get list images of computer
		List<String> images = computer.getImages();
		//if computer is not exists, adding;
		if(find(computer.getIdComputer()) ==null){
			String insertValue = "'" + computer.getIdComputer() + "','" + computer.getNameComputer() + "','" + computer.getDescription()
					+ "','" + computer.getType() + "','" + computer.getStatus() + "','" + computer.getOldPrice() 
					+  "','" + computer.getNewPrice() + "','" + quantity + "','" + images.get(0) + "','" + images.get(1) 
					+ "','" + images.get(2) + "','" + images.get(3) + "','" + computer.getRate() + "'"; 
			
			String sql = "INSERT INTO computers(idcomputer,namecomputer,description,type,status,oldprice,newprice,quantity,image1,image2,image3,image4,rate) VALUES (" + insertValue +");";
			//insert computer to database
			try {
				connectToDatabase.excuteSQL(sql);
			} catch (Exception e) {
				System.out.println("Couldn't not add new computer with quantity to database : " + e);
				e.printStackTrace();
				return false;
			}
			return true;
		}
		else{
			return false;			
		}
	}

	@Override
	public Object find(String objectID) {
		String idComputer = objectID;
		Computer computer = null;
		String sql = "SELECT * FROM computers WHERE idcomputer='" + idComputer + "';";
		ResultSet resultSet;
		try {
			resultSet = connectToDatabase.selectData(sql);
			while(resultSet.next()){
//				String idComputer = resultSet.getString(2);
				String nameComputer = resultSet.getString(3);
				String description  =resultSet.getString(4);
				String type = resultSet.getString(5);
				String status = resultSet.getString(6);
				int oldPrice = resultSet.getInt(7);
				int newPrice = resultSet.getInt(8);
				List<String> images = new ArrayList<String>();
				images.add(resultSet.getString(10));
				images.add(resultSet.getString(11));
				images.add(resultSet.getString(12));
				images.add(resultSet.getString(13));
				int rate = resultSet.getInt(14);
				computer = new Computer(idComputer, nameComputer, description, type, status, oldPrice, newPrice, images, rate);	
			}
		} catch (Exception e) {
			e.printStackTrace();
			return computer;
		}
		
		return computer;
	}
	
	public List<Computer> getComputersWithType(String type){
		//computersPros holds list computer begin 1 to end 10..
		List<Computer> computersPros = new ArrayList<>();
		String sql = "SELECT * FROM computers WHERE type='" + type + "';";
		ResultSet resultSet;
		
		try {
			resultSet = connectToDatabase.selectData(sql);
			Computer computer;
			while(resultSet.next()){
				String idComputer = resultSet.getString(2);
				String nameComputer = resultSet.getString(3);
				String description  =resultSet.getString(4);
				String status = resultSet.getString(6);
				int oldPrice = resultSet.getInt(7);
				int newPrice = resultSet.getInt(8);
				List<String> images = new ArrayList<String>();
				images.add(resultSet.getString(10));
				images.add(resultSet.getString(11));
				images.add(resultSet.getString(12));
				images.add(resultSet.getString(13));
				int rate = resultSet.getInt(14);
				
				computer = new Computer(idComputer, nameComputer, description, type, status, oldPrice, newPrice, images, rate);
				computersPros.add(computer);
			}
		} catch (Exception e) {
			System.out.println("Error getComputersWithType, couldn't connect to database");
			e.printStackTrace();
			return computersPros;
		}
		//reverse computerPros, begin 10.. end 1
		Collections.reverse(computersPros);
		return computersPros;
	}

	@Override
	public boolean remove(Object object, String objectID) {
		return false;
	}
	
	/*find new computer in database
	 *@parameter:
	 *@return : List<Computer>; 
	 */
	public List<Computer> findNewProducts(){
		List<Computer> newComputers = new ArrayList<Computer>();
		String sql = "SELECT * FROM computers WHERE status ='new';";
		ResultSet resultSet;
		try {
			resultSet = connectToDatabase.selectData(sql);
			Computer computer;
			while(resultSet.next()){
				String idComputer = resultSet.getString(2);
				String nameComputer = resultSet.getString(3);
				String description  =resultSet.getString(4);
				String type = resultSet.getString(5);
				String status = resultSet.getString(6);
				int oldPrice = resultSet.getInt(7);
				int newPrice = resultSet.getInt(8);
				List<String> images = new ArrayList<String>();
				images.add(resultSet.getString(10));
				images.add(resultSet.getString(11));
				images.add(resultSet.getString(12));
				images.add(resultSet.getString(13));
				int rate = resultSet.getInt(14);
				
				computer = new Computer(idComputer, nameComputer, description, type, status, oldPrice, newPrice, images, rate);
				newComputers.add(computer);
			}
		} catch (Exception e) {
			System.out.println("Couldn't select data from database in findNewProduct " + e);
			e.printStackTrace();
		}
		//reverse newComputers because new products been add after
		Collections.reverse(newComputers);
		return newComputers;
	}
	
	/*find computer which has name like search parameter
	 * @parameter: String search
	 * @return: List<Computer>
	 */
	public List<Computer> searchComputerWithName(String search){
		//list computers which been found
		List<Computer> searchComputer = new ArrayList<Computer>();
		//sql which finds computer with search
		String sql = "SELECT * FROM computers WHERE namecomputer LIKE '%" + search + "%';";
		ResultSet resultSet;
		try {
			//select data from database
			resultSet = connectToDatabase.selectData(sql);
			Computer computer;
			while(resultSet.next()){
				String idComputer = resultSet.getString(2);
				String nameComputer = resultSet.getString(3);
				String description  =resultSet.getString(4);
				String type = resultSet.getString(5);
				String status = resultSet.getString(6);
				int oldPrice = resultSet.getInt(7);
				int newPrice = resultSet.getInt(8);
				List<String> images = new ArrayList<String>();
				images.add(resultSet.getString(10));
				images.add(resultSet.getString(11));
				images.add(resultSet.getString(12));
				images.add(resultSet.getString(13));
				int rate = resultSet.getInt(14);
				
				computer = new Computer(idComputer, nameComputer, description, type, status, oldPrice, newPrice, images, rate);
				searchComputer.add(computer);
			}
		} catch (Exception e) {
			System.out.println("Couldn't select data from computers database in searchComputerWithName" + e);
			e.printStackTrace();
		}
		return searchComputer;
	}
	
	/*check: if has enough quantity to sell, => update computers database
	 * @parameter: Computer computer, int quantity
	 * @return: boolean
	 */
	public boolean buyComputerWithQuantity(Computer computer,int quantity){
		String idComputer = computer.getIdComputer();
		String sql = "SELECT quantity,purchase FROM computers WHERE idcomputer='" + idComputer + "';";
		ResultSet resultSet;
		int quantityInDatabase = 0;
		int purchaseInDatabase = 0;
		try {
			resultSet = connectToDatabase.selectData(sql);
			while(resultSet.next()){
				quantityInDatabase = resultSet.getInt(1);
				purchaseInDatabase = resultSet.getInt(2);
			}
		} catch (Exception e) {
			System.out.println("Couldn't select data from database in checkHasComputer" + e);
			e.printStackTrace();
			return false;
		}
		
		if(quantityInDatabase >= quantity){
			int quantityAfterPay = quantityInDatabase - quantity;
			int purchaseAfterPay = purchaseInDatabase + quantity;
			updateQuantityAndPurchaseAfterPay(computer, quantityAfterPay, purchaseAfterPay);
			return true;
		}
		
		return false;
	}
	
	/*update quantity and purchase of computers database
	 * @parameter: Computer computer, int quantity,int purchase
	 * @return: boolean
	 */
	public boolean updateQuantityAndPurchaseAfterPay(Computer computer,int quantity,int purchase){
		String idComputer = computer.getIdComputer();
		String updateSQL = "UPDATE computers SET quantity =" + quantity + ",purchase ="+ purchase +" WHERE idcomputer='" + idComputer + "';" ;
		try {
			connectToDatabase.excuteSQL(updateSQL);
		} catch (Exception e) {
			System.out.println("Couldn't update quantity in database from updateQuantityAfterPay" + e);
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/*get list computers which have top purchase, list has 12 items
	 * @parameter: null
	 * @return: List<Computer>
	 */
	public List<Computer> getGroupComputerHasTopPurchase(){
		List<Computer> groupComputers = new ArrayList<Computer>();
		
		String sql = "SELECT * FROM computers ORDER BY purchase ASC LIMIT 12;";
		ResultSet resultSet;
		try {
			//select data from database
			resultSet = connectToDatabase.selectData(sql);
			Computer computer;
			while(resultSet.next()){
				String idComputer = resultSet.getString(2);
				String nameComputer = resultSet.getString(3);
				String description  =resultSet.getString(4);
				String type = resultSet.getString(5);
				String status = resultSet.getString(6);
				int oldPrice = resultSet.getInt(7);
				int newPrice = resultSet.getInt(8);
				List<String> images = new ArrayList<String>();
				images.add(resultSet.getString(10));
				images.add(resultSet.getString(11));
				images.add(resultSet.getString(12));
				images.add(resultSet.getString(13));
				int rate = resultSet.getInt(14);
				
				computer = new Computer(idComputer, nameComputer, description, type, status, oldPrice, newPrice, images, rate);
				groupComputers.add(computer);
			}
		} catch (Exception e) {
			System.out.println("Couldn't select data from computers database in searchComputerWithName" + e);
			e.printStackTrace();
		}
		
		return groupComputers;
	}
	
	/*get list computers which have status and type like status and type parmeter, list has 12 items
	 * @parameter: String type, String name
	 * @return: List<Computer>
	 */
	public List<Computer> getGroupComputerWithStatusAndName(String type,String status){
		List<Computer> groupComputers = new ArrayList<Computer>();
		
		String sql = "SELECT * FROM computers WHERE status='" + status +"' AND type = '" + type + "' LIMIT 12;";
		
		ResultSet resultSet;
		try {
			//select data from database
			resultSet = connectToDatabase.selectData(sql);
			Computer computer;
			while(resultSet.next()){
				String idComputer = resultSet.getString(2);
				String nameComputer = resultSet.getString(3);
				String description  =resultSet.getString(4);
				int oldPrice = resultSet.getInt(7);
				int newPrice = resultSet.getInt(8);
				List<String> images = new ArrayList<String>();
				images.add(resultSet.getString(10));
				images.add(resultSet.getString(11));
				images.add(resultSet.getString(12));
				images.add(resultSet.getString(13));
				int rate = resultSet.getInt(14);
				
				computer = new Computer(idComputer, nameComputer, description, type, status, oldPrice, newPrice, images, rate);
				groupComputers.add(computer);
			}
		} catch (Exception e) {
			System.out.println("Couldn't select data from computers database in searchComputerWithName" + e);
			e.printStackTrace();
		}
		
		return groupComputers;
	}
	
	/*get list computers which have top sell and have type like type parameter, list has 12 items
	 * @parameter: String type
	 * @return: List<Computer>
	 */
	public List<Computer> getGroupComputerTopSellWithType(String type){
		List<Computer> groupComputers = new ArrayList<Computer>();
		
		String sql = "SELECT * FROM computers WHERE type='"+ type+"' ORDER BY purchase ASC;";
		
		ResultSet resultSet;
		try {
			//select data from database
			resultSet = connectToDatabase.selectData(sql);
			Computer computer;
			while(resultSet.next()){
				String idComputer = resultSet.getString(2);
				String nameComputer = resultSet.getString(3);
				String description  =resultSet.getString(4);
				String status = resultSet.getString(6);
				int oldPrice = resultSet.getInt(7);
				int newPrice = resultSet.getInt(8);
				List<String> images = new ArrayList<String>();
				images.add(resultSet.getString(10));
				images.add(resultSet.getString(11));
				images.add(resultSet.getString(12));
				images.add(resultSet.getString(13));
				int rate = resultSet.getInt(14);
				
				computer = new Computer(idComputer, nameComputer, description, type, status, oldPrice, newPrice, images, rate);
				groupComputers.add(computer);
			}
		} catch (Exception e) {
			System.out.println("Couldn't select data from computers database in searchComputerWithName" + e);
			e.printStackTrace();
		}
		
		return groupComputers;
	}
	
	
	/*get list computers which have price between before and after parameter,
	 * @parameter: String type
	 * @return: List<Computer>
	 */
	public List<Computer> getGroupComputerHavePriceBetween(int before,int after){
		List<Computer> groupComputers = new ArrayList<Computer>();
		
		String sql = "SELECT * FROM computers WHERE newprice>" + before + " AND newprice<"+ after +" ORDER BY newprice DESC;";
		
		ResultSet resultSet;
		try {
			//select data from database
			resultSet = connectToDatabase.selectData(sql);
			Computer computer;
			while(resultSet.next()){
				String idComputer = resultSet.getString(2);
				String nameComputer = resultSet.getString(3);
				String description  =resultSet.getString(4);
				String type = resultSet.getString(5);
				String status = resultSet.getString(6);
				int oldPrice = resultSet.getInt(7);
				int newPrice = resultSet.getInt(8);
				List<String> images = new ArrayList<String>();
				images.add(resultSet.getString(10));
				images.add(resultSet.getString(11));
				images.add(resultSet.getString(12));
				images.add(resultSet.getString(13));
				int rate = resultSet.getInt(14);
				
				computer = new Computer(idComputer, nameComputer, description, type, status, oldPrice, newPrice, images, rate);
				groupComputers.add(computer);
			}
		} catch (Exception e) {
			System.out.println("Couldn't select data from computers database in searchComputerWithName" + e);
			e.printStackTrace();
		}
		
		return groupComputers;
	}

	public static void main(String[] args) {
		ComputerDao cd = new ComputerDao();
//		List<String> images = new ArrayList<String>();
//		images.add("images/25.jpg");
//		images.add("images/24.jpg");
//		images.add("images/23.jpg");
//		images.add("images/22.jpg");
//		Computer computer = new Computer("as-eb-004", "Asus EeeBook", "La mot trong cac san pham di dau xu huong netbook. EeBook voi man hinh 11 inch da dem den cho nguoi dung nhieu dieu bat ngo. Cau hinh duoc trang bi CPU quad-cỏe Intel Atom, 2GB RAM va 32GB dung luong luu tru. Thoi luong pin keo dai 12 gio.", "asus", "new", 450, 4000, images, 5);
//		cd.add(computer);
		List<Computer> list = cd.getGroupComputerHavePriceBetween(300, 600);
		for (Computer computer : list) {
			System.out.println(computer.getNameComputer());
		}
	}

}
