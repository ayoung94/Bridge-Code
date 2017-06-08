<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
베스트 인기회원 
</h1>

<table border="1">
<tr>
<c:forEach items="${list}" var="best" >
<td>
${best.member_id}<br>
하트${best.heart_count}개
</td> 

</c:forEach>
</tr>
</table>

</body>
</html>
