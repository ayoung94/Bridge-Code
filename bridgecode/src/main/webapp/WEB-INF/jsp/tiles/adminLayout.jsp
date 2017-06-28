<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
 
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
<%-- <link href="${pageContext.request.contextPath}/resources/css/material-kit.css" rel="stylesheet"/> --%>
<link href="${pageContext.request.contextPath}/resources/css/material-dashboard.css" rel="stylesheet"/>
  
<%--                 
<script src="${pageContext.request.contextPath}/resources/adminjs/jquery-3.2.1.min.js" type="text/javascript"></script> --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/material.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/chartist.min.js"></script>  --%>
<script src="${pageContext.request.contextPath}/resources/js/material-dashboard.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
  
</head>
<body>

          <div class="wrapper"> 

	    <div class="sidebar" data-color="purple" >

			<div class="logo">
				<a href="${pageContext.request.contextPath}/" class="simple-text">
					BridgeCode
				</a>
			</div>

	    	<div class="sidebar-wrapper">
	            <ul class="nav">
	                <li class="active">  
	                    <a href="${pageContext.request.contextPath}/goAdminMain.do">
	                        <i class="material-icons">dashboard</i>
	                        <p>관리자 페이지</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath}/getUserList.do?member_level=1">
	                        <i class="material-icons">person</i>
	                        <p>새로 가입한 회원</p>
	                    </a>
	                </li>
	                <li> 
	                    <a href="${pageContext.request.contextPath}/getWarningList.do">
	                        <i class="material-icons">content_paste</i>
	                        <p>비매너 신고 현황</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath}/getNoticeList.do">
	                        <i class="material-icons">library_books</i>
	                        <p>공지사항</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath}/getEventList.do">
	                        <i class="material-icons">bubble_chart</i>
	                        <p>이벤트</p> 
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath}/getUserList.do?member_level=2">
	                        <i class="material-icons">location_on</i>
	                        <p>유저 리스트</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath}/Ratioview.do">
	                        <i class="material-icons text-gray">notifications</i>
	                        <p>사이트 통계</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
	    </div>

	    <div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute"></nav>


			
			<div> 
			<tiles:insertAttribute name="content"/> 	
			</div> 

			<footer class="footer">
			<hr>
				<div class="container-fluid">
					<hr>
					<p class="copyright pull-right">
						&copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
					</p>
				</div>
			</footer>
		</div> 
	</div> 
          
</body>
</html>