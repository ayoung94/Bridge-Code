<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>

<style>
    .modal-backdrop {
        z-index: -1;
    }

#form-control {
	width : 50%;
	height: 50px;	
	margin : 0 auto;
	text-align: center;
}
ul, menu, dir {
    display: inline-block;
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
								<br>
								<h6 style="text-align: center">자기소개란</h6>
							</div>
						</div>
					</div>
					<div class="description text-center">
						<textarea id="form-control" class="form-control"	
							placeholder="${profile.member_introduction }" rows="2" cols="3"></textarea>
							<c:set var="loginSession" value="${login}" />
							<c:if test="${loginSession.member_id == profile.member_id }">
								<a href="#">수정하기</a>
							</c:if>			
						
					</div><br>

<script>
$(function(){
	$('#profileModal').on('show.bs.modal', function(event) {
		var button =$(event.relatedTarget)
		var recipient = button.data('whatever')
		
		var modal = $(this)
		modal.find('#img').val(recipient)
	})
})

</script>				
					<div>
						<div class="col-md-6 col-md-offset-3">
							<div class="nav-align-center">	
								<ul id="subimg">	
								  <c:if test="${loginSession.member_id == profile.member_id }">
									<c:set var="subimg"	value="${profile }"	/>	
										<c:if test="${empty subimg.member_img1 }">
											<li><a href="#" data-toggle="modal" data-target="#profileModal" data-whatever="img1"> <img src="${pageContext.request.contextPath}/resources/img/examples/addimage.png"  class="img-thumbnail"/></a></li>
										</c:if>
										<c:if test="${empty subimg.member_img2 }">
											<li><a href="#" data-toggle="modal" data-target="#profileModal" data-whatever="img2"> <img src="${pageContext.request.contextPath}/resources/img/examples/addimage.png"  class="img-thumbnail"/></a></li>
										</c:if>
										<c:if test="${empty subimg.member_img3 }">
											<li><a href="#" data-toggle="modal" data-target="#profileModal" data-whatever="img3"> <img src="${pageContext.request.contextPath}/resources/img/examples/addimage.png"  class="img-thumbnail"/></a></li>
										</c:if>
										<c:if test="${!empty subimg.member_img1 }">
											<li><a href="#" data-toggle="modal" data-target="#profileModal" data-whatever="img1"> <img src="${pageContext.request.contextPath}/profile_img/${ profile.member_img1}" class="img-thumbnail"/></a></li>
										</c:if>	
										<c:if test="${!empty subimg.member_img2 }">
											<li><a href="#" data-toggle="modal" data-target="#profileModal" data-whatever="img2"> <img src="${pageContext.request.contextPath}/profile_img/${ profile.member_img2}" class="img-thumbnail"/></a></li>
										</c:if>
										<c:if test="${!empty subimg.member_img3 }">
											<li><a href="#" data-toggle="modal" data-target="#profileModal" data-whatever="img3"> <img src="${pageContext.request.contextPath}/profile_img/${ profile.member_img3}" class="img-thumbnail"/></a></li> --%>
										</c:if>		
									</c:if>	
									
									<c:if test="${loginSession.member_id != profile.member_id }">
									<c:set var="subimg"	value="${profile }"	/>	
										<c:if test="${empty subimg.member_img1 }">
											<li><img src="${pageContext.request.contextPath}/resources/img/examples/addimage.png"  class="img-thumbnail"/></a></li>
										</c:if>
										<c:if test="${empty subimg.member_img2 }">
											<li><img src="${pageContext.request.contextPath}/resources/img/examples/addimage.png"  class="img-thumbnail"/></a></li>
										</c:if>
										<c:if test="${empty subimg.member_img3 }">
											<li><img src="${pageContext.request.contextPath}/resources/img/examples/addimage.png"  class="img-thumbnail"/></a></li>
										</c:if>
										<c:if test="${!empty subimg.member_img1 }">
											<li><img src="${pageContext.request.contextPath}/profile_img/${ profile.member_img1}" class="img-thumbnail"/></a></li>
										</c:if>	
										<c:if test="${!empty subimg.member_img2 }">
											<li><img src="${pageContext.request.contextPath}/profile_img/${ profile.member_img2}" class="img-thumbnail"/></a></li>
										</c:if>
										<c:if test="${!empty subimg.member_img3 }">
											<li><img src="${pageContext.request.contextPath}/profile_img/${ profile.member_img3}" class="img-thumbnail"/></a></li> --%>
										</c:if>		
									</c:if>	
																
								  </ul>

								<ul class="nav nav-pills">
									<li><a href="${pageContext.request.contextPath}/heart/heartInsert.do?id=${profile.member_id}">
											<i class="material-icons">favorite</i> 하트보내기
									</a></li>
								</ul>


							</div>
							<!-- End Profile Tabs -->
							<!-- Modal Core -->
							<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
								aria-labelledby="profileModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="profileModalLabel">프로필 상세보기</h4>
										</div>
										<form action="${pageContext.request.contextPath}/profile/profileUpdate.do?"
													method="post" enctype="multipart/form-data">
											<div class="modal-body">
												
													<label for="img" ><input type="hidden" id="img" name="img"></label><br>
													프로필 사진: <input type="file" name="uploadFile"><br>
												
											</div>
											<div class="modal-footer">
												<!-- <input type="button" class="btn btn-default btn-simple"	data-dismiss="modal" value="취소"> -->
												<input type="submit" class="btn btn-info btn-simple" value="사진등록">
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- Modal Core end-->	
						</div>
					</div>
				</div>
			</div>
			
 	</div> 
</body>
</html>
