package servletfrontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;

import model.User;
import dao.UserDao;

@WebServlet("/Login")
public class LoginAccoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginAccoutServlet() {
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
		
		//get action (signin or signup)
		String action = request.getParameter("action");
		
		
		//action signin
		if(action.equalsIgnoreCase("signin")){
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
					getServletContext().getRequestDispatcher("/backend/index.jsp").forward(request, response);
					return;
				}
			}
		}
		
		//Action logout
		else if(action.equalsIgnoreCase("LogOut")){
			session.invalidate();
		}
		
		//Action sign up
		else if(action.equalsIgnoreCase("signup")){
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
		}
		
		//another action
		else{
			
		}
		
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
