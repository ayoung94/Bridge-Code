<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
div.container {
	width: 100%;
	border: 1px solid gray;
}

header, footer {
	padding: 1em;
	color: white;
	background-color: black;
	clear: left;
	text-align: center;
}

nav {
	float: left;
	max-width: 160px;
	margin: 0;
	padding: 1em;
}

nav ul {
	list-style-type: none;
	padding: 0;
}

nav ul a {
	text-decoration: none;
}

article {
	margin-left: 170px;
	border-left: 1px solid gray;
	padding: 1em;
	overflow: hidden;
}
</style>
</head>
<body>
	<!-- include_directive.jsp -->
	<div class="container">
		<script>
		
		function goOpen(url,title,w,h){
			var context = '${pageContext.request.contextPath}';
			var option = 'width='+w + ',height=' +h;
			window.open(context+url,title,option);
		}
		
		</script>
		<header>
			
		<%-- 	<c:if test="${empty sessionScope.login}">
				<a href="../login/login_form.tile">로그인</a>
			</c:if>
			<c:if test="${not empty sessionScope.login}">
				${sessionScope.login.id}님 
				<a href="../login/LogoutControl.do">로그아웃</a>
			</c:if> --%>
			
		</header>
		<nav>
			<tiles:insertAttribute name="menu"/>
		</nav>
		<article>
			<tiles:insertAttribute name="content"/>
		</article>
		<footer>
			<tiles:insertAttribute name="footer"/>
		</footer>
	</div>
</body>
</html>