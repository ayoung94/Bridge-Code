<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비매너 유저 신고정황 채팅내역 보기</title>
<style>
.modal-backdrop {
	z-index: -1;
}
</style>
<style>
.fromId {
	text-align: left;
}

.toId {
	text-align: right;
}

.css {
	align: center;
	padding: 5px;
}
</style>
</head>
<body>
	<div class="modal-body" align="center">
		<c:forEach items="${chatContext}" var="chatContext" varStatus="status">
			<div class="w3-row">
				<c:if test="${status.index eq 0}">
					<c:set value="${chatContext.CHAT_FROM_ID}" var="user1" />
				</c:if>
				<c:set value="${chatContext.CHAT_FROM_ID}" var="user2" />
				<c:if test="${user1 eq user2}">
					<div class="w3-col s12 w3-green w3-center">
						<p class="fromId">${chatContext.CHAT_FROM_ID}</p>
						<P class="fromId">${chatContext.CHAT_CONTENT}</P>
					</div>
				</c:if>
				<c:if test="${user1 ne user2}">
					<div class="w3-col s12 w3-grey w3-center">
						<p class="toId">${chatContext.CHAT_FROM_ID}</p>
						<P class="toId">${chatContext.CHAT_CONTENT}</P>
					</div>
				</c:if>
			</div>
		</c:forEach>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</body>
</html>