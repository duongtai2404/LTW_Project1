package utils;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import model.User;
import config.SecurityConfig;

public class SecurityUtils {
	 // 
	/*Kiểm tra 'request' này có bắt buộc phải đăng nhập hay không
	 *@parameter: HttpServletRequest request
	 *@return: boolean
	 */
    public static boolean isSecurityPage(HttpServletRequest request) {
        //Lấy servletPath từ request
    	String servletPath = request.getServletPath();
        Set<String> roles = SecurityConfig.getAllRoles();
 
        for (String role : roles) {
            List<String> urlPatterns = SecurityConfig.getUrlForRole(role);
            if (urlPatterns.contains(servletPath)) {
                return true;
            }
        }
        return false;
    }
 
    // 
    /*Kiểm tra 'request' này có vai trò phù hợp hay không?
     * @parameter: HttpServletRequest request
     * @return: boolean
     */
    public static boolean hasPermission(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	//Lấy servletPath từ request
    	String servletPath = request.getServletPath();
    	//Lấy User từ request
    	User loginedUser = (User)session.getAttribute("user");
    	//Role của user
        String roleLoginedUser = loginedUser.getRole();
        //Danh sách các url mà roleLoginedUser có thể vào
        List<String> urlsForUser = SecurityConfig.getUrlForRole(roleLoginedUser);

        for (String url : urlsForUser) {
			if(url.equalsIgnoreCase(servletPath))
				return true;
		}
        return false;
    }
}
