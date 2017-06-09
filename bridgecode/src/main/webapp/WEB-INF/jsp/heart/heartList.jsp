<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
<td>heart_id</td>
<td>heart_status</td>
<td>heart_time</td>
<td>to_id</td>
</tr>
<c:forEach items="${list}" var="heart" >
<tr>
<td>${heart.HEART_ID} </td>
<td>${heart.HEART_STATUS} </td>
<td>${heart.HEART_FROM_TIME} </td>
<td>${heart.HEART_TO_ID} </td>
</tr>
</c:forEach>
</table>
</body>
</html>