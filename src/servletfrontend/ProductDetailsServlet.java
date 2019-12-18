package servletfrontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.rmi.server.Dispatcher;
import model.Computer;
import model.Review;
import dao.ComputerDao;
import dao.ReviewDao;


@WebServlet("/productDetails")
public class ProductDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductDetailsServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idComputer = request.getParameter("idComputer");
		//if parameter idcomputer is null, => redirect old page
		if(idComputer == null){
			response.sendRedirect(request.getRequestURI());
			return;
		}
		
		HttpSession session = request.getSession();
		ComputerDao computerDao = (ComputerDao)session.getAttribute("computerDao");
		Computer computer = (Computer)computerDao.find(idComputer);
		
		ReviewDao reviewDao = new ReviewDao();
		ArrayList<Review> reviews = (ArrayList<Review>)reviewDao.find(idComputer);
		
		request.setAttribute("computer", computer);
		request.setAttribute("reviews", reviews);
		request.setAttribute("sizeReviews", reviews.size());
		
		getServletContext().getRequestDispatcher("/single.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
