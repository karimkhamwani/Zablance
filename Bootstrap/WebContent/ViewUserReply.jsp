<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Details</title>
</head>
<body>
<%@ include file="ProfileHeader.jsp"%>
<br>
<br>

    <div class="form-group">
      <label for="comment">Cover Letter :</label><span class="glyphicon glyphicon-envelope"></span>
      <textarea class="form-control" rows="3" id="comment" disabled><%=request.getParameter("Coverletter")%></textarea>
      <br>
       
     <p id="demo" hidden>   
        <label for="comment">Contact Details :</label><span class="glyphicon glyphicon-arrow-down"></span>
        <input type="text" class="form-control" value="<%=request.getParameter("CD") %>"disabled style="width: 250px;">
		<br> </p>
		

	<button id="bt1" class="btn btn-default btn-lg btn-block" style="width: 350px; background-color:lightgreen;" align="center">Click here to show Contact Details</button>
		
    </div>
			
 
<%@ include file="Footer.jsp" %>
<script>
$(document).ready(function (){
	$("#bt1").click(function(){
		$("#demo").show("slow");

	});
	});

</script>

</body>
</html>