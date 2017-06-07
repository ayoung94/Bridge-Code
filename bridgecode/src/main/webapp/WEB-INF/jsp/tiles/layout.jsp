<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Bridge Code</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
body {
background-color: #bbb;
}
footer {
	padding: 1em;
	color: white;
	background-color: black;
	clear: left;
	text-align: center;
}

</style>
</head>
<body>
<!-- 메뉴 -->
<div class="w3-top">
  <tiles:insertAttribute name="menu"/>
</div>
<!-- 본문 -->
		<article>
		<div class="w3-panel w3-white w3-round-large" style="margin-top: 65px; min-height: 500px;">
			<tiles:insertAttribute name="content"/>
		</div>
		</article>
<!-- 푸터 -->
		<footer>
			<tiles:insertAttribute name="footer"/>
		</footer>

</body>
</html>