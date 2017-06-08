<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Bridge Code</title>
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
	    	<a href="#" data-toggle="modal" data-target="#myModal">
	        	<div class="logo-container">
	                <div class="logo">
	                    <img src="${pageContext.request.contextPath}/resources/img/logo.png" 
	                    	alt="Creative Tim Logo" rel="tooltip" 
	                    	title="<b>Material Kit</b> was Designed & Coded with care by the staff from <b>Creative Tim</b>" 
	                    	data-placement="bottom" data-html="true">
	                </div>
	                <div class="brand">
	                	<c:set var="loginSession" value="${login}" />
  							<c:if test="${!empty loginSession }"> 
 								 ${login.member_nickname } 님 환영합니다!
 								 <a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
  							</c:if>
  							<c:if test="${empty loginSession }"> 
  	 							로그인 해주세요.
  							</c:if>
	                </div>
				</div>
	      	</a>
	    </div>

	    <div class="collapse navbar-collapse" id="navigation-index">
	    	<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="${pageContext.request.contextPath}/member/memberMatchingList.do" class="w3-bar-item w3-button">
						<i class="material-icons">dashboard</i> 회원매칭 </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/member/mypage.do" class="w3-bar-item w3-button">
						<i class="material-icons">unarchive</i> 마이페이지 </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/couple/couplepage.do"  class="w3-bar-item w3-button">
						<i class="material-icons">unarchive</i> 커플페이지 </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/notice/noticeList.do" class="w3-bar-item w3-button">
						<i class="material-icons">unarchive</i> 공지사항 </a>
				</li>
				<li>
					<a rel="tooltip" title="Follow us on Twitter" data-placement="bottom" href="https://twitter.com/CreativeTim" target="_blank" class="btn btn-white btn-simple btn-just-icon">
						<i class="fa fa-twitter"></i> </a>
				</li>
				<li>
					<a rel="tooltip" title="Like us on Facebook" data-placement="bottom" href="https://www.facebook.com/CreativeTim" target="_blank" class="btn btn-white btn-simple btn-just-icon">
						<i class="fa fa-facebook-square"></i> </a>
				</li>
				<li>
					<a rel="tooltip" title="Follow us on Instagram" data-placement="bottom" href="https://www.instagram.com/CreativeTimOfficial" target="_blank" class="btn btn-white btn-simple btn-just-icon">
						<i class="fa fa-instagram"></i> </a>
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
			<div class="modal-footer">
				<input type="submit" class="btn btn-info btn-simple" value="로그인">
			</div>
		</form>
	</div>
  </div>
</div>

</body>
</html>