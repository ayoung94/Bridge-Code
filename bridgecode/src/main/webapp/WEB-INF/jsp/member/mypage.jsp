<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
function startTime() {
	var heartColor=document.getElementById("heartColor");
	//heartColor.style.height='50%';
	console.log("★"+'${heartfrom.heart_from_time}');
	var 충전시간 = new Date('${heartfrom.heart_from_time}');
	충전시간.setHours(충전시간.getHours()+24);
	var today = new Date();
	 
	var 남은시간 = 충전시간 - today;
	var 남은시간퍼센트 = (남은시간/(24*60*60*1000))*100;
	console.log(남은시간퍼센트);
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
<c:if test="${!empty Heart }">
<div style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url('${pageContext.servletContext.contextPath}/images/heartColor.png') 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 200px; PADDING-TOP: 0px; HEIGHT: 200px;">
<p id="heartColor" style="WIDTH: 200px; PADDING-RIGHT:0px; PADDING-LEFT:0px; BACKGROUND: url('${pageContext.servletContext.contextPath}/images/heart.png') 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; ">
</p>
</div>

다음 하트 까지  <div id="clock"></div><br>
</c:if>
<c:if test="${empty Heart }"> 

<img src="${pageContext.servletContext.contextPath}/images/heartColor.png">
하트를 사용해보세요!<br>
</c:if>

<div>
my information<br>

${member.member_nickname }님<br> 
<fmt:parseDate value="${member.member_birth }" pattern="yyyymmdd" var="member_birth" scope="page"/>
<fmt:formatDate value="${member_birth}" pattern="yyyy-MM-dd" />/${member.member_country }<br>
<a href="${pageContext.request.contextPath}/member/memberUpdate.do"> 내 정보 수정하기 </a>
</div>

<div>
새로 도착한 ♥

<div class="w3-container">
  <ul class="w3-ul w3-card-4">
    <li class="w3-display-container">Jill <span onclick="this.parentElement.style.display='none'" class="w3-button w3-transparent w3-display-right">&times;</span></li>
    <li class="w3-display-container">Adam <span onclick="this.parentElement.style.display='none'" class="w3-button w3-transparent w3-display-right">&times;</span></li>
    <li class="w3-display-container">Eve <span onclick="this.parentElement.style.display='none'" class="w3-button w3-transparent w3-display-right">&times;</span></li>
  </ul>
</div>

</div>
</body>
</html>