<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	function memberDelete() {
		if (confirm("정말 탈퇴 하시겠습니까?")) {
			//alert("정상적으로 처리 되었습니다."); 
			location.href = '${pageContext.request.contextPath}/member/memberDelete.do';
			return true;
		} else {
			return false;
		}
	}
</script>
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
    width : 540px;
    border-bottom: 5px #DCDCDC solid;
   margin-top: 49px;
}

.changeBG:hover {
   background-color: #DCDCDC;
   color: white;
}
.active{
	cursor: default;
}

.widthSmall{
width:200px; 
}
#joinForm td:first-child{
/* border: 1px solid black; */
text-align: right;
margin: 30px;
padding: 30px;
width: 300px;
}
.thumb-image{
 width: 200px;
 height: 200px;
 border:1px dotted black;
 cursor:pointer;
 }
</style>
</head>
<body>
<ul class="myPageMenu">
  <li><a href="${pageContext.request.contextPath}/member/mypage.do" class="changeBG">마이 페이지</a></li>
  <li><a href="${pageContext.request.contextPath}/heart/heartFromList.do" class="changeBG">내 하트 내역</a></li>
  <li><a class="active" style="border-bottom: 5px #8B008B solid; font:bold;color:#8B008B;">내 회원정보</a></li>
  <li></li>
</ul>


<h3><i class="material-icons">account_circle</i>내 회원정보</h3>
<hr>
<table id="joinForm">
<tr>
<td>아이디 :</td><td>
 ${member.member_id}
</td>
</tr>
<tr>
<td>이름 :</td>
<td>${member.member_name}</td>
</tr>
<tr>
<td>생년월일:</td>
<td>
	<fmt:parseDate value="${member.member_birth }" pattern="yyyy-MM-dd" var="memberBirth" scope="page" />
	<fmt:formatDate value="${memberBirth}" pattern="yyyy/MM/dd" />
</td>
</tr>
<tr>
<td>닉네임:
</td>
<td>
${member.member_nickname}
</td>
</tr>
<tr>
<td>성별:
</td>
<td>
<c:if test="${member.member_sex == 1}">남</c:if>
<c:if test="${member.member_sex == 2}">여</c:if>
</td>
</tr>
<tr>
<td>국적:</td>
<td>
${member.member_country}
</td>
</tr>
<tr>
<td>관심사:</td>
<td>
<c:forEach items="${list}" var="interest">
<c:if test="${login.member_interest1 == interest.code_id or login.member_interest2 == interest.code_id or login.member_interest3 == interest.code_id}">${interest.code_name }</c:if>
</c:forEach> 
<input type="hidden" id="interestLength" >
<input type="hidden" id="member_interest1" name="member_interest1">
<input type="hidden" id="member_interest2" name="member_interest2">
<input type="hidden" id="member_interest3" name="member_interest3">
</td>
</tr>
<tr>
<td>자기소개:</td>
<td>
 ${member.member_introduction}
</td>
</tr>
</table>
<br><br>
	<div style="margin-left: 500px;">
	<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/memberUpdate.do'">회원 정보 수정</button>
	<button class="btn btn-white" onclick="memberDelete()">회원 탈퇴</button>
	</div>
</body>
</html>