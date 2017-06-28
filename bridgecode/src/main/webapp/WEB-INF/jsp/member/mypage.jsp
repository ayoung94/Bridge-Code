<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
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
	width: 540px;
	border-bottom: 5px #DCDCDC solid;
	margin-top: 49px;
}

.changeBG:hover {
	background-color: #DCDCDC;
	color: white;
}

.active {
	cursor: default;
}
</style>
<script>
	function startTime() {
		var heartColor = document.getElementById("heartColor");
		//heartColor.style.height='50%';

		var 충전시간 = new Date('${heartfrom.heart_from_time}');
		충전시간.setHours(충전시간.getHours() + 24);
		var today = new Date();

		var 남은시간 = 충전시간 - today;
		var 남은시간퍼센트 = (남은시간 / (24 * 60 * 60 * 1000)) * 100;

		heartColor.style.height = 남은시간퍼센트 + '%';

		var currHour = 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
		var currMinute = 60 * 1000;// 월 만듬
		var currSecond = 1000; // 년 만듬

		//충전시간(마지막 하트시간+24시간) - 현재시간
		var h = parseInt(남은시간 / currHour);
		var m = parseInt(남은시간 / currMinute) % 60;
		var s = parseInt(남은시간 / currSecond) % 60;
		h = checkTime(h);
		m = checkTime(m);
		s = checkTime(s);
		document.getElementById('clock').innerHTML =  h + ":" + m + ":" + s;
		var t = setTimeout(startTime, 500);
	}
	function checkTime(i) {
		if (i < 10) {
			i = "0" + i
		}
		; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
		return i;
	}
</script>
</head>
<body onload="startTime()">
	<!--  <h3><i class="material-icons">account_circle</i>마이 페이지</h3> -->
	<ul class="myPageMenu">
		<li><a class="activeMenu"
			style="border-bottom: 5px #8B008B solid; font: bold; color: #8B008B;">마이
				페이지</a></li>
		<li><a
			href="${pageContext.request.contextPath}/heart/heartFromList.do"
			class="changeBG">내 하트 내역</a></li>
		<li><a
			href="${pageContext.request.contextPath}/member/memberSelect.do"
			class="changeBG" style="text-align: left;">내 회원정보</a></li>
		<li></li>
	</ul>
	
	
	
	<div class="row">
		<div class="col-sm-4" style="padding: 10px;">
		<div class="w3-panel w3-border w3-round-large">
<!-- 
			<div class="panel panel-danger" style="width: 350px;"> -->
				<div class="panel-heading" style="border-bottom: 1px dotted #bbb;"><i class="material-icons">favorite_border</i><b>My heart</b></div><!--  style="background-color: #DCDCDC; -->
				<div class="panel-body" >
					<c:set var="Heart" value="${heartfrom.heart_from_time}" />
					<c:choose>
						<c:when test="${!empty Heart }">
							<br>
								<div
									style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url('${pageContext.servletContext.contextPath}/images/heartColor.png') 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 100px; PADDING-TOP: 0px; HEIGHT: 100px;">
									<p id="heartColor"
										style="WIDTH: 100px; PADDING-RIGHT:0px; PADDING-LEFT:0px; BACKGROUND: url('${pageContext.servletContext.contextPath}/images/heart.png') 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; ">
									</p>
								</div>		
								<br>		
								<div>
								    <div style="font:1em;float: right;width: 60%;">다음 하트까지</div>
								    <div><div id="clock" style="font-size: 40px;"></div></div>
								</div>
								
								<br>
								<button class="btn btn-simple btn-primary btn-sm"
								onclick="location.href='${pageContext.request.contextPath}/heart/heartFromList.do'"
								style="float: right;">하트 사용 내역</button>
						
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.servletContext.contextPath}/images/heartColor.png">
									하트를 사용해보세요!<br>
							<br>
							<button class="btn btn-simple btn-primary btn-sm"
								onclick="location.href='${pageContext.request.contextPath}/heart/heartFromList.do'"
								style="margin-left: 220px;">하트 사용 내역</button>

						</c:otherwise>
					</c:choose>
				</div>
</div>


		</div>
		<div class="col-sm-5" style="padding: 10px;">
		<div class="w3-panel w3-border w3-round-large"> <!-- style="border: 1px solid #bbb;" -->
	<!-- 		<div class="panel-group" >
				<div class="panel panel-default"> -->
					<div class="panel-heading" style="border-bottom: 1px dotted #bbb;"><i class="material-icons">face</i><b>My Profile</b></div> <!-- style="background-color: #bbb;" -->
					<div class="panel-body">

						<table>
							<tr>
								<td><img
									src="${pageContext.request.contextPath}/profile_img/${login.member_profile_img}"
									style="height: 100px;" alt="Rounded Image"
									class="img-rounded img-responsive">
									<button class="btn btn-primary btn-sm"
										onclick="document.getElementById('fileUpload').click();">프로필
										사진 수정</button>

									<form method="post" enctype="multipart/form-data"
										action="${pageContext.request.contextPath}/member/memberProfileUpdate.do">
										<input type="hidden" name="member_id"
											value="${member.member_id }"> <input type="file"
											name="uploadFile" id="fileUpload" style="display: none;"
											onchange="submit();" />
									</form></td>

								<td width="400px;" style="padding: 5px; padding-left: 20px;"><br>
									${member.member_nickname }님<br>
								<br> <!-- 나이 처리 시작--> <jsp:useBean id="toDay"
										class="java.util.Date" /> <fmt:formatDate value="${toDay}"
										pattern="yyyy" var="date" /> <fmt:parseDate
										value="${member.member_birth }" pattern="yyyy-mm-dd"
										var="memberBirth" scope="page" /> <fmt:formatDate
										value="${memberBirth}" pattern="yyyy" var="birth" /> <!-- 나이 처리 끝 -->
									${date - birth +1}세 / ${member.member_country }<br>
								<br>
									<button class="btn btn-simple btn-primary btn-sm"
										onclick="location.href='${pageContext.request.contextPath}/member/memberSelect.do'"
										style="float: right;">회원 정보 상세보기</button></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			</div>
<!-- 		</div>
	</div> -->

	<br>
<div class="col-sm-9">
	<div class="panel panel-default" style="background-color:#FFFAFA;">
		<div class="panel-body">

				<i class="material-icons">favorite</i><b>My new heart</b><br>
		
				<div class="w3-container" ><!-- style="padding-left: 80px;padding-bottom: 50px;"  -->
				<c:if test="${empty heartto}">
			<br>
			새로 도착한 하트가 없습니다. 
			<br>
			</c:if>
							<div class="col-sm-12"> <!-- dd -->
					<ul class="w3-ul w3-card-4">
					
						<c:forEach items="${heartto}" var="heartTo">

							<li class="w3-display-container" style="background-color: white; margin: 30px;">
							<span onclick="this.parentElement.style.display='none'"
								class="w3-button w3-transparent" style="float: right;">&times;</span>
							<br>
						
								<div class="row">
								    <div class="col-sm-2"> <img onclick="location.href='${pageContext.request.contextPath}/matching/memberSelect.do?id=${heartTo.HEART_FROM_ID}'"alt="Circle Image" class="img-circle img-responsive" 
							src="${pageContext.request.contextPath}/profile_img/${heartTo.MEMBER_PROFILE_IMG}" 
							style="height: 80px; width: 80px;cursor:pointer;"> </div>
							
							
								    <div class="col-sm-8"><br><br>${heartTo.MEMBER_NICKNAME}님께서 하트를 보내셨습니다.</div>
								</div>
								



							
								
								<div class="w3-right-align">
									<button class="btn btn-white btn-sm"
										onclick="location.href='${pageContext.request.contextPath}/heart/heartYES.do?heart_id=${heartTo.HEART_ID}'">수락</button>
									<button class="btn btn-white btn-sm"
										onclick="location.href='${pageContext.request.contextPath}/heart/heartNO.do?heart_id=${heartTo.HEART_ID}'">거절</button>
								</div></li>
								
						</c:forEach>
					</ul>
			</div>
			</div>
		</div>
	</div>
</div>




</body>
</html>