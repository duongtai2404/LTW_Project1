package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import model.ConnectToDatabase;
import model.User;

public class UserDao implements ObjectDao{
	private ConnectToDatabase connectToDataBase;
	public UserDao() {
		connectToDataBase = new ConnectToDatabase();

	}
	
	/*@parameter: Object object
	 *@return boolean
	 * add user to database
	 */
	@Override
	public boolean add(Object object) {
		//cast object to user
		User user = (User)object;
		//if user is exists, return false
		if(find(user.getUserName()) == null){
			//values insert to database
			String insertValue = "'" + user.getUserName() + "','" + user.getPassword() + "','" + user.getEmailAddress()
					+ "','" + user.getAddress() + "','" + user.getPhone() + "','" + user.getRole() + "','" + user.getAvatar() + "'";
			
			String sql = "INSERT INTO users(name,password,emailaddress,address,phone,role,avatar) VALUES (" + insertValue +");";
			//insert user to database
			try {
				connectToDataBase.excuteSQL(sql);
			} catch (Exception e) {
				System.out.println("Couldn't not insert user to database : " + e);
				e.printStackTrace();
				return false;
			}
			return true;
			
		}
		else{
			return false;
		}		
	}

	/*@parameter: String objectID
	 *@return: user
	 *find user with userName 
	 */
	@Override
	public User find(String objectID) {
		User user = null;
		String userName = objectID;
		String sql = "SELECT * FROM users WHERE name='" + userName + "';";
		ResultSet resultSet;
		try {
			resultSet = connectToDataBase.selectData(sql);
			while(resultSet.next()){
				String password = resultSet.getString(3);
				String emailAddress = resultSet.getString(4);
				String address = resultSet.getString(5);
				int phone = resultSet.getInt(6);
				String role = resultSet.getString(7);
				String avatar = resultSet.getString(8);
				user = new User(userName, password, emailAddress, address, phone, role,avatar);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return user;
		}
		return user;
		
	}

	@Override
	public boolean remove(Object object, String objectID) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public boolean checkLogin(String userName,String password){
		User user = find(userName);
		if(user!=null && user.getPassword().equalsIgnoreCase(password)){
			return true;
		}
		return false;
	}
	
	public boolean userIsExists(String userName){
		User user = find(userName);
		if(user==null){
			return false;
		}
		return true;
	}
	
	public boolean changeAvatarOfUser(String userName,String avatar){
		String sql = "UPDATE users SET avatar='" + avatar + "' WHERE name='" + userName + "';";
		try {
			connectToDataBase.excuteSQL(sql);
		} catch (Exception e) {
			System.out.println("Couldn't not update avatar" + e);
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean test(){
		String sql = "select * from date;";
		ResultSet resultSet;
		Date date = null;
		
		try {
			resultSet = connectToDataBase.selectData(sql);
			while(resultSet.next()){
				date = resultSet.getDate(1);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(date.toString());
		return true;
	}
	
	//test connect to database
	public static void main(String[] args) {
	}
}
