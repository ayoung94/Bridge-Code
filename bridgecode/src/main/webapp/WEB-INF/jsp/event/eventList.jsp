<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>event</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<script>
	$(function() {
		$("#eventListTable").DataTable({
			/*  "paging": false,
				"ordering":  false,
				"searching": false, */
			//"ajax" : "ajaxGetEmpList.do",
			"columns" : [ {
				"data" : "eventId"
			}, {
				"data" : "eventTitle"
			}, {
				"data" : "eventTime"
			}, {
				"data" : "eventCnt"
			} ]
		});
	})
</script>
<script>
	function goEventInsertForm() {
		location.href = "eventInsertForm.do"
	}
</script>
<style>
td {
	text-align: center;
}

th {
	text-align: center;
}
</style>
</head>
<body>
	<h1>EVENT</h1>
	<table id="eventListTable">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${eventList}" var="event">
				<tr>
					<td>${event.eventId}</td>
					<td><a href="getEvent.do?eventId=${event.eventId}">${event.eventTitle}</a></td>
					<td>${event.eventTime}</td>
					<td>${event.eventCnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${login.member_id == 'admin'}">
			<input type="button" class="w3-button w3-blue" value="등록"
				onclick="goEventInsertForm()">
		</c:if>
	</div>
</body>
</html>