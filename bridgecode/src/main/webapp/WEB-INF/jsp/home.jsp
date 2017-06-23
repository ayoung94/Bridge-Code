<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
<style>
.headfont {@import
	url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);font-family: 
	'Nanum Pen Script ', serif ;
text-align:center ;

	
}

.font {
	font-size: 1.35em;
}

.gold-text {
	color: #FFD700
}

.silver-text {
	color: #C0C0C0
}

.copper-text {
	color: #b87333
}

.size {
	width: 269px;
	height: 248px;
}

.size2 {
	width: 50px;
	height: 50px;
}

.shadow {
	box-shadow: 5px 5px 5px #888888;
}
</style>
</head>
<body>
	<h3 class="headfont">Month Star</h3>
	<div class="w3-row">
		<div class="w3-col m3 w3-center">
			<p>
			<p class="gold-text">
				<b>TOP1</b>
			</p>
		</div>
		<div class="w3-col m3 w3-center">
			<p>
			<p class="silver-text">
				<b>TOP2</b>
			</p>
		</div>
		<div class="w3-col m3 w3-center">
			<p>
			<p class="copper-text">
				<b>TOP3</b>
			</p>
		</div>
		<div class="w3-col m3 w3-center">
			<p>
			<p>
				<b>TOP4</b>
			</p>
		</div>
	</div>
	<div class="w3-row">
		<c:forEach items="${list}" var="best" end="3">
			<div class="w3-col m3 w3-center">
				<a
					href="${pageContext.request.contextPath}/matching/memberSelect.do?id=${best.member_id}">
					<img
					src="${pageContext.request.contextPath}/profile_img/${best.member_profile_img}"
					class="size">
				</a>
				<p>
				<p class="font">
					<b>${best.member_id}</b>
				</p>
				<p>
					<img
						src="${pageContext.request.contextPath}/resources/img/red-scribble-heart.jpg"
						class="size2"> X <b>${best.heart_count}</b>
				</p>
			</div>
		</c:forEach>
	</div>
	<br />
	<h3 class="headfont">Week Start</h3>
	>
	<div class="w3-row">
		<div class="w3-col m6 w3-center">
			<p>
			<p class="gold-text">
				<b>TOP1</b>
			</p>
		</div>
		<div class="w3-col m6 w3-center">
			<p>
			<p class="gold-text">
				<b>TOP2</b>
			</p>
		</div>
	</div>
	<div class="w3-row">
		<c:forEach items="${list2}" var="best2" end="1">
			<div class="w3-col m6 w3-center">
				<a
					href="${pageContext.request.contextPath}/matching/memberSelect.do?id=${best2.member_id}">
					<img
					src="${pageContext.request.contextPath}/profile_img/${best2.member_profile_img}"
					class="size">
				</a>
				<p>
				<p class="font">
					<b>${best2.member_id}</b>
				</p>
				<p>
					<img
						src="${pageContext.request.contextPath}/resources/img/red-scribble-heart.jpg"
						class="size2"> X <b>${best2.heart_count}</b>
				</p>
			</div>
		</c:forEach>

	</div>
	<br />
	<h3 class="headfont">Best Star</h3>
	<div class="w3-row">
		<div class="w3-col m12 w3-center">
			<p>
			<p class="gold-text">
				<b>TOP1</b>
			</p>
		</div>
	</div>
	<div class="w3-row">
		<c:forEach items="${list3}" var="best3" end="0">
			<div class="w3-col m12 w3-center">
				<a
					href="${pageContext.request.contextPath}/matching/memberSelect.do?id=${best3.member_id}">
					<img
					src="${pageContext.request.contextPath}/profile_img/${best3.member_profile_img}"
					class="size">
				</a>
				<p>
				<p class="font">
					<b>${best3.member_id}</b>
				</p>
				<p>
					<img
						src="${pageContext.request.contextPath}/resources/img/red-scribble-heart.jpg"
						class="size2"> X <b>${best3.heart_count}</b>
				</p>
			</div>
		</c:forEach>
	</div>
</body>
</html>