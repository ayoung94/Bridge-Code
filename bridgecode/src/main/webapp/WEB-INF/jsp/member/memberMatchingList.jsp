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
회원 매칭
<br>


<table border="1">
		<tr>
			<%int i = 0;%>
			<c:forEach items="${list}" var="user" >
				<td>
				<div>
				<a href="${pageContext.request.contextPath}/member/memberSelect.do?id=${user.MEMBER_ID}">
				${user.MEMBER_ID}
				</a><br>
				${user.MEMBER_NICKNAME} <br>
				</div>
				</td>
				<!-- 1줄에 4명씩 출력하기 위한 처리. -->
				<%i++;if (i % 4 == 0){out.print("</tr><tr>");}%>
			</c:forEach>
		</tr>

	</table>



</body>
</html>