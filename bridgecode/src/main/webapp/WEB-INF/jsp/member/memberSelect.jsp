<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


아이디 : ${member.member_id }<br>
닉네임 : ${member.member_nickname }<br>
국적 : ${member.member_country }<br>
자기 소개 :${member.member_introduction }<br>
생년월일 : ${member.member_birth }<br>

<a href="${pageContext.request.contextPath}/heart/heartInsert.do?id=${member.member_id}">하트 보내기</a>


</body>
</html>