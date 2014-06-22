package creatorparty;


import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class SortCreatorPartyServlet extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
		

		 DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	     Key CreatorPartyKey = KeyFactory.createKey("UserList", "User");

	     //List<Entity> 
	}
	
}
