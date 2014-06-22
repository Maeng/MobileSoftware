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
    <link type="text/css" rel="stylesheet" href="/stylesheets/login.css" />
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
    <br><br>
		<form role="form" action="SignInOutCreatorPartyServlet">
		  <div class="form-group">
		    <label for="exampleSignInID">Enter ID</label>
		    <input type="text" class="form-control" name="exampleSignInID" placeholder="ID">
		  </div>
		  <div class="form-group">
		    <label for="exampleSignInPassword">Password</label>
		    <input type="password" class="form-control" name="exampleSignInPassword" placeholder="Password">
		  </div>
		  
		  <a href="MyInfo.jsp">
		  <input type="submit" value="sign in">
		  </a>
		  
		  <a href="SignUp.jsp">
		  <input type="submit" value="sign up">
		  </a>
		</form>
	</div>
</body>
</html>