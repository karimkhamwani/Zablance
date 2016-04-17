<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="com.javatpoint.ConnectDB"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Other Projects</title>
</head>
<body>
<%@ include file="ProfileHeader.jsp" %>
<!-- table -->
<table class="table table-striped table-hover ">
  <thead>
    <tr>
    <th>#</th>
      <th>Project ID</th>
      <th>Project Category</th>
      <th>Project Name</th>
      <th>Project Budget</th>
      
     
    </tr>
  </thead>
  <%
  Connection con = ConnectDB.getConnection();
  String query ="Select Projects.ProjectId,ProjectCategories.CategoryName,Projects.ProjectName,Projects.ProjectBudget from Projects inner join  ProjectCategories on ProjectCategories.CategoryId = Projects.fk_CategortId where Projects.fk_LoginId != ?";
  PreparedStatement stm = con.prepareStatement(query);
  int id = (int)session.getAttribute("LoginId");
  stm.setInt(1, id);
ResultSet rs = stm.executeQuery();
int i=1;
  while(rs.next()){
  %>
  <tbody>
    <tr class="success">
      <td><b><%=i++ %></b></td>
      <% int projectid = rs.getInt(1); %>
       <td><%=projectid %></td>
      <td><%= rs.getString(2) %></td>
      <td><%=rs.getString(3) %></td>
      <td><%= rs.getInt(4) %>&nbsp;&nbsp;&nbsp;<a href="SubmitReview.jsp?projectid=<%=projectid %>" class="btn btn-primary btn-sm">Apply for Project</a></td>
      
    </tr>
<%
}%>
   
    
  </tbody>
</table> 
<%@ include file="Footer.jsp" %>

</body>
</html>