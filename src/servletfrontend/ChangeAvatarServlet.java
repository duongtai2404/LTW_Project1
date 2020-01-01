package servletfrontend;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.User;
import dao.UserDao;

@WebServlet("/ChangeAvatar")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	maxFileSize = 1024 * 1024 * 50, // 50MB
	maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ChangeAvatarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ChangeAvatarServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 UserDao userDao = new UserDao();
		 String userName = request.getParameter("userName");  	
	 	for (Part part : request.getParts()) {
	      String fileName = extractFileName(part);
	      // refines the fileName in case it is an absolute path
	      fileName = new File(fileName).getName();
	      part.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
	      userDao.changeAvatarOfUser(userName, "images/"+fileName);
	 	}
	 	User user = userDao.find(userName);
	 	session.setAttribute("user", user);
	    String referer = request.getHeader("Referer");

	    response.sendRedirect(referer);
	}
	 
	  /**
	   * Extracts file name from HTTP header content-disposition
	   */
  private String extractFileName(Part part) {
    String contentDisp = part.getHeader("content-disposition");
    String[] items = contentDisp.split(";");
    for (String s : items) {
      if (s.trim().startsWith("filename")) {
        return s.substring(s.indexOf("=") + 2, s.length() - 1);
      }
    }
    return "";
  }
  public File getFolderUpload() {
    File folderUpload = new File("/home/duongtai/workspace/LTW_Project1/WebContent/images");
    if (!folderUpload.exists()) {
      folderUpload.mkdirs();
    }
    return folderUpload;
  }

}
