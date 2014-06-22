<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="creatorparty.CreatorParty" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/myinfo.css" />
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

<%

Entity user = new Entity("UserInfo");
user.setProperty("ID", "test3");
user.setProperty("Password", "987654");

user.setProperty("Email", "test3@naver.com");
user.setProperty("Phone", "0103334444");

//living at
user.setProperty("Nation", "Korea");
user.setProperty("City", "Ilsan");

//learning at
user.setProperty("SchoolName", "kookmin");
user.setProperty("SchoolLevel", "University");

//Work as
user.setProperty("Tag", "Producer");
//Interested in
user.setProperty("Interest", "game");

user.setProperty("Introduce", "none");

pageContext.setAttribute("user_ID",user.getProperty("ID")); 
pageContext.setAttribute("user_City",user.getProperty("City")); 
pageContext.setAttribute("user_Email",user.getProperty("Email")); 
pageContext.setAttribute("user_Interest",user.getProperty("interest")); 
pageContext.setAttribute("user_Nation",user.getProperty("Nation")); 
pageContext.setAttribute("user_Phone",user.getProperty("Phone")); 
pageContext.setAttribute("user_SchoolLevel",user.getProperty("SchoolLevel")); 
pageContext.setAttribute("user_SchoolName",user.getProperty("SchoolName")); 
pageContext.setAttribute("user_JobTag",user.getProperty("Tag")); 
%>
    <div id="mainBox">
    	<img src="stylesheets/Sorting.png"><br>
    	 ID : 
			${fn:escapeXml(user_ID)}<br>
    	 Email: 
			${fn:escapeXml(user_Email)}<br>
    	 Phone: 
			${fn:escapeXml(user_Phone)}<br>
    	 Living at: 
			${fn:escapeXml(user_City)},
			${fn:escapeXml(user_Nation)}<br>
    	 Learning at: 
			${fn:escapeXml(user_SchoolName)}, 
			${fn:escapeXml(user_SchoolLevel)}<br>
    	 Job Tag: 
			${fn:escapeXml(user_JobTag)}<br>
	</div>
</body>
</html>