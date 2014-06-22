package creatorparty;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;

public class SignInOutCreatorPartyServlet extends HttpServlet{

	@Override
	 public void doGet(HttpServletRequest req, HttpServletResponse resp)
             throws IOException {
		
		try{
			UserBean user = new UserBean();
			user.setUserName(req.getParameter("exampleSignInID"));
			user.setPassword(req.getParameter("exampleSignInPassword"));
			
			user = UserDAO.login(user);
		}
	 DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
     Key CreatorPartyKey = KeyFactory.createKey("UserList", "User");

     String ID = req.getParameter("exampleSignInID");
     String Password = req.getParameter("exampleSignInPassword");
     
     Query query = new Query("UserInfo", CreatorPartyKey);
     List<Entity> users = datastore.prepare(query).asList(FetchOptions.Builder.withDefaults());
     
     for(Entity user : users){
    	 if(user.getProperty(ID) == ID)
    	 {
    	   	 if(user.getProperty(Password) == Password)
        	 {
    	   		 
    	   		 break;
        	 }
    	   	 else
    	   	 {
    	   		 
    	   	 }
    	 }		 
     }
    
     resp.sendRedirect("/Login.jsp");
	 }
	
	public class UserBean {
		
	      private String username;
	      private String password;
	      private String firstName;
	      private String lastName;
	      public boolean valid;
		
		
	      public String getFirstName() {
	         return firstName;
		}

	      public void setFirstName(String newFirstName) {
	         firstName = newFirstName;
		}

		
	      public String getLastName() {
	         return lastName;
				}

	      public void setLastName(String newLastName) {
	         lastName = newLastName;
				}
				

	      public String getPassword() {
	         return password;
		}

	      public void setPassword(String newPassword) {
	         password = newPassword;
		}
		
				
	      public String getUsername() {
	         return username;
				}

	      public void setUserName(String newUsername) {
	         username = newUsername;
				}

					
	      public boolean isValid() {
	         return valid;
		}

	      public void setValid(boolean newValid) {
	         valid = newValid;
		}	
	}
}
