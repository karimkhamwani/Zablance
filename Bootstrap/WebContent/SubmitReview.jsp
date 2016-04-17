<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<jsp:useBean id="SubmitReview" scope="page" class="com.javatpoint.SubmitReview"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link href="bootstrap.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Submit Review</title>
</head>
<body>
	<%@ include file="ProfileHeader.jsp"%>

	<div style="background-color: lightblue;">
	<form method="post" action="SubmitReviewServlet" id="SubmitReview">
		<div class="page-header">
			<h2>
				<b>1) Bit the project </b> * i.e 40 USD
			</h2>

		</div>
		<input type="text" class="form-control" id="bit" name="bit"
			placeholder="Enter maximum bit" style="width: 250px;">

		<div class="page-header">
			<h2>
				<b>2) Cover letter </b> *
			</h2>
			</div>
			<textarea class="form-control" rows="3" id="coverletter" name="coverletter"
				placeholder="Cover letter" style="width: 550px;"></textarea>
	
						
				<br> <br> 
				<button class="btn btn-default"
					style="width: 250px; background-color: lightgreen;"
					button">Submit Now</button>
					<input type="hidden" name="pid" id="pid" value="<%=request.getParameter("projectid") %>">
					<%
					  int id = (int)session.getAttribute("LoginId");
					%>
					<input type="text" name="loginid" value="<%=id %>" hidden>
					</form>
			</div>


			<%@ include file="Footer.jsp"%>
			
		
		<%@ include file="JQuery.jsp" %>
<script>
$(document).ready(function() {
	$('#SubmitReview').validate({
		rules : {
			bit : {
				minlength : 1,
				required : true
			
			},
			coverletter : {
				minlength : 5,
				required : true,
				
			}
			

		},

	});
});

</script>				
		
</body>
</html>