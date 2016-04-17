<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

	<%@ include file="Header.jsp"%>

	<!-- login form -->
	<div style="background-color: lightblue;">
		<form style="width: 300px; margin: 0 auto;" id="Signinform" method="post" action="LoginServlet">

<div class="form-group">
			<label class="control-label" for="inputDefault">First name *</label> <input
				type="text" class="form-control" id="firstName" name="firstName"
				style="width: 250px;" placeholder="Username">
				</div>
			<div class="form-group">
				<label class="control-label" for="inputDefault">Password * </label> <input
					type="password" class="form-control" id="password" name="password"
					style="width: 250px;" placeholder="Password">
			</div>
		<label class="control-label" for="inputDefault">Don't have Zablance account? <a href="Signup.jsp">Create now</a></label>
		<br><br>
			<span class="input-group-btn">
				<button class="btn btn-default"
					style="width: 250px; background-color: lightgreen;"
					button">Log in</button>
			</span>
			
			
		</form>
	</div>
	<%@ include file="Footer.jsp"%>
	
<%@ include file="JQuery.jsp" %>
<script>

	$(document).ready(function() {
		$('#Signinform').validate({
			rules : {
				firstName : {
					minlength : 2,
					required : true
				
				},
				password : {
					required : true,
					
				}
				

			},

		});
	});
</script>
</body>
</html>