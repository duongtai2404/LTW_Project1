package servletfrontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import dao.UserDao;


@WebServlet("/SignIn")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
 
    public SignInServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		String userName = request.getParameter("Name");
		String password = request.getParameter("Password");
		UserDao userDao = new UserDao();
		User user;
		
		if(!userDao.checkLogin(userName, password)){
			request.getRequestDispatcher("/ajax/SignIn.jsp").forward(request, response);
			
			return;
		}
		else{
			user = userDao.find(userName);
			session.setAttribute("user", user);
			String roleUser = user.getRole();

			response.getWriter().print(roleUser);
		}
	}

}
