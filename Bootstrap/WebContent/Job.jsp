<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.javatpoint.ConnectDB" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post A Project Now</title>
</head>
<body>
<%@ include file="ProfileHeader.jsp" %>

<div style="background-color:lightblue;">
	<form  method="post" action="JobServlet" id="Postajob">
		<div class="page-header">
			<h2>
				<b> 1)What type of work do you want to hire?</b>
			</h2>
		</div>
		
		<!-- dropdown -->
		<div class="form-group">
<!-- 			<label for="select" class="col-lg-2 control-label">Selects</label> -->
			<div class="col-lg-10">
				<select class="form-control" id="categoryName" name="categoryName" style="width: 250px;" onchange="GetSubCategories(this.value)">
					<%
					Connection con = ConnectDB.getConnection();
					String query = "Select * from ProjectCategories";
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery(query);
					%><option>Select a Category:</option>
					
					<%
					while(rs.next()){		
					%>
					
					<option><%= rs.getString(2) %></option>
					<%} %>
					
				</select>
				</div>
						<br>
				<br>
			<div id="subCategory"></div>
			<br>
			<div class="page-header">
				<h2>
					<b>2) What is your project about? </b>Project name
				</h2>

			</div>
			<input type="text" class="form-control" id="projectName" name="projectName"
				placeholder="Project name" style="width: 250px;">

		</div>
		
		<div class="page-header">
			<h2>
				<b> 3)Tell us more About Project</b>
			</h2>
		</div>
		<textarea class="form-control" rows="3" id="ProjectDescription"  name="ProjectDescription" placeholder="Project Description" style="width: 550px;"></textarea>
			<div class="page-header">
			<h2>
				<b> 4)What budget do you have in mind?</b> in USD
			</h2>
		</div>
			<input type="text" class="form-control" id="projectBudget" name="projectBudget"
				placeholder="Project Budget" style="width: 250px;">
				<br><br>
	<span class="input-group-btn">
				<button class="btn btn-default"
					style="width: 250px; background-color: lightgreen;"
					button">Post Project now</button>
			</span>
				
	
		</form>
		</div>
<%@ include file="Footer.jsp"%>
<%@ include file="JQuery.jsp" %>
<script>
$(document).ready(function() {
	$('#Postajob').validate({
		rules : {
			categoryName : {
				required : true,
			
			},
			projectName : {
				required : true,
				
			},
			ProjectDescription : {
				required : true,
				
			},
			projectBudget : {
				required : true,
				
			},

		},

	});
});
function GetSubCategories(selectedvalue){
	var newRequest;
	if(selectedvalue==""){
		document.getElementById("subCategory").innerHTML="";
		return;
		
	}
	newRequest = new XMLHttpRequest();
	newRequest.onreadystatechange = function(){
		if(newRequest.readyState==4 && newRequest.status==200){
			
			document.getElementById("subCategory").innerHTML= newRequest.responseText;
			
		}
// 		if(newRequest.responseText =="null"){
// 			$document.ready(function(){
// 				$("#subCategory").hide();
				
// 			});
					
// 		}
		
		
	}
	newRequest.open("GET","getSubcategoryajax.jsp?selectedvalue="+selectedvalue,true);
	newRequest.send();
	
	
}


</script>
</body>
</html>