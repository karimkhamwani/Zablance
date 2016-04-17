<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.javatpoint.ConnectDB"
	session="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Notification</title>
</head>
<body>
	<%@ include file="JQuery.jsp"%>

	<%@ include file="ProfileHeader.jsp"%>
	<br>
	<%
		Connection con = ConnectDB.getConnection();
		String query = "select distinct login.Contact,RequestPending.CoverLetter,login.Firstname,RequestPending.fk_ProjectId,Projects.ProjectName from RequestPending inner join Projects on RequestPending.fk_ProjectId = Projects.ProjectId inner join login on RequestPending.fk_LoginId = login.LoginId where RequestPending.fk_LoginId!=? and Projects.fk_LoginId=?";
		int id = (int) session.getAttribute("LoginId");
		PreparedStatement st = con.prepareStatement(query);
		//out.print("id"+id);
		st.setInt(1, id);
		st.setInt(2, id);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			long ContactDetails = rs.getInt(1);
			String UserCoverLetter = rs.getString(2);
			
	%>
	<div class="alert alert-info">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong><emp> <B><%=rs.getString(3)%> <b>Applied
					for your this <b><%=rs.getString(5)%></b> project <a
					href="ViewUserReply.jsp?Coverletter=<%=UserCoverLetter%>&CD=<%=ContactDetails%>"
					style="color: darkgreen">Click here to see reply</emp></a></strong> -->
	</div>
	<%
		}
	%>

	<%@ include file="Footer.jsp"%>

</body>
</html>