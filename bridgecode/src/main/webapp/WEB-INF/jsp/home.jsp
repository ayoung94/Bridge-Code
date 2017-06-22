<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
<style>
.div {border:1px solid green;}


</style>
</head>
<body>
	<h1>월간 베스트 인기회원</h1>



	<div class="w3-row">
		<div class="w3-col m2 w3-green w3-center">
			<p>TOP1</p>
		</div>
		<div class="w3-col m2 w3-red w3-center">
			<p>TOP2</p>
		</div>
		<div class="w3-col m2 w3-blue w3-center">
			<p>TOP3</p>
		</div>
		<div class="w3-col m2 w3-dark-grey w3-center">
			<p>TOP4</p>
		</div>
		<div class="w3-col m2 w3-black w3-center">
			<p>TOP5</p>
		</div>
		<div class="w3-col m2 w3-purple w3-center">
			<p>TOP6</p>
		</div>
	</div>
	<div class="w3-row div">
	<c:forEach items="${list}" var="best" end="5">
		<div class="w3-col m2 w3-center">
			<p>${best.member_profile_img}</p>
			<p>${best.member_id}</p>
			<p>하트${best.heart_count}개</p>
		</div>
		
	</c:forEach>
	</div>
</body>
</html>
