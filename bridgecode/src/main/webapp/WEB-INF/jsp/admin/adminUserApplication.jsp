<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새로운 회원 신청 리스트</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<script>
	$(function() {
		$("#userListTable").DataTable({
			"columns" : [ {
				"data" : "MEMBER_ID"
			}, {
				"data" : "MEMBER_NICKNAME"
			}, {
				"data" : "MEMBER_BIRTH"
			}, {
				"data" : "MEMBER_SEX"
			}, {
				"data" : "MEMBER_COUNTRY"
			}, {
				"data" : "상세보기"
			}, {
				"data" : "승인"
			}, {
				"data" : "거부"
			} ]
		});
	})
</script>
<style>
.appth th{text-align:center;}
.apptd td{text-align:center;}

</style>

</head>
<body>
	<h1>새로운 회원 신청 리스트</h1>
	<table id="userListTable">
		<thead class="appth">
			<tr>
				<th>ID</th>
				<th>닉네임</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>국적</th>
				<th>상세보기</th>
				<th>승인</th>
				<th>거부</th>
			</tr>
		</thead>
		<tbody class="apptd">
			<c:forEach items="${userList}" var="userList">
				<tr>
					<td>${userList.MEMBER_ID}</td>
					<td>${userList.MEMBER_NICKNAME}</td>
					<td>${userList.MEMBER_BIRTH}</td>
					<td>${userList.MEMBER_SEX}</td>
					<td>${userList.MEMBER_COUNTRY}</td>
					<td><a href="getUserSel.do?member_id=${userList.MEMBER_ID}" data-toggle="modal" data-target="#userSelModal">상세보기</a></td>
					<td><a onClick="if(confirm('정식 회원으로 승인하시겠습니까?')) location.href='updateUserApplication.do?member_id=${userList.MEMBER_ID}'">승인</a></td>
					<td><a onClick="if(confirm('회원 가입 신청을 거부하시겠습니까?')) location.href='updateUserReject.do?member_id=${userList.MEMBER_ID}'">거부</a></td>
				</tr>
			</c:forEach>
		</tbody>
		
	<!-- Modal -->
<div class="modal fade" id="userSelModal" style="padding: 20px 35px;" role="dialog">
	<div class="modal-dialog modal-sm">
		<!-- Modal content-->
		<div class="modal-content" ></div>
	</div>
</div>
</table>
</body>
</html>