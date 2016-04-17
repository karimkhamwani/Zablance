<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* ,com.javatpoint.SignUp , com.javatpoint.Login" session="true" import="com.javatpoint.ConnectDB"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="Ajaxapi.jsp" %>
 
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="Homepage.jsp">ZABLANCE</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      <ul class="nav navbar-nav">
      <%
      int loginid1 = (int)session.getAttribute("LoginId");
      Connection con2 = ConnectDB.getConnection();
      String query1 ="select COUNT(*) from Projects where Projects.fk_LoginId = ?";
	PreparedStatement stmt = con2.prepareStatement(query1);
	stmt.setInt(1, loginid1);
	ResultSet rs2 = stmt.executeQuery();
      while(rs2.next()){
      
      %>
        <li><a href="MyProjects.jsp">My Projects <span class="badge" style="color:white"><%= rs2.getInt(1) %></span></a></li>
        <%} %>
        <%
        Connection connect = ConnectDB.getConnection();
        String query2 ="select COUNT(*) from Projects where Projects.fk_LoginId != ?";
		PreparedStatement statement = connect.prepareStatement(query2);
		int id3 = (int)session.getAttribute("LoginId");
        statement.setInt(1, id3);
    	ResultSet resultset = statement.executeQuery();
    	while(resultset.next()){
        %>
        
        
        
        <li ><a href="OtherProjects.jsp">Other Projects <span class="badge" style="color:white"><%= resultset.getInt(1) %></span></a></li>
<%} %>


<%
int loginid = (int)session.getAttribute("LoginId");
Connection newcon = ConnectDB.getConnection();
String newquery = "select Count(*) from ( select RequestPending.fk_LoginId as isneapplykiahan,login.Firstname, RequestPending.fk_ProjectId ,Projects.fk_LoginId as iskeidprojectko ,Projects.ProjectName from RequestPending inner join Projects on RequestPending.fk_ProjectId = Projects.ProjectId inner join login on RequestPending.fk_LoginId=login.LoginId where RequestPending.fk_LoginId!=? and Projects.fk_LoginId=? ) z";
//Statement stt = newcon.createStatement();
PreparedStatement stt = newcon.prepareStatement(newquery);
stt.setInt(1, loginid);
stt.setInt(2, loginid);
ResultSet rs1 = stt.executeQuery();
while(rs1.next()){
%>
          <li ><a href="Notification.jsp">Notification <%=rs1.getInt(1) %></span></a></li><%} %>
           <li ><a href="Job.jsp">Post a Project now </a></li>
      </ul>
        <ul class="nav navbar-nav navbar-right">
		<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><b>  <%= (String)session.getAttribute("fn") %> </b><span class="caret"></span></a>
         	<ul class="dropdown-menu" role="menu">
            	<li><a href="#">Account Setting</a></li>
            	<li><a href="Homepage.jsp">Logout</a></li>
            
            	
            </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

</body>
</html>