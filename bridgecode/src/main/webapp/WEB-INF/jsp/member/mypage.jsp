<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
function startTime() {
	var heartColor=document.getElementById("heartColor");
	//heartColor.style.height='50%';

	var 충전시간 = new Date('${heartfrom.heart_from_time}');
	충전시간.setHours(충전시간.getHours()+24);
	var today = new Date();
	 
	var 남은시간 = 충전시간 - today;
	var 남은시간퍼센트 = (남은시간/(24*60*60*1000))*100;

	heartColor.style.height= 남은시간퍼센트+'%';
	
	var currHour = 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
	var currMinute = 60 * 1000;// 월 만듬
	var currSecond = 1000; // 년 만듬

	//충전시간(마지막 하트시간+24시간) - 현재시간
    var h = parseInt(남은시간/currHour);
    var m = parseInt(남은시간/currMinute) % 60;
    var s = parseInt(남은시간/currSecond) % 60;
    h = checkTime(h);
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('clock').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
    return i;
}

</script>
</head>
<body onload="startTime()">

<c:set var="Heart" value="${heartfrom.heart_from_time}" />
<c:choose>
<c:when test="${!empty Heart }">
<div style="border:1px solid black; margin-top: 50px; width: 500px; height: 130px;">
<div style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url('${pageContext.servletContext.contextPath}/images/heartColor.png') 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 100px; PADDING-TOP: 0px; HEIGHT: 100px;">
<p id="heartColor" style="WIDTH: 100px; PADDING-RIGHT:0px; PADDING-LEFT:0px; BACKGROUND: url('${pageContext.servletContext.contextPath}/images/heart.png') 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; ">
</p>
</div>
<br><br>
다음 하트 까지  <div id="clock" style="font-size:20px;"></div><br>
<a href="${pageContext.request.contextPath}/heart/heartFromList.do" style="margin-left: 100px;">하트 사용 내역</a>
</div> 
</c:when>
<c:otherwise>
<img src="${pageContext.servletContext.contextPath}/images/heartColor.png">
하트를 사용해보세요!<br>
<a href="${pageContext.request.contextPath}/heart/heartFromList.do">하트 사용 내역</a>
</c:otherwise>
</c:choose>
<div style="border:1px solid black; margin-top: 50px; width: 500px; height: 130px;">
my information<br>
<img src="${pageContext.request.contextPath}/profile_img/${member.member_profile_img }" width="100px">
${member.member_nickname }님<br> 
<!-- 나이 처리 시작-->
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value="${toDay}" pattern="yyyy" var="date" />

<fmt:parseDate value="${member.member_birth }" pattern="yyyy-mm-dd" var="memberBirth" scope="page"/>
<fmt:formatDate value="${memberBirth}" pattern="yyyy" var="birth" />
<!-- 나이 처리 끝 -->
${date - birth +1}세 / ${member.member_country }<br>
<a href="${pageContext.request.contextPath}/member/memberSelect.do"> 상세 보기</a>
</div>

<div style="margin-top: 50px; width: 500px; height: 130px;">
새로 도착한 ♥ 

<div class="w3-container">
  <ul class="w3-ul w3-card-4" style="width: 500px;">
	<c:if test="${empty heartto}">
	새로 도착한 하트가 없습니다. 
	</c:if>
   <c:forEach items="${heartto}" var="heartTo" >
    <li class="w3-display-container">
    <br>
    ${heartTo.HEART_FROM_ID}님께서 하트를 보내셨습니다.
    <br>
    <div class="w3-right-align">
    <button class="btn btn-white btn-sm" onclick="location.href='${pageContext.request.contextPath}/heart/heartYES.do?heart_id=${heartTo.HEART_ID}'">수락</button>
    <button class="btn btn-white btn-sm" onclick="location.href='${pageContext.request.contextPath}/heart/heartNO.do?heart_id=${heartTo.HEART_ID}'">거절</button>
    </div>
    <span onclick="this.parentElement.style.display='none'" class="w3-button w3-transparent w3-display-right">&times;</span></li>
  </c:forEach>
  </ul>
</div>
</div>

</body>
</html>