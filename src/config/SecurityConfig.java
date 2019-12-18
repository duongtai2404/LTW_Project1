package config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SecurityConfig {
	public static final String ROLE_ADMIN="admin";
	public static final String ROLE_USER="user";
	
	//This map holds urls what are need to login and urls what role can access
	//Key = role,Value=List url what need to login
	private static final Map<String, List<String>> urlsWhatAreNeedToLogIn = new HashMap<String, List<String>>();
	
	static{
		init();
	}
	
	private static void init(){
		//List url what role user can access;
		List<String> urlWhatUserCanAccess = new ArrayList<String>();
		urlWhatUserCanAccess.add("/shoppingCart");
		urlWhatUserCanAccess.add("/addReview");
		//add list url what need to Login by user;
		urlsWhatAreNeedToLogIn.put(ROLE_USER, urlWhatUserCanAccess);
		
		//List url what role admin can access;
		List<String> urlWhatAdminCanAccess = new ArrayList<String>();
		urlWhatAdminCanAccess.add("/admin");
		//add list url what need to Login by admin;
		urlsWhatAreNeedToLogIn.put(ROLE_ADMIN, urlWhatAdminCanAccess);
	}
	
	//get all role in app
	 public static Set<String> getAllRoles() {
	        return urlsWhatAreNeedToLogIn.keySet();
	    }
	 
	 //get list url need to login by role
    public static List<String> getUrlForRole(String role) {
        return urlsWhatAreNeedToLogIn.get(role);
    }

}
