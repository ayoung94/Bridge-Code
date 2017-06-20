<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Event detail</title>
<script>
	function getEventList() {
		location.href = "getEventList.do";
	}
	function modifyEvent() {
		changeForm.action = "<c:url value='/modifyEvent.do'/>";
		changeForm.submit();
	}
	function deleteEvent() {
		changeForm.action = "<c:url value='/deleteEvent.do'/>";
		changeForm.submit();
	}
</script>
<style>
div.height {
	height: 40px;
	text-align: center;
	padding: 10px;
	text-align: center;
}

button.size {
	padding: 10px 20px 10px 20px;
}

input.size {
	padding: 10px 20px 10px 20px;
}
</style>
</head>
<body>
	<form class="w3-container w3-card-4 "
		style="width: 100%; margin: auto;" id="changeForm">
		<h2 class="w3-text-blue">Event 상세보기</h2>
		<div class="w3-row">
			<div class="w3-col m3 w3-green w3-center height">글번호</div>
			<div class="w3-col m6 w3-blue w3-center height">제목</div>
			<div class="w3-col m3 w3-green w3-center height">작성일</div>
		</div>
		<div class="w3-row w3-cell-bottom">
			<div class="w3-col m3 w3-white w3-center height">
				<input type="text" size="10"
					style="text-align: center; border: none;" name="eventId"
					value="${event.eventId}">
			</div>
			<div class="w3-col m6 w3-white w3-center height">
				<input type="text" value="${event.eventTitle}" size="80"
					style="text-align: center; border: none;" name="eventTitle">
			</div>
			<div class="w3-col m3 w3-white w3-center height">
				${event.eventTime}</div>
		</div>
		<div class="w3-row">
			<div class="w3-col m12 w3-blue w3-center height">내용</div>
		</div>
		<div class="w3-row">
			<div class="w3-col m12 w3-grey w3-center">
				<p>
					<textarea cols="163" rows="10" style="border: none"
						onkeydown="resize(this)" onkeyup="resize(this)"
						name="eventContent">${event.eventContent}</textarea>
				</p>
			</div>
		</div>
		<br />
		<div class="w3-row">
			<button type="button" class="w3-button w3-blue size"
				onclick="getEventList()">list</button>
			<c:if test="${login.member_id == 'admin'}">
				<input type="submit" class="w3-button w3-green size" value="수정"
					onclick="modifyEvent()">
			</c:if>
			<c:if test="${login.member_id == 'admin'}">
				<input type="button" class="w3-button w3-grey size"
					onclick="deleteEvent()" value="삭제">
			</c:if>
		</div>
	</form>
</body>
</html>