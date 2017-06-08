<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Bridge Code</title>
</head>
<body>

 
  <div id="id01" class="w3-modal" >
    <div class="w3-modal-content w3-animate-top w3-card-4" style="height: 400px; width: 300px;">
      <header class="w3-container w3-pupple"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>로그인</h2>
      </header>
      <div class="w3-container" style="height: 300px;">
        	<form action="${pageContext.request.contextPath}/login.do" method="post">
        	아이디 <input type="text" name="member_id"><br>
        	비밀번호<input type="password" name="member_password"><br>
        	<button>로그인</button><br>
        	</form>
      </div>
      <div class="w3-container w3-teal">
        <p>bridge code</p>
      </div>
    </div>
  </div>
  
	
  <div class="w3-bar w3-white w3-padding w3-card-2" style="letter-spacing:1px;">
  <c:set var="loginSession" value="${login}" />
  <c:if test="${!empty loginSession }"> 
 	 ${login.member_id } 님 환영합니다! <a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
  </c:if>
  <c:if test="${empty loginSession }"> 
  	 <a href="#" onclick="document.getElementById('id01').style.display='block'" >로그인 해주세요.</a>
  </c:if>
    <div class="w3-right w3-hide-small">
      <a href="${pageContext.request.contextPath}/member/memberMatchingList.do" class="w3-bar-item w3-button">회원매칭</a>
      <a href="${pageContext.request.contextPath}/member/mypage.do" class="w3-bar-item w3-button">마이페이지</a>
      <a href="${pageContext.request.contextPath}/couple/couplepage.do" class="w3-bar-item w3-button">커플페이지</a>
      <a href="${pageContext.request.contextPath}/notice/noticeList.do" class="w3-bar-item w3-button">공지사항</a>
    </div>
  </div>

</body>
</html>