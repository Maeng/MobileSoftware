package creatorparty;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class SignCreatorPartyServlet extends HttpServlet{
	@Override
	 public void doPost(HttpServletRequest req, HttpServletResponse resp)
             throws IOException {
	 DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
     Key CreatorPartyKey = KeyFactory.createKey("UserList", "User");

     String ID = req.getParameter("exampleInputID");
     String Password = req.getParameter("exampleInputPassword");
     String Email = req.getParameter("exampleInputEmail");
     String Phone = req.getParameter("exampleInputPhone");
     String Nation = req.getParameter("selectNation");
     String City = req.getParameter("selectCity");
     String SLv = req.getParameter("selectSchoolLevel");
     String SName = req.getParameter("selectSchoolName");
     String[] job = req.getParameterValues("exampleInputjob");
     String inter = req.getParameter("exampleInputInterest");
     String intro = req.getParameter("exampleInputIntro");
     
     Date date = new Date();
     
     Entity user = new Entity("UserList", CreatorPartyKey);
     user.setProperty("date", date);
	user.setProperty("ID", ID);
	user.setProperty("Password", Password);

	user.setProperty("Email", Email);
	user.setProperty("Phone", Phone);
	
	//living at
	user.setProperty("Nation", Nation);
	user.setProperty("City", City);
	
	//learning at
	user.setProperty("SchoolName", SName);
	user.setProperty("SchoolLevel", SLv);
	
	//Work as
	if(job.length == 0){
		user.setProperty("Tag1", null);
		user.setProperty("Tag2", null);
		user.setProperty("Tag3", null);}
	else if(job.length == 1){
		user.setProperty("Tag1", job[0]);
		user.setProperty("Tag2", null);
		user.setProperty("Tag3", null);
	}
	else if(job.length == 2){
		user.setProperty("Tag1", job[0]);
		user.setProperty("Tag2", job[1]);
		user.setProperty("Tag3", null);
	}
	else if(job.length == 3){
		user.setProperty("Tag1", job[0]);
		user.setProperty("Tag2", job[1]);
		user.setProperty("Tag3", job[2]);
	}
	//Interested in
	user.setProperty("Interest", inter);
	
	user.setProperty("Introduce", intro);
	
	datastore.put(user);    
 
	//Query query = new Query("UserList", CreatorPartyKey);
	//Creators = datastore.prepare(query).asList(FetchOptions.Builder.withDefaults());
	
	resp.sendRedirect("/Login.jsp");
 }
	
	
//	public List<Entity> getCreatorsList(){ return Creators; }
}
