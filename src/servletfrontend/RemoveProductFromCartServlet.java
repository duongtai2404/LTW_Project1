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


@WebServlet("/RemoveProduct")
public class RemoveProductFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RemoveProductFromCartServlet() {
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

		//remove computer from cart
		shoppingCart.removeItem(idComputer);
		//save shopping cart into session
		session.setAttribute("shoppingCart", shoppingCart);
		
		String referer = request.getHeader("Referer");
		if(showMiniCart != null){
			if(referer.contains("showMiniCart") || referer.contains("shoppingCart")){				
				response.sendRedirect(referer);
				return;
			}
			else{			
				if(!referer.contains("?")){
					referer = referer + "?showMiniCart=true";
				}
				else{
					referer = referer + "&showMiniCart=true";
				}
			}
			
		}

		response.sendRedirect(referer);
	}

}
