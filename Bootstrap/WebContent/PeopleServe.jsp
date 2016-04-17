<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
/*
Reference: http://avexdesigns.com/responsive-youtube-embed/
*/

.vid {
    position: relative;
    padding-bottom: 56.25%;
    padding-top: 30px; height: 0; overflow: hidden;
}
 
.vid iframe,
.vid object,
.vid embed {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Start Up</title>
</head>
<body>
<!-- Reference: http://avexdesigns.com/responsive-youtube-embed/ -->


<%@ include file="Header.jsp"%>
<%@ include file="Ajaxapi.jsp" %>
<div class="container">
    <div class="row">

        
        <div class="col-md-8">
            <div class="vid">
                <iframe width="560" height="315" src="//www.youtube.com/embed/G9MqeRl-GfI"  allowfullscreen=""></iframe>
            </div><!--./vid -->
            
        </div><!--.col -->
        
    </div><!--./row -->
    
</div><!--./container -->

<%@ include file="Footer.jsp" %>
</body>
</html>