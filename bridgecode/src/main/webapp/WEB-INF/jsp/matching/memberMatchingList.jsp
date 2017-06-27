<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	width: 780px;
	border-bottom: 5px #DCDCDC solid;
	margin-top: 48px;
}

#result td {
	margin: 0px;
	padding: 0px;
	width: 228px;
	height: 228px;
}

a:hover {
	weight: bold;
	text-decoration: none;
}

.active {
	cursor: default;
}

.thumbnail {
	color: black;
}

.thumbnail img {
	display: inline-block;
	width: 220px;
	height: 200px;
	padding: 10px;
}

p {
	margin: 0px;
	text-align: center;
}

#codelist td {
	padding: 5px;
}

#sliderRange {
	width: 300px;
	margin: 15px;
	margin-left: 0;
}

#age0 {
	width: 50px;
	border: 0;
	color: #f6931f;
	font-weight: bold;
	text-align: center;
}

#age1 {
	width: 50px;
	border: 0;
	color: #f6931f;
	font-weight: bold;
	text-align: center;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
	$(function() {	
		$.getJSON("${pageContext.request.contextPath}/matching/memberMatching.do", function(data){		
			for(i=0 ; i<data.length; i++){
				if(data[i].MEMBER_SEX == '1'){
		        $('#result').append("<td ><a class='thumbnail' href='${pageContext.request.contextPath}/matching/memberSelect.do?id="
		    		+data[i].MEMBER_ID+"'><img src='${pageContext.request.contextPath}/profile_img/"
			    		+data[i].MEMBER_PROFILE_IMG + "' class='thumb-image'><p style='font-size:18px; font-weight:bold;'>"
      		    		+data[i].MEMBER_NICKNAME +"</p><p>"
      		    		+data[i].MEMBER_BIRTH+" 세</p>"
				    		+"<p>남성</p></a></td>")  	}
		    	else {
		    		$('#result').append("<td ><a class='thumbnail' href='${pageContext.request.contextPath}/matching/memberSelect.do?id="
				    		+data[i].MEMBER_ID+"'><img src='${pageContext.request.contextPath}/profile_img/"
  				    		+data[i].MEMBER_PROFILE_IMG + "' class='thumb-image'><p style='font-size:18px; font-weight:bold;'>"
	      		    		+data[i].MEMBER_NICKNAME +"</p><p>"
	      		    		+data[i].MEMBER_BIRTH+" 세</p>"
  				    		+"<p>여성</p></a></td>")  	}
		    	if((i+1)%5 == 0){  $('#result').append("</tr><tr>")
		    		}
					}
				});
	
		$("#matchingfrm").change(function(){
					var params = $("#matchingfrm").serialize();
					console.log(params);
			 	$.getJSON("${pageContext.request.contextPath}/matching/realMatching.do", params, function(data,status){  //서버 url주소
			 		if(status == "success") {
			 			$('#result').html("");
			               if( data.length > 0) {
			                  for(i=0 ; i<data.length; i++){
				      				if(data[i].MEMBER_SEX == '1'){
				      		        $('#result').append("<td ><a class='thumbnail' href='${pageContext.request.contextPath}/matching/memberSelect.do?id="
				      		    		+data[i].MEMBER_ID+"'><img src='${pageContext.request.contextPath}/profile_img/"
		      				    		+data[i].MEMBER_PROFILE_IMG + "' class='thumb-image'><p style='font-size:18px; font-weight:bold;'>"
				      		    		+data[i].MEMBER_NICKNAME +"</p><p>"
				      		    		+data[i].MEMBER_BIRTH+" 세</p>"
		      				    		+"<p>남성</p></a></td>")  	}
				      		    	else {
				      		    		$('#result').append("<td ><a class='thumbnail' href='${pageContext.request.contextPath}/matching/memberSelect.do?id="
				      				    		+data[i].MEMBER_ID+"'><img src='${pageContext.request.contextPath}/profile_img/"
				      				    		+data[i].MEMBER_PROFILE_IMG + "' class='thumb-image'><p style='font-size:18px; font-weight:bold;'>"
						      		    		+data[i].MEMBER_NICKNAME +"</p><p>"
						      		    		+data[i].MEMBER_BIRTH+" 세</p>"
				      				    		+"<p>여성</p></a></td>")  	}
				      		    	if((i+1)%5 == 0){
				      		    		$('#result').append("</tr><tr>")
				      		    		}
				      				}
			               }
			               } else {
			                  alert("등록에러");
			               }
			             
			         });
			         return false;    //event.preventDefault()
			      });
		
		
		//체크박스 등록 갯수 확인
		$(':checkbox').click(function() {
			var checkboxs = $("[name='interest']:checked"); // :checked
			var checkValue ="";			
			for(i=0 ; i<checkboxs.length ; i++){
				if(checkboxs.length >3){
					alert("관심사는 최대 3개까지 등록 가능합니다.");
					return false;	
				}
				checkValue += checkboxs[i].value;
				if (i != checkboxs.length - 1) {
					checkValue += ",";
				}
			}
 			//배열로 저장
			var arr = checkValue.split(',');
 			$("#interest1").attr('value', arr[0]);
			$("#interest2").attr('value', arr[1]);
			$("#interest3").attr('value', arr[2]);

	});

		
		

	// 슬라이드 범위바 시작
		$("#sliderRange").slider({	
			range : true,
			min : 1,
			max : 50,
			values : [ 10, 40 ],
			slide : function(event, ui) {
				$("#age0").val(ui.values[0]) + "세 ~";
				$("#age1").val(ui.values[1]) + "세";
			}
		});
	});
		$("#age0").val($("#sliderRange").slider("values", 0)) + "세 - ";
		$("#age1").val($("#sliderRange").slider("values", 1)) + "세";
		
	
	
	// 연령대 선택시 이벤트 함수
	function ageSlider(){
			var params = $("#matchingfrm").serialize();
			console.log(params);
	 	$.getJSON("${pageContext.request.contextPath}/matching/realMatching.do", params, function(data,status){  //서버 url주소
	 		if(status == "success") {
	 			$('#result').html("");
	               if( data.length > 0) {
	                  for(i=0 ; i<data.length; i++){
		      				if(data[i].MEMBER_SEX == '1'){
		      		        $('#result').append("<td ><a class='thumbnail' href='${pageContext.request.contextPath}/matching/memberSelect.do?id="
		      		    		+data[i].MEMBER_ID+"'><img src='${pageContext.request.contextPath}/profile_img/"
      				    		+data[i].MEMBER_PROFILE_IMG + "' class='thumb-image'><p style='font-size:18px; font-weight:bold;'>"
		      		    		+data[i].MEMBER_NICKNAME +"</p><p>"
		      		    		+data[i].MEMBER_BIRTH+" 세</p>"
      				    		+"<p>남성</p></a></td>")  	} 
		      		    	else {
		      		    		$('#result').append("<td ><a class='thumbnail' href='${pageContext.request.contextPath}/matching/memberSelect.do?id="
		      				    		+data[i].MEMBER_ID+"'><img src='${pageContext.request.contextPath}/profile_img/"
		      				    		+data[i].MEMBER_PROFILE_IMG + "' class='thumb-image'><p style='font-size:18px; font-weight:bold;'>"
				      		    		+data[i].MEMBER_NICKNAME +"</p><p>"
				      		    		+data[i].MEMBER_BIRTH+" 세</p>"
		      				    		+"<p>여성</p></a></td>")  	}
		      		    	if((i+1)%5 == 0){
		      		    		$('#result').append("</tr><tr>")
		      		    		}
		      				}
	               }
	               } else {
	                  alert("등록에러");
	               }
	             
	         });
	         return false;    //event.preventDefault()
	};
	

	
</script>

</head>
<body>
 
<form id="matchingfrm">
	<div class="wrapper">
	
	
	<ul class="myPageMenu">
		<li><a class="activeMenu" href="${pageContext.request.contextPath}/matching/memberMatchingList.do"
			style="border-bottom: 5px #8B008B solid; font: bold; color: #8B008B;">회원 찾기</a></li>
		<li><a href="${pageContext.request.contextPath}/matching/searchGenderList.do?member_sex=${login.member_sex}"
			class="changeBG">이성회원 보기</a></li>
		<li><a href="${pageContext.request.contextPath}/matching/allmemberList.do"
			class="changeBG" style="text-align: left;">전체회원 보기</a></li>
		<li></li>
	</ul>
	
	
		<h1>커플매칭</h1>
		<h3>나의 짝을 찾아보세요! </h3>
		<div class="row" >
			<div class="col-md-6">
			  <table id="codelist">
				<tr>
					<%
						int j = 0;
					%>
					<!-- 코드 리스트 출력 -->
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
		  </div>
		</div>
 			<input type="hidden" id="interest1" name="interest1" >
			<input type="hidden" id="interest2" name="interest2" >
			<input type="hidden" id="interest3" name="interest3" >
<script>
	var checkboxs = $("[name='interest']:checked");
	$("#interest1").val(checkboxs[0].value);
	$("#interest2").val(checkboxs[1].value);
	$("#interest3").val(checkboxs[2].value);
</script>
			<span>*관심사는 최대 3개까지 등록이 가능합니다. </span> <br><br>
			
			<div>국적선택</div>
			<div class="radio">
				
				<label> <input type="radio" name="optionsRadios" value="ko" <c:if test="${login.member_country =='ko'}"> checked</c:if>> 한국 </label> 
				<label> <input type="radio" name="optionsRadios" value="jp" <c:if test="${login.member_country =='jp'}"> checked</c:if>> 일본 </label> 
				<label> <input type="radio" name="optionsRadios" value="cn" <c:if test="${login.member_country =='cn'}"> checked</c:if>> 중국</label>
				
			</div><br>

			<div>연령선택</div>
				<input type="text" id="age0" name="minage" value="10">세 ~ 
				<input type="text" id="age1" name="maxage" value="40">세
			<div id="sliderRange" onclick="ageSlider()"></div><br>

			<div>이성만 보기</div>
			<div class="togglebutton" >
				<label><input type="checkbox" onclick="checkToggle()" checked> ON/OFF </label>
				<input type="hidden" id="toggle" name="toggle" value="1">
			</div><br>	
<script>
 function checkToggle(){
	 if($('#toggle').attr('value') == 1){
		 $('#toggle').attr('value', 0)
		 }
	 else if($('#toggle').attr('value') == 0){
 		$('#toggle').attr('value', 1)
 		}
 	}
</script>


			<h4>회원 리스트</h4>
			<ul class="nav nav-tabs">
			  <li role="presentation" class="active"><a href="#" onClick="return false;">검색결과</a></li>
			</ul>	
			<table>
				<tr>
						<div id="result"></div>
				</tr>		
			</table>
			
		</div>
</form>		
</body>
</html>
