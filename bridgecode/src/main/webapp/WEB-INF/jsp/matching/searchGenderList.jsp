<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td {
	margin:0px;
	padding:0px;
}

.thumbnail img{
	widht:350px;
	height:250px;
}

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
    width : 700px;
    border-bottom: 5px #DCDCDC solid;
    margin-top: 48px;
}

.changeBG:hover {
   background-color: #DCDCDC;
   color: white;
}
.active{
	cursor: default;
}
a:hover {
	weight: bold;
	text-decoration: none;
}
p {
	margin: 0px;
	text-align: center;
}
.thumbnail {
	color: black;
	box-shadow:2px 2px 2px #e6e6e6;
}
.thumbnail :hover {
	transform:scale(1.01, 1.03);
}
button {
	width:100%; 
}
</style>
</head>
<body>
	<div class="wrapper">
		<ul class="myPageMenu">
			<li><a href="${pageContext.request.contextPath}/matching/memberMatchingList.do"
				class="changeBG"><spring:message code='회원매칭'/></a></li>
			<li><a href="${pageContext.request.contextPath}/matching/searchGenderList.do?member_sex=${login.member_sex}"
				class="active" style="border-bottom: 5px #8B008B solid; font:bold;color:#8B008B;"><spring:message code='이성회원보기'/></a></li>
			<li><a href="${pageContext.request.contextPath}/matching/allmemberList.do"
				class="changeBG" style="text-align: left;"><spring:message code='전체회원보기'/></a></li>
			<li></li>
		</ul>
		<table>
			<tr>
				<%	int j = 0;	%>
				<c:forEach var="memberlist" items="${list}" end="8">
					<td class="col-md-4"><a class="thumbnail" href="${pageContext.request.contextPath}/matching/memberSelect.do?id=${memberlist.member_id}">
							<img src="${pageContext.request.contextPath}/profile_img/${memberlist.member_profile_img}" class="thumb-image"><br>
							<p style='font-size:18px; font-weight:bold;'>${memberlist.member_nickname}</p>
							<p>${memberlist.member_birth}<spring:message code='세'/></p>
							<c:if test="${memberlist.member_sex == '1' }"><p><spring:message code='남성'/></p></c:if>
							<c:if test="${memberlist.member_sex == '2' }"><p><spring:message code='여성'/></p></c:if>
 							<br></a>
					</td>
						<%	j++;
							if (j % 3 == 0 ) {
							out.print("</tr><tr>");
								}
						%>
				</c:forEach>
			<tr>
		</table>
		<td><button onclick="moreList()" class='btn btn-primary' id="morebtn"><spring:message code='더많은회원보기'/> </button></td>
<script>
function moreList(){
	var Cnt = $(".thumb-image");
	var j =0;
	console.log("갯수"+Cnt.length);
 	$.getJSON("${pageContext.request.contextPath}/matching/ajaxsearchGenderList.do?member_sex=${login.member_sex}", function(data, status){
 		if(status == "success") {
 			if( data.length > 0) {
 				console.log(data.length);
 				if(Cnt.length >= data.length){
					$('#morebtn').hide();
					alert("<spring:message code='마지막회원입니다.'/>")
					 }
				for(i=Cnt.length ; i< Cnt.length+9 ; i++){
					if(data[i].MEMBER_SEX == '1'){
						$("tbody").append("<td class='col-md-4'><a class='thumbnail' href='${pageContext.request.contextPath}/matching/memberSelect.do?id="
					    		+data[i].MEMBER_ID+"'><img src='${pageContext.request.contextPath}/profile_img/"
						    	+data[i].MEMBER_PROFILE_IMG + "' class='thumb-image'><p style='font-size:18px; font-weight:bold;'><br>"
		      		    		+data[i].MEMBER_NICKNAME +"</p><p>"
		      		    		+data[i].MEMBER_BIRTH+" <spring:message code='세'/></p>"
						    		+"<p><spring:message code='남성'/></p></a><br></td>") }
					else {
				    		$('tbody').append("<td class='col-md-4'><a class='thumbnail' href='${pageContext.request.contextPath}/matching/memberSelect.do?id="
						    	+data[i].MEMBER_ID+"'><img src='${pageContext.request.contextPath}/profile_img/"
						    	+data[i].MEMBER_PROFILE_IMG + "' class='thumb-image'><p style='font-size:18px; font-weight:bold;'><br>"
		      		    		+data[i].MEMBER_NICKNAME +"</p><p>"
		      		    		+data[i].MEMBER_BIRTH+" <spring:message code='세'/></p>"
						    		+"<p><spring:message code='여성'/></p></a><br></td>")  }
					j++;
					if(j%3 == 0){  $('tbody').append("</tr><tr>")
		    		}
			}	}
			} else {
	            alert("등록에러");
	        }
  });
  return false;    //event.preventDefault()
};
</script>
	</div>
</body>
</html>