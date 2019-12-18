package servletfrontend;

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


@WebServlet("/SearchComputers")
public class SearchComputersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SearchComputersServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		//get value from parameter search
		String search = request.getParameter("Search");
		//get computerDao in session
		ComputerDao computerDao = (ComputerDao)sesion.getAttribute("computerDao");
		//select data from computers database which has name like search
		List<Computer> searchComputers = computerDao.searchComputerWithName(search);
		
		//if size of searchComputers >0, send searchComputers to search.jsp
		if(searchComputers.size() > 0){			
			sesion.setAttribute("searchComputers", searchComputers);
		}
		
		String showMiniCart = (String)request.getAttribute("showMiniCart");
		if(showMiniCart !=null){
			request.setAttribute("showMiniCart", showMiniCart);
		}
		
		//dispatcher to search.jsp
		getServletContext().getRequestDispatcher("/search.jsp").forward(request, response);
	}

}
