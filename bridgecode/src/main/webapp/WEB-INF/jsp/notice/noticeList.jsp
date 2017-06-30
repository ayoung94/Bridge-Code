<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<script>
	$(function() {
		$("#noticeListTable").DataTable({
			/*  "paging": false,
				"ordering":  false,
				"searching": false, */
			//"ajax" : "ajaxGetEmpList.do",
			"columns" : [ {
				"data" : "noticeId"
			}, {
				"data" : "noticeTitle"
			}, {
				"data" : "noticeTime"
			}, {
				"data" : "noticeCnt"
			} ]
		});
	})
</script>
<script>
	function goNoticeInsertForm() {
		location.href = "noticeInsertForm.do"
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
	<h1><spring:message code='공지사항'/></h1>
	<table id="noticeListTable">
		<thead>
			<tr>
				<th><spring:message code='글번호'/></th>
				<th><spring:message code='제목'/></th>
				<th><spring:message code='작성일'/></th>
				<th><spring:message code='조회수'/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${noticeList}" var="notice">
				<tr>
					<td>${notice.noticeId}</td>
					<td><a href="getNotice.do?noticeId=${notice.noticeId}">${notice.noticeTitle}</a></td>
					<td>${notice.noticeTime}</td>
					<td>${notice.noticeCnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${login.member_id == 'admin'}">
			<input type="button" class="w3-button w3-blue" value="등록" onclick="goNoticeInsertForm()">
		</c:if>
	</div>
</body>
</html>