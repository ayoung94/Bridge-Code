<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 리스트 목록</title>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js">
	
</script>
<script>
	$(function() {
		$("#userListTable").DataTable({
			"columns" : [ {
				"data" : "memberId"
			}, {
				"data" : "memberPassword"
			}, {
				"data" : "memberNickname"
			}, {
				"data" : "memberName"
			}, {
				"data" : "memberBirth"
			}, {
				"data" : "memberLastConnection"
			}, {
				"data" : "memberWarning"
			}, {
				"data" : "memberSex"
			}, {
				"data" : "memberPartnerId"
			}, {
				"data" : "memberCountry"
			} ]
		});
	})
</script>
</head>
<body>
	<h1>유저 리스트 목록</h1>
	<table id="userListTable">
		<thead>
			<tr>
				<th>ID</th>
				<th>PW</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>생년생일</th>
				<th>마지막 접속일</th>
				<th>경고횟수</th>
				<th>성별</th>
				<th>파트너ID</th>
				<th>국적</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList}" var="userList">
				<tr>
					<td>${userList.memberId}</td>
					<td>${userList.memberPassword}</td>
					<td>${userList.memberNickname}</td>
					<td>${userList.memberName}</td>
					<td>${userList.memberBirth}</td>
					<td>${userList.memberLastConnection}</td>
					<td>${userList.memberWarning}</td>
					<td>${userList.memberSex}</td>
					<td>${userList.memberPartnerId}</td>
					<td>${userList.memberCountry}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>