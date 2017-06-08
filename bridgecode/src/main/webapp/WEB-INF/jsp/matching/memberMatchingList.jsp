<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<div class="wrapper">
	<p>커플매칭</p>
	나의 짝을 찾아보세요!
	<div class="col-md-1 dropdown">
		<a href="#" class="btn btn-simple dropdown-toggle"
			data-toggle="dropdown"> 관심사 <b class="caret"></b>
		</a>
		<ul class="dropdown-menu">
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
		</ul>
	</div>
	<div class="col-md-1 dropdown">
		<a href="#" class="btn btn-simple dropdown-toggle"
			data-toggle="dropdown"> 관심사 <b class="caret"></b>
		</a>
		<ul class="dropdown-menu">
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
		</ul>
	</div>
	<div class="col-md-1 dropdown">
		<a href="#" class="btn btn-simple dropdown-toggle"
			data-toggle="dropdown"> 관심사 <b class="caret"></b>
		</a>
		<ul class="dropdown-menu">
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
			<li><input type="checkbox" name="">Action</li>
		</ul>
	</div>
	<br>
	<br>
	<br>
	<p>국적선택</p>
	<div class="radio">
		<label> <input type="radio" name="optionsRadios"
			checked="true"> 한국
		</label>
	</div>
	<div class="radio">
		<label> <input type="radio" name="optionsRadios"> 일본
		</label>
	</div>
	<div class="radio">
		<label> <input type="radio" name="optionsRadios"> 중국
		</label>
	</div>

	<!-- Markup -->
	<div id="sliderRegular" class="slider"></div>
	<div id="sliderDouble" class="slider slider-info"></div>

	<script>
	<!-- Javascript -->
		$('#sliderRegular').noUiSlider({
			start : 40,
			connect : "lower",
			range : {
				min : 0,
				max : 100
			}
		});

		$('#sliderDouble').noUiSlider({
			start : [ 20, 60 ],
			connect : true,
			range : {
				min : 0,
				max : 100
			}
		});
	</script>

	<p>이성만 검색하기</p>
	<div class="togglebutton">
		<label> <input type="checkbox" checked=""> on/off
		</label>
		<table border="1">
			<tr>
				<%
					int i = 0;
				%>
				<c:forEach items="${list}" var="user">
					<td>
						<div>
							<a
								href="${pageContext.request.contextPath}/matching/memberSelect.do?id=${user.MEMBER_ID}">
								${user.MEMBER_ID} </a><br> ${user.MEMBER_NICKNAME} <br> <img
								src="${pageContext.request.contextPath}/WEB-INF/imeges/${ussr.MEMBER_PROFILE_IMG}"
								class="img-circle"> <br>
						</div>
					</td>
					<!-- 1줄에 4명씩 출력하기 위한 처리. -->
					<%
						i++;
							if (i % 4 == 0) {
								out.print("</tr><tr>");
							}
					%>
				</c:forEach>
			</tr>

		</table>
		</div>
		</body>
</html>
