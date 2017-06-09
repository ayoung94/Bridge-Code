<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<style>
#subimg li{ list-style:none; }
#subimg img{
		height:150px;
		display:inline-block;
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
									<img style=" max-width:180px; margin:-80px auto 0;"				
										src="${pageContext.request.contextPath}/resources/img/1474435596-90-org.jpg"
										class="img-circle img-responsive img-raised" >
								</div>
								<div class="name">
									<h3 class="title" style="text-align:center">${profile.member_nickname }(${profile.member_country})</h3>
									<h5 style="text-align: center">${profile.member_birth }</h5>
									<h6 style="text-align: center">자기소개란</h6>
								</div>
							</div>
						</div>
						<div class="description text-center" style="width:700px; height:200px; display:center;">
							<textarea class="form-control" placeholder="${profile.member_introduction }" rows="3" cols="5"></textarea> <a href="#" >수정하기</a>						
						</div>

						<div class="row">
							<div class="col-md-6 col-md-offset-3">
									<div class="nav-align-center">
											<ul class="row" id="subimg">
												<li><a href=""><img src="${pageContext.request.contextPath}/resources/img/examples/chris7.jpg"/></a></li>
												<li><a href=""><img src="${pageContext.request.contextPath}/resources/img/examples/chris5.jpg"/></a></li>
												<li><a href=""><img src="${pageContext.request.contextPath}/resources/img/examples/chris9.jpg"/></a></li>
											</ul>	
										<ul class="nav nav-pills">
											<li><a href="${pageContext.request.contextPath}/heart/heartInsert.do?id=${profile.member_id}"> <i
													class="material-icons">favorite</i> 하트보내기
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
