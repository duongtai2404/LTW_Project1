package servletfrontend;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ComputerDao;
import model.Computer;
import model.ShoppingCart;


@WebServlet("/AddProduct")
public class AddProductIntoCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddProductIntoCartServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShoppingCart shoppingCart = (ShoppingCart)getServletContext().getAttribute("shoppingCart");
		ComputerDao computerDao = (ComputerDao)getServletContext().getAttribute("computerDao");
		//get showMiniCart from request
		String showMiniCart = request.getParameter("showMiniCart");
		//get idComputer from request
		String idComputer = request.getParameter("idComputer");
		//find computer with idComputer
		Computer computer = (Computer)computerDao.find(idComputer);
		//add computer into cart
		shoppingCart.addItem(idComputer, computer);
		//save shopping cart into session
		session.setAttribute("shoppingCart", shoppingCart);
		
		if(showMiniCart != null){
			request.setAttribute("showMiniCart",showMiniCart);
		}
		
		
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
	}

}
