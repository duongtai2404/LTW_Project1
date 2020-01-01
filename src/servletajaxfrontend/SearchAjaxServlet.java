package servletajaxfrontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Computer;
import dao.ComputerDao;


@WebServlet("/SearchAjax")
public class SearchAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SearchAjaxServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nameComputer = request.getParameter("nameComputer");
		
		HttpSession session = request.getSession();
		ComputerDao computerDao = (ComputerDao)getServletContext().getAttribute("computerDao");
		List<Computer> searchComputers = computerDao.searchComputerWithName(nameComputer);
		
		//if size of searchComputers >0, send searchComputers to search.jsp
		if(searchComputers.size() > 0){			
			request.setAttribute("searchComputers", searchComputers);
			request.getRequestDispatcher("/ajax/search.jsp").forward(request, response);
			return;
		}
		
		response.getWriter().write("");
		
	}

}
