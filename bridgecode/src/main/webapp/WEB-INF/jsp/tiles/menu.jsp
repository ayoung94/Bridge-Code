<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Bridge Code</title>
 <link href="${pageContext.request.contextPath}/resources/css/demo.css" rel="stylesheet" />
</head>
<body class="index-page">
<!-- Navbar -->
<nav class="navbar navbar-transparent navbar-fixed-top navbar-color-on-scroll">
	<div class="container">
        <div class="navbar-header">
	    	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-index">
	        	<span class="sr-only">Toggle navigation</span>
	        	<span class="icon-bar"></span>
	        	<span class="icon-bar"></span>
	        	<span class="icon-bar"></span>
	    	</button>
	    	
	        	<div class="logo-container">   
	        	<c:set var="loginSession" value="${login}" />
	        	<c:if test="${!empty loginSession }">  
	        	<div class="logo" style="height: 50px; border: none;">
	                <img src="${pageContext.request.contextPath}/profile_img/${login.member_profile_img}" style="height: 50px;">
			    </div>
	        	</c:if>
	        	 
	        	<c:if test="${empty loginSession }"> 
	        	<div class="logo" style="height: 50px; border: none;">
	                <img src="${pageContext.request.contextPath}/profile_img/logout.jpg" style="height: 50px;">
			    </div>
	        	</c:if>
	        	
	        	
	        	
	        	
	                <div class="brand" style="width: 300px;">
  							<c:if test="${!empty loginSession }"> 
  							
  							<!-- 알람 처리 시작 -->
  							  <c:forEach var="heartto" items="${heartto}" varStatus="i">
		       				  <c:set var="heartcount" value="${i.count}" />
		  					   </c:forEach>
  							<!-- 알람처리 끝 -->
 								 ${login.member_nickname } 님 
 								 
 							<!-- 알람 뱃지 시작 -->
 								 <c:if test="${!empty heartcount }"> 
 								 <span class="w3-badge w3-tiny w3-red">${heartcount}</span>
 								 </c:if>
 							<!-- 알람 뱃지 끝 -->	 
 								 
 								 <br>
 								 <a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
 								<c:if test="${login.member_id == 'admin'}">
 								 <a href="${pageContext.request.contextPath}/goAdminMain.do">관리자페이지</a>
 								</c:if>
  							</c:if>
  							<c:if test="${empty loginSession }"> 

  	 							<a href="#" data-toggle="modal" data-target="#myModal">
  	 							로그인 해주세요.
  	 							</a>
  							</c:if>
	             </div>
				</div>

	    </div>

	    <div class="collapse navbar-collapse" id="navigation-index">
	    	<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="${pageContext.request.contextPath}/" class="w3-bar-item w3-button">
						Bridge Code </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/matching/memberMatchingList.do" class="w3-bar-item w3-button">
						<i class="material-icons">wc</i> <spring:message code="회원매칭" /> </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/member/mypage.do" class="w3-bar-item w3-button">
						<i class="material-icons">perm_contact_calendar</i>  <spring:message code="마이페이지" /> </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/couple/couplepage.do"  class="w3-bar-item w3-button">
						<i class="material-icons">favorite</i>  <spring:message code="커플페이지" /> </a>
				</li>
				
				<li class="dropdown">
        			
        			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="material-icons">description</i> <spring:message code="게시판" /><b class="caret"></b></a>
        			<ul class="dropdown-menu">
					  <li><a href="${pageContext.request.contextPath}/getNoticeList.do"> <spring:message code="공지사항" /></a></li>
					  <li><a href="${pageContext.request.contextPath}/getEventList.do"> <spring:message code="이벤트" /></a></li>
        			</ul>
        		</li>
				
		<%-- 		
				<li>
					<a href="${pageContext.request.contextPath}/notice/noticeList.do" class="w3-bar-item w3-button">
						<i class="material-icons">unarchive</i> 공지사항 </a>
				</li> --%>
				
				
				<li class="dropdown">
        			<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <spring:message code="language" /><b class="caret"></b></a>
        			<ul class="dropdown-menu">
					  <li><a href="${pageContext.request.contextPath}/?language=ko"><img src="${pageContext.request.contextPath}/resources/img/flags/KR.png"/>Korea</a></li>
					  <li><a href="${pageContext.request.contextPath}/?language=cn"><img src="${pageContext.request.contextPath}/resources/img/flags/CN.png"/>China</a></li>
					  <li><a href="${pageContext.request.contextPath}/?language=jp"><img src="${pageContext.request.contextPath}/resources/img/flags/JP.png"/>Japan</a></li>
        			</ul>
        		</li>
				
	    	</ul>
	    	
	    </div>
	</div>
</nav>
<!-- End Navbar -->

<!-- Modal Core(로그인) -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">로그인</h4>
      </div>
		<form action="${pageContext.request.contextPath}/login.do" method="post">
			<div class="modal-body">
				<div class="input-group">
					<span class="input-group-addon"> <i class="material-icons">email</i>
					</span> <input type="text" class="form-control" placeholder="Email..." name="member_id">
				</div>
				<div class="input-group">
					<span class="input-group-addon"> <i class="material-icons">lock_outline</i>
					</span> <input type="password" placeholder="Password..." name="member_password" class="form-control" />
				</div>
			</div>
			<div style="margin-left: 30px;">
			<a href="${pageContext.request.contextPath}/member/passwordMissing.do">비밀번호를 잊으셨나요?</a><br>
			<a href="${pageContext.request.contextPath}/member/memberInsert.do">저희 사이트를 처음 이용하시나요?</a>
			</div>
			<div class="modal-footer">
				<input type="submit" class="btn btn-info btn-simple" value="로그인">
			</div>
		</form>
	</div>
  </div>
</div>

</body>
</html>