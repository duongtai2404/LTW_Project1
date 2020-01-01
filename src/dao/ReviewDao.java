package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.ConnectToDatabase;
import model.Review;

public class ReviewDao implements ObjectDao {
	private ConnectToDatabase connectToDatabase;
	public ReviewDao() {
		connectToDatabase = new ConnectToDatabase();
	}
	
	@Override
	public boolean add(Object object) {
		//cast object to review
		Review review = (Review)object;
		String insertValue = "'"+ review.getNameUser() + "','" + review.getIdComputer() + "','" + review.getReview() + "','" + review.getRate() + "'";
		String sql = "INSERT INTO reviews(name,idcomputer,review,rate) VALUES (" + insertValue + ");";
		
		try {
			connectToDatabase.excuteSQL(sql);
		} catch (Exception e) {
			System.out.println("Couldn't not add review to database review" + e);
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/*find reviews about computer which has idcomputer;
	 * @parameter:String objectID
	 * @return:Object
	 * (non-Javadoc)
	 * @see dao.ObjectDao#find(java.lang.String)
	 */
	@Override
	public Object find(String objectID) {
		String idComputer = objectID;
		String sql = "SELECT DISTINCT reviews.*,users.avatar FROM reviews,users WHERE reviews.name=users.name AND reviews.idcomputer='" + idComputer +"';";
		//List review about computer
		ArrayList<Review> reviews = new ArrayList<Review>();
		Review reviewAboutComputer;
		
		ResultSet resultSet;
		try {
			resultSet = connectToDatabase.selectData(sql);
			while(resultSet.next()){
				String nameUser = resultSet.getString(1);
				String review = resultSet.getString(3);
				int rate = resultSet.getInt(4);
				String avatarUser = resultSet.getString(5);
				reviewAboutComputer = new Review(nameUser, idComputer, review, rate,avatarUser);
				reviews.add(reviewAboutComputer);
			}
		} catch (Exception e) {
			System.out.println("Couldn't not select data from reviews in find() " + e);
			e.printStackTrace();
		}
		
		return reviews;
	}
	
	@Override
	public boolean remove(Object object, String objectID) {
		return false;
	}
	
 	
	//test ReviewDao
	public static void main(String[] args) {
		ReviewDao rd = new ReviewDao();
		List<Review> reviews = (ArrayList<Review>)rd.find("as-sb-004");
		for (Review review : reviews) {
			System.out.println(review.getReview());
		}
		
		
	}
	
}
