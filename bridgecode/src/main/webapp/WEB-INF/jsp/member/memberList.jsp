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
사용자 목록.
<table border="1">
<tr> 
<td>아이디</td>
<td>닉네임</td>
<td>국적</td>
 </tr>

<c:forEach items="${list}" var="user" >
<tr>
<td>${user.MEMBER_ID} </td>
<td>${user.MEMBER_NICKNAME} </td>
<td>${user.MEMBER_COUNTRY} </td>

</tr>
</c:forEach>
</table>

<a href="userInsert.do">가입하기</a>
</body>
</html>