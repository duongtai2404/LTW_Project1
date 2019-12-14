package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import utils.SecurityUtils;

@WebFilter("/*")
public class SecurityFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession();
		//lấy servlet path
        String servletPath = request.getServletPath();
		User loginedUser = (User)session.getAttribute("user");
		
		if(servletPath.equalsIgnoreCase("/SignIn")){
			chain.doFilter(request, response);
			return;
		}
		
		//Trường hợp page yêu cầu đăng nhập
        if (SecurityUtils.isSecurityPage(request)) {
        	//Lấy đường dẫn trước khi tới filter này
        	String redirectUri = request.getRequestURI();
            // Nếu người dùng chưa đăng nhập,
            // Redirect (chuyển hướng) tới trang đăng nhập.
            if (loginedUser == null) {
                session.setAttribute("redirectUri", redirectUri);
                // Lưu trữ trang hiện tại để redirect đến sau khi đăng nhập thành công.
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
                dispatcher.forward(request,response);
                return;
            }
            else{
            	if(!SecurityUtils.hasPermission(request)){
            		response.sendRedirect(redirectUri);
            		return;
            	}
            }
        }
        chain.doFilter(request,response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
