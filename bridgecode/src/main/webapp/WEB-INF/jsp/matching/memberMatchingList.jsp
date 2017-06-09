<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
table td {
	padding: 10px;
}
</style>
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
				checked="true"> 한국
			</label> <label> <input type="radio" name="optionsRadios"> 일본
			</label> <label> <input type="radio" name="optionsRadios"> 중국
			</label>
		</div>

		<div>연령선택</div>

		<p>이성만 검색하기</p>
		<div class="togglebutton">
			<label> <input type="checkbox" checked=""> on/off
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
	</div>
</body>
</html>
