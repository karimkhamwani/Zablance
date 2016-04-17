<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.javatpoint.ConnectDB"%>
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
<%
String projectname = request.getParameter("pN");
String pd = request.getParameter("pD");
String pb = request.getParameter("pB");
String pid =  request.getParameter("pid");
int projectid = Integer.parseInt(pid);
int projectbudget = Integer.parseInt(pb);
Connection con = ConnectDB.getConnection();
String query= "update Projects set ProjectName=? , ProjectBudget =? ,ProjectDescription=? where ProjectId=?";
PreparedStatement stm = con.prepareStatement(query);
stm.setString(1, projectname);
stm.setInt(2, projectbudget);
stm.setString(3, pd);
stm.setInt(4, projectid);
stm.executeUpdate();
stm.close();
%>


</body>
</html>