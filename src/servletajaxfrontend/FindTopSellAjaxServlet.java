package servletajaxfrontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ComputerDao;
import model.Computer;


@WebServlet("/FindTopSellAjax")
public class FindTopSellAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FindTopSellAjaxServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ComputerDao computerDao = (ComputerDao)getServletContext().getAttribute("computerDao");
		
		List<Computer> groupComputers = computerDao.getGroupComputerHasTopPurchase();
		
		int size = groupComputers.size();
		
		request.setAttribute("groupComputers", groupComputers);
		request.setAttribute("size", size);
		
		RequestDispatcher rd = request.getRequestDispatcher("/ajax/products.jsp");
		rd.forward(request, response);
	}

}
