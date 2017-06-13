<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">


	
</script>
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
			} ]
		});
	})
</script>
<script>
	function goNoticeInsertForm() {
		location.href = "noticeInsertForm.do"
	}
</script>
</head>
<body>
	<h1>공지사항</h1>
	<table id="noticeListTable">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${noticeList}" var="notice">
				<tr>
					<td>${notice.noticeId}</td>
					<td><a href="getNotice.do?noticeId=${notice.noticeId}">${notice.noticeTitle}</a></td>
					<td>${notice.noticeTime}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<input type="button" value="등록" onclick="goNoticeInsertForm()" />
	</div>

	<%-- 	<form action="<%=request.getContextPath()%>/getNoticeList.do"
		method="post">
		<!-- <input type="hidden" name="action" value="list" /> -->
		<div>
			<h1>공지사항</h1>
		</div>
		<table>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td>${notice.noticeId}</td>
					<td><a href="getNotice.do?noticeId=${notice.noticeId}">${notice.noticeTitle}</a></td>
			</c:forEach>
		</table>
	</form> --%>
	<!-- 
	<form action="">
		<input type="hidden" name="action" value="list" /> <input type="text"
			name="title" size="15" style="margin-top: 10px; margin-right: 5px;" />
		<input type="submit" value="검색" class="btn btn-template-main" /> <input
			type="button" value="글쓰기" onclick=""
			class="btn btn-template-main pull-right" />
	</form> -->

</body>
</html>