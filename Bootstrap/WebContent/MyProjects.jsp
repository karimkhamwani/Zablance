<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.javatpoint.ConnectDB"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Projects</title>
</head>
<body>
	<%@ include file="JQuery.jsp"%>


	<%@ include file="ProfileHeader.jsp"%>


	<!-- table -->
	<table class="table table-striped table-hover ">
		<thead>
			<tr>
				<th>#</th>
				<th>Project ID</th>

				<th>Project Name</th>

				<th>Project Reviews</th>

			</tr>
		</thead>
		<%
  Connection con = ConnectDB.getConnection();
  String query ="select Projects.ProjectId , Projects.ProjectName, Projects.ProjectReviews from Projects where Projects.fk_LoginId =?";
  PreparedStatement stm = con.prepareStatement(query);
  int id = (int)session.getAttribute("LoginId");
  stm.setInt(1, id);
ResultSet rs = stm.executeQuery();
int i=1; 
//String ProjectReviews =""
while(rs.next()){
	  int pid =rs.getInt(1);
	  Connection secondcon = ConnectDB.getConnection();
	  String ProjectReviews = "select COUNT(*) as count1 from Projects inner join RequestPending on Projects.ProjectId = RequestPending.fk_ProjectId where RequestPending.fk_ProjectId=?";
	  PreparedStatement Reviews = secondcon.prepareStatement(ProjectReviews);
	  Reviews.setInt(1, pid);
	  ResultSet run = Reviews.executeQuery();
	  %>

		<tbody>
			<tr class="success">
				<%
   
    %><td><b><%=i++ %></b></td>

				<td><%=pid %></td>
				<td><%= rs.getString(2) %></td>
				<%while(run.next()){ %>
				<td><%= run.getInt(1) %></td>
				<%} %>

				<td>Column content &nbsp;&nbsp; <a
					href="ViewProjectDetails.jsp?ProjectId=<%=pid%>"
					class="btn btn-primary btn-sm">View details</a></td>

			</tr>
			<%
  } %>

		</tbody>
	</table>
	<%@ include file="Footer.jsp"%>

</body>
</html>