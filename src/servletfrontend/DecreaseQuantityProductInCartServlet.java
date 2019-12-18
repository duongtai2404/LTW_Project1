package servletfrontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Computer;
import model.ShoppingCart;
import dao.ComputerDao;


@WebServlet("/DecreaseQuantityProduct")
public class DecreaseQuantityProductInCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DecreaseQuantityProductInCartServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShoppingCart shoppingCart = (ShoppingCart)getServletContext().getAttribute("shoppingCart");
		//get showMiniCart from request
		String showMiniCart = request.getParameter("showMiniCart");
		//get idComputer from request
		String idComputer = request.getParameter("idComputer");
		//decrease quantity item
		shoppingCart.decreaseQuantityItem(idComputer);
		//save shopping cart into session
		session.setAttribute("shoppingCart", shoppingCart);
		
		if(showMiniCart != null){
			request.setAttribute("showMiniCart",showMiniCart);
		}
		
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
	}
	

}
