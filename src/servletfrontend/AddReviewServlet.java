package servletfrontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ComputerDao;
import dao.ReviewDao;
import model.Computer;
import model.Review;
import model.User;

@WebServlet("/addReview")
public class AddReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ReviewDao reviewDao = new ReviewDao();
		
		User loginedUser = (User)session.getAttribute("user");
		String nameUser = loginedUser.getUserName();
		
		String review = (String)request.getParameter("review");
		String idComputer = request.getParameter("idComputer");
		int rate = 5;
		
		Review reviewUser = new Review(nameUser, idComputer, review, rate);
		reviewDao.add(reviewUser);
				
		response.sendRedirect(request.getRequestURI());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ReviewDao reviewDao = new ReviewDao();
		
		User loginedUser = (User)session.getAttribute("user");
		String nameUser = loginedUser.getUserName();
		//get review from user
		String review = request.getParameter("review");
		//id computer what user reviews about
		String idComputer = request.getParameter("idComputer");
		int rate = 5;
		
		Review reviewUser = new Review(nameUser, idComputer, review, rate);
		reviewDao.add(reviewUser);
		
		//Redirect old page
		ComputerDao computerDao = (ComputerDao)session.getAttribute("computerDao");
		Computer computer = (Computer)computerDao.find(idComputer);
		ArrayList<Review> reviews = (ArrayList<Review>)reviewDao.find(idComputer);
		
		request.setAttribute("computer", computer);
		request.setAttribute("reviews", reviews);
		request.setAttribute("sizeReviews", reviews.size());
		
		getServletContext().getRequestDispatcher("/single.jsp").forward(request, response);
	}

}
