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
    <link type="text/css" rel="stylesheet" href="/stylesheets/signup.css" />
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
		<form role="form" action="/CreatorParty" method="post">
		  <div class="form-group">
		    <label for="exampleInputID">ID : </label>
		    <input type="text" class="form-control" name="exampleInputID" placeholder="ID">
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputPassword">Password : </label>
		    <input type="password" class="form-control" name="exampleInputPassword" placeholder="Password">
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputEmail">Email : </label>
		    <input type="text" class="form-control" name="exampleInputEmail" placeholder="Email">
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputPhone">PhoneNumber : </label>
		    <input type="text" class="form-control" name="exampleInputPhone" placeholder="Phone">
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputadd">address : </label>
		    <select name="selectNation">
            <option value="">Nation</option>
            <option value="Korea">Korea</option>
            <option value="USA">USA</option>
            </select>
            <select name="selectCity">
            <option value="">City</option>
            <option value="Seoul">Seoul</option>
            <option value="Sungnam">Sungnam</option>
            <option value="Incheon">Incheon</option>
            <option value="Suwon">Suwon</option>
            <option value="Daejeon">Daejeon</option>
            <option value="Daegu">Daegu</option>
            <option value="Ulsan">Ulsan</option>
            <option value="Changwon">Changwon</option>
            <option value="Busan">Busan</option>
            <option value="Gwangju">Gwangju</option>
            </select>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputSchool">School : </label>
		    <select name="selectSchoolLevel">
            <option value="">school level</option>
            <option value="Univ">Univ</option>
            <option value="High">High</option>
            <option value="none">none</option>
            </select>
            <select name="selectSchoolName">
            <option value="">School name</option>
            <option value="kookmin">Kookmin</option>
            <option value="temp1">temp1</option>
            <option value="temp2">temp2</option>
            </select>
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputID">Job Tag : </label>
		    <input type="checkbox" class="form-control" name="exampleInputjob" value="Programmer"> Programmer
		    <input type="checkbox" class="form-control" name="exampleInputjob" value="Artist"> Artist
		    <input type="checkbox" class="form-control" name="exampleInputjob" value="Producer"> Producer
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputID">interested in</label>
		    <input type="text" class="form-control" name="exampleInputInterest" placeholder="interest">
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputID">introduce</label>
		    <input type="text" class="form-control" name="exampleInputIntro" placeholder="who are you?">
		  </div>
		  
		  <div>
		  <input type="submit" value="submit" />
		  </div>
		</form>
	</div>
	
</body>
</html>