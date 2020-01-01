package servletfrontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Computer;
import dao.ComputerDao;


@WebServlet("/Products")
public class ForwardProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ForwardProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ComputerDao computerDao = (ComputerDao)getServletContext().getAttribute("computerDao");
		List<Computer> groupComputers  = computerDao.getGroupComputerHasTopPurchase();

		request.setAttribute("groupComputers", groupComputers);
		request.setAttribute("size", groupComputers.size());
		RequestDispatcher rd = request.getRequestDispatcher("/products.jsp");
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
