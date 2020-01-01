package servletajaxfrontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ShoppingCart;


@WebServlet("/RemoveProductInCartAjax")
public class RemoveProductInCartAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RemoveProductInCartAjaxServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShoppingCart shoppingCart = (ShoppingCart)getServletContext().getAttribute("shoppingCart");
		
		String idComputer = request.getParameter("idComputer");

		shoppingCart.removeItem(idComputer);
		
		request.getRequestDispatcher("/ajax/miniCart.jsp").forward(request, response);
	}

}
