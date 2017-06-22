<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
<style>
.font {
	font-size: 1.35em;
}

.gold-text {
	color: #FFD700
}

.silver-text {
	color: #C0C0C0
}

.size {
	width: 268px;
	height: 240px;
}

.size2 {
	width: 50px;
	height: 50px;
}
</style>
</head>
<body>
	<h1>월간 베스트 인기회원</h1>
	<div class="w3-row">
		<div class="w3-col m3 w3-center">
			<p><p class="gold-text">
		


				<b>TOP1</b>
			</p></div>
		<div class="w3-col m3 w3-center">
			<p>
			<p class="silver-text">
				<b>TOP2</b>
			</p>
		</div>
		<div class="w3-col m3 w3-center">
			<p>
			<p>TOP3</p>
		</div>
		<div class="w3-col m3 w3-center">
			<p>
			<p>TOP4</p>
		</div>
	</div>
	<div class="w3-row">
		<c:forEach items="${list}" var="best" end="3">
			<div class="w3-col m3 w3-center">
				<img
					src="${pageContext.request.contextPath}/profile_img/${best.member_profile_img}"
					class="size">
				<p>
				<p class="font"><b>${best.member_id}</b></p>
				<p>
					<img
						src="${pageContext.request.contextPath}/resources/img/red-scribble-heart.jpg" 
						class="size2">X${best.heart_count}
				</p>
			</div>
		</c:forEach>
	</div>
</body>
</html>
