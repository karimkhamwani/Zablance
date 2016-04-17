<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.javatpoint.ConnectDB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="JQuery.jsp" %>
<form id="subcategoryForm" action="JobServlet">
	<%
Connection con = ConnectDB.getConnection();

String query ="select SubCategories.SubCategoryname from SubCategories inner join ProjectCategories on CategoryId=fk_CategortId where CategoryName='"+ request.getParameter("selectedvalue")+"'" ;   
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);%>
	<div class="col-lg-10">
		<select class="form-control" name="subCategories" style="width: 250px;">
		<%while(rs.next()){ %>
				<option><%= rs.getString(1) %></option>
				<%}%>
		</select>
	</div>

</form>
<script>
$(function() {
	  $("#subcategoryForm").submit(); // using ID
	});

</script>
</body>
</html>