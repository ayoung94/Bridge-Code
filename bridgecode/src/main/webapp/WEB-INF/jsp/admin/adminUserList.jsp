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
				"data" : "MEMBER_ID"
			}, {
				"data" : "MEMBER_PASSWORD"
			}, {
				"data" : "MEMBER_NICKNAME"
			}, {
				"data" : "MEMBER_NAME"
			}, {
				"data" : "MEMBER_BIRTH"
			}, {
				"data" : "MEMBER_LAST_CONNECTION"
			}, {
				"data" : "MEMBER_WARNING"
			}, {
				"data" : "MEMBER_SEX"
			}, {
				"data" : "MEMBER_PARTNER_ID"
			}, {
				"data" : "MEMBER_COUNTRY"
			} ]
		});
	})
</script>
<style>
    .modal-backdrop {
        z-index: -1;
    }
</style>
</head>
<body>
	<h1>유저 리스트 목록</h1>
	<table id="userListTable" >
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
			<c:forEach items="${userList}" var="user">
				<tr>
					<td><a href="getUserSel.do?member_id=${user.MEMBER_ID}"
						data-toggle="modal" data-target="#userSelModal">${user.MEMBER_ID}</a></td>
					<td>${user.MEMBER_PASSWORD}</td>
					<td>${user.MEMBER_NICKNAME}</td>
					<td>${user.MEMBER_NAME}</td>
					<td>${user.MEMBER_BIRTH}</td>
					<td>${user.MEMBER_LAST_CONNECTION}</td>
					<td>${user.MEMBER_WARNING}</td>
					<td>${user.MEMBER_SEX}</td>
					<td>${user.MEMBER_PARTNER_ID}</td>
					<td>${user.MEMBER_COUNTRY}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- Modal -->
	<div class="modal fade" id="userSelModal" style="padding: 20px 35px;" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content" ></div>
		</div>
	</div>
</body>
</html>