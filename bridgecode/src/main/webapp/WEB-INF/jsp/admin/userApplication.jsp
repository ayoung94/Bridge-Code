<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새로운 회원 신청 리스트</title>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js">
	
</script>
<script>
	$(function() {
		$("#userListTable").DataTable({
			"columns" : [ {
				"data" : "memberId"
			}, {
				"data" : "memberNickname"
			}, {
				"data" : "memberBirth"
			}, {
				"data" : "memberSex"
			}, {
				"data" : "memberCountry"
			} ]
		});
	})
</script>
</head>
<body>
	<h1>새로운 회원 신청 리스트</h1>
	<table id="userListTable">
		<thead>
			<tr>
				<th>NO</th>
				<th>ID</th>
				<th>닉네임</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>국적</th>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList}" var="userList">
				<tr>
					<td></td>
					<td>${userList.memberId}</td>
					<td>${userList.memberNickname}</td>
					<td>${userList.memberBirth}</td>
					<td>${userList.memberSex}</td>
					<td>${userList.memberCountry}</td>
					<td><a href="getNotice.do?memberId=${userList.memberId}"><img
							src="src/main/webapp/WEB-INF/views/images/detailview.png"></a></td>
					<td><img
						src="src/main/webapp/WEB-INF/views/images/approval.png"></td>
					<td><img src="src/main/webapp/WEB-INF/views/images/reject.png"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>