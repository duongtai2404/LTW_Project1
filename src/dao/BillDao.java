package dao;

import java.time.LocalDate;

import model.Bill;
import model.ConnectToDatabase;
import model.Date;

public class BillDao implements ObjectDao {
	private ConnectToDatabase connectToDataBase;
	public BillDao() {
		connectToDataBase = new ConnectToDatabase();
	}
	
	@Override
	public boolean add(Object object) {
		Bill bill = (Bill) object;
		String sql = "INSERT INTO bills(idcomputer,name,quantity,total,emailaddress,address,phone,date) "
				+ "VALUES ('" + bill.getIdComputer() + "','" + bill.getName() + "',"+ bill.getQuantity() + 
				"," + bill.getTotal() + ",'" + bill.getEmailAddress() + "','" + bill.getEmailAddress() + "',"
				+ bill.getPhone() + ",'" + bill.getDate().toString() +"');";
		try {
			connectToDataBase.excuteSQL(sql);
		} catch (Exception e) {
			System.out.println("Couldn't insert bill in database" + e);
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Object find(String objectID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(Object object, String objectID) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public static void main(String[] args) {
		LocalDate d = LocalDate.now();
		Bill bill = new Bill("b", "tai", 2, 400, "tai@gmail.com", "vn", 12341234, new Date(d.getDayOfMonth(),d.getMonthValue(),d.getYear()));
		BillDao bd = new BillDao();
		bd.add(bill);
		System.out.println(d.getDayOfMonth());
	}

}
