package servletajaxfrontend;

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

@WebServlet("/AddProductAjax")
public class AddProductAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddProductAjaxServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShoppingCart shoppingCart = (ShoppingCart)getServletContext().getAttribute("shoppingCart");
		ComputerDao computerDao = (ComputerDao)getServletContext().getAttribute("computerDao");
		
		String idComputer = request.getParameter("idComputer");
		int quantity = Integer.parseInt(request.getParameter("quantity")); 
		
		
		//find computer with idComputer
		Computer computer = (Computer)computerDao.find(idComputer);
		
		shoppingCart.addItemWithQuantity(idComputer, computer, quantity);
		
//		session.setAttribute("shoppingCart", shoppingCart);
		
		request.getRequestDispatcher("/ajax/miniCart.jsp").forward(request, response);
		
	}

}
