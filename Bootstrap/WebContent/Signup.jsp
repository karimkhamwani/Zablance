<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap.css" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<div style="background-color: lightblue;">
		<form style="width: 300px; margin: 0 auto;" id="Signup" action="SignUpServlet" method="post">
			<div class="form-group">
				<label class="control-label" for="inputDefault">First name *
				</label> <input type="text" class="form-control" id="firstName"
					name="firstName" style="width: 250px;">
			</div>
			<div class="form-group">
				<label class="control-label" for="inputDefault">Last name *</label>
				<input type="text" class="form-control" id="lastName"
					name="lastName" style="width: 250px;">
			</div>
			<div class="form-group">
				<label class="control-label" for="inputDefault">Email
					(optional)</label> <input type="text" class="form-control" id="email"
					name="email" style="width: 250px;">
			</div>
			<div class="form-group">
				<label class="control-label" for="inputDefault">Contact
					number (optional) </label> <input type="text" class="form-control"
					id="contactNumber" name="contactNumber" style="width: 250px;">
			</div>
			<div class="form-group">
				<label class="control-label" for="inputDefault">Enter
					Password *</label> <input type="password" id="password" name="password"
					class="form-control" id="inputDefault" style="width: 250px;">
				<div class="form-group">
					<label class="control-label" for="inputDefault">Re Enter
						Password *</label> <input type="password" id="reEnterPassword"
						name="reEnterPassword" class="form-control" id="inputDefault"
						style="width: 250px;">

				</div>

				<br />
				<div class="form-group">

					<div class="input-group">

						<span class="input-group-btn">
							<button class="btn btn-default"
								style="width: 250px; background-color: lightgreen;"
								button" onclick="check()">Sign up</button>
						</span>
					</div>
				</div>
			</div>
		</form>

	</div>
	<%@ include file="Footer.jsp"%>
	<%@ include file="JQuery.jsp" %>
	<script>
	$(document).ready(function() {
		$('#Signup').validate({
		
			rules : {
				firstName : {
				
					required : true,
								
				
				},
				lastName : {
					required : true,
				},
				email :{
					email :true,
					
				},
				password:{
					required :true
				},
				
				reEnterPassword :{
					required :true,
					equalTo :'#password'
				}
			},

		});
	});
	</script>
	
</body>
</html>