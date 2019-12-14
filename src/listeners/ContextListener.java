package listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import dao.ComputerDao;

public class ContextListener implements ServletContextListener {
	private ServletContext context = null;
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		context = event.getServletContext();

		ComputerDao computerDao = (ComputerDao) context.getAttribute("computerDao");

		if (computerDao != null) {
			context.removeAttribute("computerDao");
		}
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		context = event.getServletContext();

		try {
			ComputerDao computerDao = new ComputerDao();
			context.setAttribute("computerDao", computerDao);
		} catch (Exception ex) {
			System.out.println("Couldn't create computerDao : "
					+ ex.getMessage());
		}
		
	}

}
