package listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import model.ShoppingCart;
import dao.ComputerDao;

public class ContextListener implements ServletContextListener {
	private ServletContext context = null;
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		context = event.getServletContext();
		ShoppingCart shoppingCart = (ShoppingCart) context.getAttribute("shoppingCart");
		ComputerDao computerDao = (ComputerDao) context.getAttribute("computerDao");

		if (computerDao != null && shoppingCart !=null) {
			context.removeAttribute("computerDao");
			context.removeAttribute("shoppingCart");
		}
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		context = event.getServletContext();

		try {
			ShoppingCart shoppingCart = new ShoppingCart();
			ComputerDao computerDao = new ComputerDao();
			context.setAttribute("shoppingCart", shoppingCart);
			context.setAttribute("computerDao", computerDao);
		} catch (Exception ex) {
			System.out.println("Couldn't create computerDao or shoppingCart: "
					+ ex.getMessage());
		}
		
	}

}
