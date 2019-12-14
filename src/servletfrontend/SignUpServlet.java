package servletfrontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.User;

@WebServlet("/SignUp")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SignUpServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//Connect to database
		UserDao userDao = new UserDao();
		
		User user;
		
		String userName = request.getParameter("Name");
		String address = request.getParameter("Address");
		String emailAddress = request.getParameter("Email");
		int phone;
		if(request.getParameter("Phone") == ""){
			phone = 0;	
		}
		else{
			phone = Integer.parseInt(request.getParameter("Phone"));						
		}
		
		//this wrongUser is used to send back data if error
		User wrongUser = new User(userName, "", emailAddress, address, phone, "");
		
		String errorSignup;
		
		if(userDao.userIsExists(userName)){
			errorSignup = "UserNameIsExists";
			session.setAttribute("errorSignup", errorSignup);
			session.setAttribute("wrongUser", wrongUser);
		}
		else{
			String password = request.getParameter("Password");
			String confirmPassword = request.getParameter("ConfirmPassword");
			if(!password.equalsIgnoreCase(confirmPassword)){
				errorSignup = "WorngConfirmPassword";
				session.setAttribute("errorSignup", errorSignup);
				session.setAttribute("wrongUser", wrongUser);
			}
			else{
				//if signup is success, create new user in database and create user in session
				String role = "user";
				user = new User(userName, password, emailAddress, address, phone, role);
				userDao.add(user);
				session.setAttribute("user", user);
			}
		}
		
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
