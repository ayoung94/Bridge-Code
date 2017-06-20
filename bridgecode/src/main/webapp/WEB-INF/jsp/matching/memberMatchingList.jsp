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
#slider-range { width: 300px;
				margin : 15px;
				margin-left:0;}
			
img {	width:200px; }
#age0  {width : 50px;
		border:0; 
		color:#f6931f; 
		font-weight:bold;
		text-align : center;
		}
#age1 {	width : 50px;
		border:0; 
		color:#f6931f; 
		font-weight:bold;	
		text-align : center;
		}
		
</style>
<!-- In <head> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

$(function() {
	// 연령선택 바
/*    	$('#sliderDouble').noUiSlider({
	start : [10, 50],
	connect : true,
	range : {
		'min' : [10],
		'max' : [50] }
	}) */
	
 $( "#slider-range" ).slider({
      range: true,
      min: 10,
      max: 50,
      values: [ 20, 40 ],
      slide: function( event, ui ) {
        $( "#age0" ).val( ui.values[ 0 ]) + "세 ~";
        $( "#age1" ).val( ui.values[ 1 ]) + "세";
      }
    });
    $( "#age0" ).val( $( "#slider-range" ).slider( "values", 0 )) + "세 - ";
    $( "#age1" ).val( $( "#slider-range" ).slider( "values", 1 )) + "세";
		//체크박스 등록 갯수 확인
		$(':checkbox').click(function() {
			var checkboxs = $("[name='interest']:checked"); // :checked
			var checkValue = "";
			var cnt = 1; //관심항목 갯수 확인
			for (i = 0; i < checkboxs.length; i++) {
				if (cnt > 3) {
					alert("관심사는 최대 3개까지 등록 가능합니다.");
					return false;
				}
				checkValue += checkboxs[i].value;
				if (i != checkboxs.length - 1) {
					checkValue += ",";
				}
				cnt++
			}
			//배열로 저장
			var arr = checkValue.split(',');
			$("#member_interest1").attr('value', arr[0]);
			$("#member_interest2").attr('value', arr[1]);
			$("#member_interest3").attr('value', arr[2]);

		});

	});
</script>

</head>
<body>

 <form>

	<div class="wrapper">
		<h1>커플매칭</h1>
		<h3>나의 짝을 찾아보세요! </h3>
			<table>
			<tr>
				<%
					int j = 0;
				%>									
				<c:forEach items="${list}" var="interest">
					<td>
						<div class="checkbox">
							<label> <input type="checkbox" name="interest" value="${interest.code_id }"   
							<c:if test="${login.member_interest1 == interest.code_id or login.member_interest2 == interest.code_id 
						  				or login.member_interest3 == interest.code_id}">checked </c:if>>
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
 				<input type="hidden" id="member_interest1" name="member_interest1">
				<input type="hidden" id="member_interest2" name="member_interest2">
				<input type="hidden" id="member_interest3" name="member_interest3"> 
		<span>*관심사는 최대 3개까지 등록이 가능합니다. </span> <br>


		<br>
		<p>국적선택</p>
		<div class="radio">
			<label> <input type="radio" name="optionsRadios" value="ko" checked="checked"> 한국</label> 
			<label> <input type="radio" name="optionsRadios" value="jp"> 일본</label> 
			<label> <input type="radio" name="optionsRadios" value="cn"> 중국</label>
		</div><br>

		<div>연령선택  </div>
		  <label for="age"></label>
  		  <input type="text" id="age0" name="age" readonly>세 ~
  		  <input type="text" id="age1" name="age1" readonly>세
		<div id="slider-range"></div>		
		<br>
		
		<p>이성만 검색하기</p>
		<div class="togglebutton">
			<label> <input type="checkbox" checked="checked" name="toggle">
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
									<c:if test="${user.MEMBER_SEX == '1'}">남</c:if>
									<c:if test="${user.MEMBER_SEX == '2'}">여</c:if>
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
