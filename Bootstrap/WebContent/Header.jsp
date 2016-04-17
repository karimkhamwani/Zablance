<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link href="bootstrap.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="Ajaxapi.jsp"%>
<!-- --- header -->
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
        <li class="active"><a href="PeopleServe.jsp">Start Up<span class="sr-only"></span></a></li>
        <li><a href="FAQ.jsp">About us</a></li>
         </ul>
      <form class="navbar-form navbar-left" role="search">
            
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="Login.jsp">Log in</a></li>
        <li><a href="Signup.jsp">Sign up</a></li>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>