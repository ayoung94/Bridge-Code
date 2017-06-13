<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 리스트 목록</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<script>
	$(function() {
		$("#userListTable").DataTable({
			"columns" : [ {
				"data" : "member_id"
			}, {
				"data" : "member_password"
			}, {
				"data" : "member_nickname"
			}, {
				"data" : "member_name"
			}, {
				"data" : "member_birth"
			}, {
				"data" : "member_last_connection"
			}, {
				"data" : "member_warning"
			}, {
				"data" : "member_sex"
			}, {
				"data" : "member_partner_id"
			}, {
				"data" : "member_country"
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
					<td>${userList.member_id}</td>
					<td>${userList.member_password}</td>
					<td>${userList.member_nickname}</td>
					<td>${userList.member_name}</td>
					<td>${userList.member_birth}</td>
					<td>${userList.member_last_connection}</td>
					<td>${userList.member_warning}</td>
					<td>${userList.member_sex}</td>
					<td>${userList.member_partner_id}</td>
					<td>${userList.member_country}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>