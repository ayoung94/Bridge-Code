<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td {
	margin:0px;
	padding:0px;
}

.thumbnail img{
	padding: 10px;
	widht:300px;
	height:250px;
}

.myPageMenu {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	margin-bottom: 20px;
}

.myPageMenu li {
	float: left;
}

.myPageMenu li a {
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	border-bottom: 5px #DCDCDC solid;
}

.myPageMenu li:last-child {
	width: 780px;
	border-bottom: 5px #DCDCDC solid;
	margin-top: 48px;
}

.changeBG:hover {
	background-color: #DCDCDC;
	color: white;
}

.active {
	cursor: default;
}
</style>
</head>
<body>
	<div class="wrapper">
		<ul class="myPageMenu">
			<li><a class="activeMenu"
				href="${pageContext.request.contextPath}/matching/memberMatchingList.do"
				class="changeBG">회원
					찾기</a></li>
			<li><a
				href="${pageContext.request.contextPath}/matching/searchGenderList.do?member_sex=${login.member_sex}"
				class="changeBG">이성회원 보기</a></li>
			<li><a
				href="${pageContext.request.contextPath}/matching/allmemberList.do"
				class="active" style="border-bottom: 5px #8B008B solid; font:bold;color:#8B008B;">전체회원 보기</a></li>
			<li></li>
		</ul>
		<table>
			<tr>
				<%	int j = 0;	%>
				<c:forEach var="memberlist" items="${list}">
					<td class="col-md-4"><a class="thumbnail" href="${pageContext.request.contextPath}/matching/memberSelect.do?id=${memberlist.member_id}">
							<img src="${pageContext.request.contextPath}/profile_img/${memberlist.member_profile_img}" class="thumb-image">
							<p>${memberlist.member_nickname}</p>
							<p>${memberlist.member_birth}세</p>
							<c:if test="${memberlist.member_sex == '1' }"><p>남성</p></c:if>
							<c:if test="${memberlist.member_sex == '2' }"><p>여성</p></c:if>
 							</a>
					</td>
						<%	j++;
							if (j % 3 == 0 ) {
							out.print("</tr><tr>");
								}
						%>
				</c:forEach>
			<tr>
		</table>
	</div>
</body>
</html>