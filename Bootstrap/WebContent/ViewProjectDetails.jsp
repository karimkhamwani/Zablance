<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="ViewDetails" scope="page" class="com.javatpoint.ViewProjectDetailsbean"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Details</title>
</head>
<body>
<p id="UpdateSucessfuly"></p>
	<%@ include file="ProfileHeader.jsp"%>

	<div style="background-color: lightblue;">
		<div class="page-header">
			<h2>
				<b>1) Project ID </b> 
			</h2>

		</div>
		<%ViewDetails.showDetails(Integer.parseInt(request.getParameter("ProjectId"))); %>
		
		
		
		<br>
		<input type="text" class="form-control" id="Projectid" value="<%=request.getParameter("ProjectId") %>"
		disabled style="width: 250px;">
		
		<div class="page-header">
			<h2>
				<b>2) Project Category</b> 
			</h2>

		</div>
		<input type="text" class="form-control" id="ProjectCategory" value=<jsp:getProperty property="projectCategory" name="ViewDetails"/>
		disabled style="width: 250px;">
		
		<div class="page-header">
			<h2>
				<b>3) Project Name </b> 
			</h2>

		</div>
	
		<textarea class="form-control" rows="3" id="ProjectName" style="width: 250px;" name="ProjectName"><jsp:getProperty property="projectName" name="ViewDetails"/></textarea>
		
		<div class="page-header">
			<h2>
				<b>4) Project Description </b> 
			</h2>

		</div>
		<textarea class="form-control" rows="3" id="projectDescription" style="width: 550px;" name="projectDescription"><jsp:getProperty property="projectDescription" name="ViewDetails"/></textarea>
		
		<div class="page-header">
			<h2>
				<b>5) Project Budget</b> 
			</h2>

		</div>
		<input type="text" class="form-control" id="ProjectBudget" name="ProjectBudget" value=<jsp:getProperty property="projectBudget" name="ViewDetails"/>
		style="width: 250px;">
		
		<div class="page-header">
			<h2>
				<b>6) Project Reviews </b> 
			</h2>

		</div>
		<input type="text" class="form-control" id="ProjectReviews" value=<jsp:getProperty property="projectReviews" name="ViewDetails"/>
		disabled style="width: 250px;">
			<br><br>
	
	<button class="btn btn-default btn-lg btn-block" style="width: 250px; background-color:lightgreen;" align="center" onclick="Update()">Update</button>
				
		
	</div>

	<%@ include file="Footer.jsp"%>
<script>
function Update(){
	pName=document.getElementById("ProjectName").value;
	pDescription =document.getElementById("projectDescription").value;
	pBudget =document.getElementById("ProjectBudget").value;
	pid =document.getElementById("Projectid").value;
	var newRequest;
	if(pName==""&&pDescription==""&&pBudget==0){
		document.getElementById("UpdateSucessfuly").innerHTML="";
		return;
		
	}
	newRequest = new XMLHttpRequest();
	newRequest.onreadystatechange = function(){
		if(newRequest.readyState==4 && newRequest.status==200){
			
			document.getElementById("UpdateSucessfuly").innerHTML= newRequest.responseText;
			
			
		}
	
	
	}


	newRequest.open("GET","UpdateProjectDetails.jsp?pN="+pName+"&pD="+pDescription+"&pB="+pBudget+"&pid="+pid,true);
	newRequest.send();
	
	
}


</script>

</body>
</html>