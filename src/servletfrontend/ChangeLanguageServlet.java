package servletfrontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Local;


@WebServlet("/ChangeLanguage")
public class ChangeLanguageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangeLanguageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String language= request.getParameter("language");
		session.setAttribute("language", language);
		String referer = request.getHeader("Referer");
		
		response.sendRedirect(referer);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
