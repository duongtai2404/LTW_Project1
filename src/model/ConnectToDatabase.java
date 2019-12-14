package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectToDatabase {
	
	//Database configuration
	public static String url = "jdbc:mysql://localhost:3306/computer_store";
    public static String dbdriver = "com.mysql.cj.jdbc.Driver";
    public static String username = "root";
    public static String password = "01658534114";
    
	public ConnectToDatabase() {
	}
	
	// connect with database computer_store
	public static Connection getConnect() throws Exception{
		Connection connection = null;
		try {
			Class.forName(dbdriver);
			connection = DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			System.out.println("Exception in Connect to database: " + e);
			throw new Exception("Couldn't open connection to database: " +
                    e.getMessage());
		}
		return connection;
	}
	
	/*@parameter: String sql
	 * @return : void
	 * excute update,remove,insert to database with parameter spl
	 */
	public void excuteSQL(String sql) throws Exception{
		Connection connection = getConnect();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.executeUpdate();
	}
	
	/*@parameter: String sql
	 *@return: void
	 *select data from database with parameter sql
	 */
	public ResultSet selectData(String sql) throws Exception{
		Connection connection = getConnect();
		PreparedStatement stmt = connection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		return rs;
	}
	
	
	//test connect to database
	public static void main(String[] args) throws Exception {
		ConnectToDatabase connetToDatabase = new ConnectToDatabase();
		ResultSet rs = connetToDatabase.selectData("SELECT * FROM user WHERE name='Duongtai'");
		while(rs.next()){
			System.out.println(rs.getInt(1) + "\t" + rs.getString(2) + "\t" + rs.getString(3) + "\t" + rs.getString(4) + "\t" + rs.getString(5) + "\t" + rs.getInt(6));
		}
	}
	
}
