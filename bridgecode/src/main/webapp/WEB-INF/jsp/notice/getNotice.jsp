<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세보기</title>
<script>
	function getNoticeList() {
		location.href = "getNoticeList.do";
	}
	function modifyNotice() {
		changeForm.action = "<c:url value='/modifyNotice.do'/>";
		changeForm.submit();
	}
	function deleteNotice() {
		changeForm.action = "<c:url value='/deleteNotice.do'/>";
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
		<h2 class="w3-text-blue"><spring:message code='공지사항상세보기'/></h2>
		<div class="w3-row">
			<div class="w3-col m3 w3-green w3-center height"><spring:message code='글번호'/></div>
			<div class="w3-col m6 w3-blue w3-center height"><spring:message code='제목'/></div>
			<div class="w3-col m3 w3-green w3-center height"><spring:message code='작성일'/></div>
		</div>
		<div class="w3-row w3-cell-bottom">
			<div class="w3-col m3 w3-white w3-center height">
				<input type="text" size="10"
					style="text-align: center; border: none;" name="noticeId"
					value="${notice.noticeId}">
			</div>
			<div class="w3-col m6 w3-white w3-center height">
				<input type="text" value="${notice.noticeTitle}"
					style="text-align: center; border: none;" name="noticeTitle">
			</div>
			<div class="w3-col m3 w3-white w3-center height">
				${notice.noticeTime}</div>
		</div>
		<div class="w3-row">
			<div class="w3-col m12 w3-blue w3-center height"><spring:message code='내용'/></div>
		</div>
		<div class="w3-row">
			<div class="w3-col m12 w3-grey w3-center">
				<p>
					<textarea cols="110" rows="11" style="border: none"
						onkeydown="resize(this)" onkeyup="resize(this)"
						name="noticeContent">${notice.noticeContent}</textarea>
				</p>
			</div>
		</div>
		<br />
		<div class="w3-row">
			<button type="button" class="w3-button w3-blue size"
				onclick="getNoticeList()">list</button>
			<c:if test="${login.member_id == 'admin'}">
				<input type="submit" class="w3-button w3-green size" value="수정"
					onclick="modifyNotice()">
			</c:if>
			<c:if test="${login.member_id == 'admin'}">
				<input type="button" class="w3-button w3-grey size"
					onclick="deleteNotice()" value="삭제">
			</c:if>
		</div>
	</form>
</body>
</html>