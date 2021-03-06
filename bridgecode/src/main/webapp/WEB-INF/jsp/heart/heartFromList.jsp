<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.myPageMenu {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
	margin-bottom: 20px;
}

.myPageMenu li {
    float: left;
}

.myPageMenu li a {
    display: block;
    color: black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    border-bottom: 5px #DCDCDC solid;
}
.myPageMenu li:last-child {
    width : 540px;
    border-bottom: 5px #DCDCDC solid;
   margin-top: 49px;
}

.changeBG:hover {
   background-color: #DCDCDC;
   color: white;
}
.active{
	cursor: default;
}
</style>
<script>
$('[data-toggle="tooltip"]').tooltip();
</script>
<body>
<ul class="myPageMenu">
  <li><a href="${pageContext.request.contextPath}/member/mypage.do" class="changeBG"><spring:message code="마이페이지" /></a></li>
  <li><a href="${pageContext.request.contextPath}/heart/heartFromList.do" class="active" style="border-bottom: 5px #8B008B solid; font:bold;color:#8B008B;"><spring:message code="내하트내역" /></a></li>
  <li><a href="${pageContext.request.contextPath}/member/memberSelect.do" class="changeBG" style="text-align: left;"><spring:message code="내회원정보" /></a></li>
  <li></li>
</ul>

<table class="table" style="width:750px;text-align: center;">
    <thead>
        <tr>
            <th class="text-center">#</th>
            <th class="text-center"><spring:message code="받은사람" /></th>
            <th class="text-center"><spring:message code="보낸시각" /></th>
            <th class="text-center"><spring:message code="처리상황" /></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${list}" var="heart" >
		<tr>
			<td>${heart.HEART_ID} </td>
			<td>${heart.HEART_TO_ID} </td>
			<td>${heart.HEART_FROM_TIME} </td>
			<td>
			<c:if test="${heart.HEART_STATUS == 0 }">
			  <span class="label label-default"><spring:message code="대기" /></span>
			</c:if>
			<c:if test="${heart.HEART_STATUS == 1 }">
			  <span class="label label-primary"><spring:message code="수락" /></span>
			</c:if>
			<c:if test="${heart.HEART_STATUS == 2 }">
			  <span class="label label-default"><spring:message code="거절" /></span>
			</c:if>
			<c:if test="${heart.HEART_STATUS == 3 }">
			  <span class="label label-default" data-toggle="tooltip" data-placement="top" title="<spring:message code="만료.tooltip" />"><spring:message code="만료" /></span>
			</c:if>
			
			 </td>
		</tr>
		</c:forEach>
    </tbody>
</table>

</body>
</html>