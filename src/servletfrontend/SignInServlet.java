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
		//Connect to database
		UserDao userDao = new UserDao();
		
		String redirectUri = (String)session.getAttribute("redirectUri");
		
		User user;
		
		String userName = request.getParameter("Name");
		String password = request.getParameter("Password");
		//check userName and password are valid
		if(!userDao.checkLogin(userName, password)){
			//if userName and password are invalid -> send error 
			String errorSignin = "WrongUserNameOrPassWord";
			session.setAttribute("errorSignin", errorSignin);
		}
		else{
			//if user is valid, create user in session
			user = userDao.find(userName);
			session.setAttribute("user", user);
			//if user's role is admin, dispatcher "/index.jsp" backend's index
			if(user.getRole().equalsIgnoreCase("admin")){
				getServletContext().getRequestDispatcher("/WEB-INF/admin/index.jsp").forward(request, response);
				return;
			}
		}
		if(redirectUri!=null){
			response.sendRedirect(redirectUri);
			return;
		}
		else{			
			getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

}
