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
	
	
	public static void main(String[] args) {
		ComputerDao cd = new ComputerDao();
		List<String> images = new ArrayList<String>();
		images.add("images/25.jpg");
		images.add("images/24.jpg");
		images.add("images/23.jpg");
		images.add("images/22.jpg");
		Computer computer = new Computer("as-eb-004", "Asus EeeBook", "La mot trong cac san pham di dau xu huong netbook. EeBook voi man hinh 11 inch da dem den cho nguoi dung nhieu dieu bat ngo. Cau hinh duoc trang bi CPU quad-cỏe Intel Atom, 2GB RAM va 32GB dung luong luu tru. Thoi luong pin keo dai 12 gio.", "asus", "new", 450, 4000, images, 5);
		cd.add(computer);
	}

}
