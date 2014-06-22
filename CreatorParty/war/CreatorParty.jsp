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
    <link type="text/css" rel="stylesheet" href="/stylesheets/sort.css" />
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
      <div id="select">
        <select name="priority">
          <option value="">priority</option>
          <option value="living">거주 지역</option>
          <option value="learning">학적 동일</option>
          <option value="job">직업</option>
        </select>
        <br>
        <select name="sub_priority_1">
          <option value="">first Prior</option>
          <option value="Programmer">Programmer</option>
          <option value="Artist">Artist</option>
          <option value="Producer">Producer</option>
        </select>
        <select name="sub_priority_2">
          <option value="">Second Prior</option>
          <option value="Programmer">Programmer</option>
          <option value="Artist">Artist</option>
          <option value="Producer">Producer</option>
        </select>
      </div>

<%
	pageContext.setAttribute("UserList", "User");
	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();
	
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	Key CreatorPartyKey = KeyFactory.createKey("UserList", "User");
	
	String LV = req.getParameter("living");
	String LN = req.getParameter("learning");
	String JB = req.getParameter("job");
	
	Query query = new Query("UserList", CreatorPartyKey);
	
	if(req.getParameter("priority") == LV)
		query.addSort("City", Query.SortDirection.DESCENDING);
	else if(req.getParameter("priority") == LN)
		query.addSort("SchoolName", Query.SortDirection.DESCENDING);
	else if(req.getParameter("priority") == JB)
	{
		if(req.getParameter("priority") == JB)
			query.addSort("Tag", Query.SortDirection.DESCENDING);
		if(req.getParameter("priority") == JB)
			query.addSort("Tag", Query.SortDirection.DESCENDING);
	}
	else
		query.addSort("date", Query.SortDirection.ASCENDING);
	
	List<Entity> Creators = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
	
	if(Creators.isEmpty()){
		%>
		<p>No data in database</p>
		<%
	}
	
	for(Entity creator : Creators){
		pageContext.setAttribute("user_ID",creator.getProperty("ID"));
		
		pageContext.setAttribute("user_City",creator.getProperty("City"));
		pageContext.setAttribute("user_Nation",creator.getProperty("Nation"));
		pageContext.setAttribute("user_SchoolName",creator.getProperty("SchoolName"));
		pageContext.setAttribute("user_SchoolLv",creator.getProperty("SchoolLevel"));
		
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
			${fn:escapeXml(user_City)}, {fn:escapeXml(user_Nation)}
			<br>
			${fn:escapeXml(user_SchoolName)} {fn:escapeXml(user_SchoolLv)}
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