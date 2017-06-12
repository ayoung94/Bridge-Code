<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<style>	
ul, menu, dir {
    display: inline-block;
    list-style-type: disc;
    -webkit-margin-before: 0px;
    -webkit-margin-after: 0px;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 0px;
}
#subimg li {
	list-style: none;
	display: inline-block;
}

#subimg img {
	height: 150px;
	display: inline-block;
}
</style>
<title>Profile Page - Material Kit by Creative Tim</title>
</head>
<body class="profile-page">

	<div class="wrapper">

		<div class="main main-raised">
			<div class="profile-content">
				<div class="container">
					<div class="row">
						<div class="profile">
							<div class="avatar">
								<img style="max-width: 180px; margin: -80px auto 0;"
									src="${pageContext.request.contextPath}/resources/img/1474435596-90-org.jpg"
									class="img-circle img-responsive img-raised">
							</div>
							<div class="name">
								<h3 class="title" style="text-align: center">${profile.member_nickname }(${profile.member_country})</h3>
								<h5 style="text-align: center">
									<!-- 나이 처리 시작-->
									<jsp:useBean id="toDay" class="java.util.Date" />
									<fmt:formatDate value="${toDay}" pattern="yyyy" var="date" />

									<fmt:parseDate value="${profile.member_birth }"
										pattern="yyyy-mm-dd" var="memberBirth" scope="page" />
									<fmt:formatDate value="${memberBirth}" pattern="yyyy"
										var="birth" />
									<!-- 나이 처리 끝 -->
									${date - birth +1}세
								</h5>
								<h6 style="text-align: center">자기소개란</h6>
							</div>
						</div>
					</div>
					<div class="description text-center"
						style="width: 700px; height: 200px; display: center;">
						<textarea class="form-control"
							placeholder="${profile.member_introduction }" rows="3" cols="5"></textarea>
						<a href="#">수정하기</a>
					</div>

					<div>
						<div class="col-md-6 col-md-offset-3">
							<div class="nav-align-center">
								<ul id="subimg">
									<li><a href=""><img	src="${pageContext.request.contextPath}/resources/img/examples/chris7.jpg" /></a></li>
									<li><a href=""><img src="${pageContext.request.contextPath}/resources/img/examples/chris5.jpg" /></a></li>
									<li><a href=""><img src="${pageContext.request.contextPath}/resources/img/examples/chris9.jpg" /></a></li>
								</ul>
								<ul class="nav nav-pills">
									<li><a href="${pageContext.request.contextPath}/heart/heartInsert.do?id=${profile.member_id}">
											<i class="material-icons">favorite</i> 하트보내기
									</a></li>
								</ul>


							</div>
							<!-- End Profile Tabs -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
