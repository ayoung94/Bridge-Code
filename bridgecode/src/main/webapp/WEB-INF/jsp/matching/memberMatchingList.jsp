<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
<!-- In <head> -->
<link href="${pageContext.request.contextPath}/resources/css/nouislider.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/nouislider.min.js" type="text/javascript"></script>
</head>
<body>
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
							<label> <input type="checkbox" name="interest">
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

		<div>연령선택</div>
		<div id="sliderDouble" class="slider slider-info"></div>
		
		
		
 	<!--Javascript -->

  		<script>
			$(function() {
				$('#sliderDouble').noUiSlider({
					start : [10, 50],
					connect : true,
					range : {
						'min' : [10],
						'max' : [50] }
				});
			})
			console.log($('#sliderDouble').val());
		</script> 
		

		
<!-- 	<script>	
		var tooltipSlider  = document.getElementById('sliderDouble');

			noUiSlider.create(tooltipSlider, {
				start: [10, 50],
				tooltips: [ false, wNumb({ decimals: 1 }), true ],
				range: {
					min: 10,
					max: 50
				}
			});
		
		</script> -->


		<br>
		<p>이성만 검색하기</p>
		<div class="togglebutton">
			<label> <input type="checkbox" checked="checked">
				on/off
			</label>
			<table border="1">
				<tr>
					<%
						int i = 0;
					%>
					<c:forEach items="${member}" var="user">
						<td>
							<div>
								<a
									href="${pageContext.request.contextPath}/matching/memberSelect.do?id=${user.MEMBER_ID}">
									${user.MEMBER_ID} </a><br> ${user.MEMBER_NICKNAME} <br> <img
									src="${pageContext.request.contextPath}/WEB-INF/imeges/${user.MEMBER_PROFILE_IMG}"
									class="img-circle"> <br>
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
</body>
</html>
