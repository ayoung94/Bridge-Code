<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
a {
  text-decoration: none;
}
</style>
<body class="w3-light-grey">

<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-quarter">
    
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
          <img src="${pageContext.request.contextPath}/resources/img/Admin-icon2.png" style="width:100%" alt="Avatar">
          <div class="w3-display-bottomleft w3-container w3-text-black">
            <h2>Admin</h2>
          </div>
        </div>
        <div class="w3-container">
          <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Menu</b></p>
          <p><a href="getUserList.do?member_level=1">새로운 회원 신청 현황</a></p>
          <p><a href="getWarningList.do">비매너 신고 현황</a></p>
          <p><a href="getNoticeList.do">공지사항</a></p>
          <p><a href="getEventList.do">이벤트</a></p>
          <p><a href="getUserList.do?member_level=2">유저 리스트</a></p>
          <p>Site 통계</p>
        </div>
      </div><br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-threequarter">
      <div class="w3-container w3-card-2 w3-white w3-margin-bottom">
        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>회원 관리</h2>
        <div class="w3-container">
          <h5 class="w3-opacity"><b><a href="getUserList.do?member_level=1">새로운 회원 신청 ${countUserApplication}건</a></b></h5>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b><a href="getWarningList.do">신고 ${count}건</a></b></h5>
          <hr>
        </div>
      </div>
      <div class="w3-container w3-card-2 w3-white">
        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Homepage management</h2>
        <div class="w3-container">
          <h5 class="w3-opacity"><b><a href="getNoticeList.do">공지사항</a></b></h5>
           <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b><a href="getEventList.do">이벤트</a></b></h5>
           <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b><a href="getUserList.do?member_level=2">유저 리스트</a></b></h5>
           <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>Site 통계</b></h5>
           <hr>
        </div>
      </div>

    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->
</div>

<footer class="w3-container w3-teal w3-center w3-margin-top">
  <p>Find me on social media.</p>
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>

</body>
</html>
