<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
table td {
	padding: 10px;
}
#sliderDouble { width: 300px;
			margin : 15px;}
			
img {width:200px; }
</style>
<!-- In <head> -->
<link href="${pageContext.request.contextPath}/resources/css/nouislider.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/nouislider.min.js" type="text/javascript"></script>

<script>
$(function() {
		$('#sliderDouble').noUiSlider({
		start : [10, 50],
		connect : true,
		range : {
			'min' : [10],
			'max' : [50] }
	})
	$(':checkbox').click(function(){
		var checkboxs = $("[name='interest']:checked"); // :checked
		var checkValue = "";
		var cnt = 1; //관심항목 갯수 확인
		for(i=0;i<checkboxs.length;i++){
			if(cnt>3){alert("관심사는 최대 3개까지 등록 가능합니다.");
					return false;}
			checkValue += checkboxs[i].value;
			if(i != checkboxs.length-1 ){checkValue += ",";}
			cnt++
		}
			var arr = checkValue.split(',');
			console.log(arr.length);
		});
/* 	for(j=0 ; j<arr.length ; j++){
		if(arr[j].value == ${user.member_interest1} )
	} */
});



	/* 	var tooltipSlider = document.getElementById('sliderDouble');

	 noUiSlider.create(tooltipSlider, {
	 start : [ 10, 50 ],
	 tooltips : [ false, wNumb({
	 decimals : 1
	 }), true ],
	 range : {
	 min : 10,
	 max : 50
	 }
	 });
	 console.log($('#sliderDouble').val()); */
</script>

</head>
<body>
 <form>

	<div class="wrapper">
		<h1>커플매칭</h1>
		<h3>나의 짝을 찾아보세요!</h3>
		<table>
			<tr>
				<%
					int j = 0;
				%>
				<c:forEach items="${list}" var="interest">
					<td>
						<div class="checkbox">
							<label> <input type="checkbox" name="interest" value="${interest.code_id }" id="myCheck">
								${interest.code_name }
							</label>
						</div>
					</td>
					<%
						j++;
							if (j % 5 == 0) {
								out.print("</tr><tr>");
							}
					%>
				</c:forEach>
			</tr>
		</table>


		<br>
		<p>국적선택</p>
		<div class="radio">
			<label> <input type="radio" name="optionsRadios"
				checked="true"> 한국</label> 
			<label> <input type="radio" name="optionsRadios"> 일본</label> 
			<label> <input type="radio" name="optionsRadios"> 중국</label>
		</div>

		<div>연령선택  </div>
		<div id="sliderDouble" class="slider slider-info"></div>
		<br>
		
		<p>이성만 검색하기</p>
		<div class="togglebutton">
			<label> <input type="checkbox" checked="checked">
				on/off
			</label>
			
		<button>찾기</button>
			<table border="1">
				<tr>
					<%
						int i = 0;
					%>
					<c:forEach items="${member}" var="user">
						<td>
							<div>
								<a href="${pageContext.request.contextPath}/matching/memberSelect.do?id=${user.MEMBER_ID}">
								<img src="${pageContext.request.contextPath}/profile_img/${user.MEMBER_PROFILE_IMG}" 
									class="img-circle"></a>
									${user.MEMBER_ID} <br> 
									${user.MEMBER_NICKNAME} <br> 
									<c:if test="${user.MEMBER_SEX == '1' or user.MEMBER_SEX == '3'}">남</c:if>
									<c:if test="${user.MEMBER_SEX == '2' or user.MEMBER_SEX == '4'}">여</c:if>
									<br>
									<!-- 나이 처리 시작-->
									<jsp:useBean id="toDay" class="java.util.Date" />
									<fmt:formatDate value="${toDay}" pattern="yyyy" var="date" />

									<fmt:parseDate value="${user.MEMBER_BIRTH }"
										pattern="yyyy-mm-dd" var="memberBirth" scope="page" />
									<fmt:formatDate value="${memberBirth}" pattern="yyyy"
										var="birth" />
									<!-- 나이 처리 끝 -->
									${date - birth +1}세
									 <br> 
							</div>
						</td>
						<!-- 1줄에 5명씩 출력하기 위한 처리. -->
						<%
							i++;
								if (i % 5 == 0) {
									out.print("</tr><tr>");
								}
						%>
					</c:forEach>
				</tr>

			</table>
		</div>
	</div>
 </form>
</body>
</html>
