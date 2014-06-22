<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="creatorparty.CreatorParty" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/team.css" />
  </head>
  <title>CreatorsParty</title>

<body>

    <div id="header"> 
      <a href="MyInfo.jsp">
      	<div id="myInfo"></div>
      </a>
      
      <a href="Login.jsp">
      	<div id="login"></div>
      </a>
      
      <div id="title"></div>
    </div>
   
    <div id="Sorting">
    <a href="CreatorParty.jsp">
        <div id="SortingBT"></div>
    </a>
    </div>
        
    <div id="TeamList">
    <a href="CreatorPartyTeam.jsp">
    	<div id="TeamListBT"></div>
    </a>
    </div>

    <div id="mainBox">

<%
	pageContext.setAttribute("UserList", "User");
	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();
	
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	Key CreatorPartyKey = KeyFactory.createKey("UserList", "User");
	
	Query query = new Query("UserList", CreatorPartyKey).addSort("date", Query.SortDirection.DESCENDING);
	List<Entity> Creators = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));

	if(Creators.isEmpty()){
		%>
		<p>No data in database</p>
		<%
	}
	
	for(Entity creator : Creators){
		pageContext.setAttribute("user_ID",creator.getProperty("ID"));
		
		if(creator.getProperty("Tag1") != null)
			pageContext.setAttribute("user_Job1",creator.getProperty("Tag1"));
		if(creator.getProperty("Tag2") != null)
			pageContext.setAttribute("user_Job2",creator.getProperty("Tag2"));
		if(creator.getProperty("Tag3") != null)
			pageContext.setAttribute("user_Job3",creator.getProperty("Tag3"));
		%>
		<div id="user">
			<div id="userInfo">
			${fn:escapeXml(user_ID)}
        	<br>
        		${fn:escapeXml(user_Job1)}
        		${fn:escapeXml(user_Job2)}
        		${fn:escapeXml(user_Job3)}
        	</div>
        </div>
		<%
	}
%>
	</div>
</body>
</html>