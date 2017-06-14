<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/img/apple-icon.png">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	
<!--     Fonts and icons     -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Files -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link href="${pageContext.request.contextPath}/resources/css/material-kit.css" rel="stylesheet"/>
    
    <link href="${pageContext.request.contextPath}/resources/css/demo.css" rel="stylesheet" />
<!--   Core JS Files   -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>


	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="${pageContext.request.contextPath}/resources/js/nouislider.min.js" type="text/javascript"></script>

	<!--  Plugin for the Datepicker, full documentation here: http://www.eyecon.ro/bootstrap-datepicker/ -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js" type="text/javascript"></script>


</head>
<body>

<!-- 메뉴 -->
		<div>
		  <tiles:insertAttribute name="menu"/>
		</div>
<!-- 본문 -->
<div class="wrapper">
	<div class="header header-filter" style="background-image: url('${pageContext.request.contextPath}/resources/img/bg2.jpeg');">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="brand"> 
						<h1><spring:message code="test.test" /></h1> 
						<h3>A Badass Bootstrap UI Kit based on Material Design.</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<tiles:insertAttribute name="content"/>
			</div>
		</div>	
	</div>
	<!-- 푸터 -->
</div>
	<footer>
			<tiles:insertAttribute name="footer"/>
	</footer>
	
	<script src="${pageContext.request.contextPath}/resources/js/material.min.js"></script>
	<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
	<script src="${pageContext.request.contextPath}/resources/js/material-kit.js" type="text/javascript"></script>
</body>



</html>