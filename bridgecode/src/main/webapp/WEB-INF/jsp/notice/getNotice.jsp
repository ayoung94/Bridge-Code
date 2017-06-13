<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세보기</title>
<script>
function goNoticeList(){
	location.href = "getNoticeList.do"
}</script>
</head>
<body>
	<h1>공지사항 상세보기</h1>
	<table border="1">
		<tr>
			
			<td>글번호</td>
			<td>제목</td>
			<td>작성일</td>
			
		</tr>
		<tr>
			
			<td>${notice.noticeId}</td>
			<td>${notice.noticeTitle}</td>
			<td>${notice.noticeTime}</td>
			
		</tr>
		<tr>
			<td colspan="3">${notice.noticeContent }</td>
		</tr>


	</table>
	<div>
		<input type="button" value="목록으로" onclick="goNoticeList()" />
		<input type="button" value="수정" onclick="" />
		<input type="button" value="삭제" onclick="" />
		
	</div>

</body>
</html>