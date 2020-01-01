package servletajaxfrontend;

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


@WebServlet("/FindNewAjax")
public class FindNewComputerAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FindNewComputerAjaxServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ComputerDao computerDao = (ComputerDao)getServletContext().getAttribute("computerDao");
		
		String type = request.getParameter("type");
		List<Computer> groupComputers = computerDao.getGroupComputerWithStatusAndName(type, "new");
		
		int size = groupComputers.size();
		
		request.setAttribute("groupComputers", groupComputers);
		request.setAttribute("size", size);
		
		RequestDispatcher rd = request.getRequestDispatcher("/ajax/products.jsp");
		rd.forward(request, response);
	}

}
