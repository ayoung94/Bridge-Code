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
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Roboto", sans-serif
}

a {
	text-decoration: none;
}
</style>
<style>
.right {
	float:right;
	margin:20px;
}
</style>
<script src="//www.google.com/jsapi"></script>
<script type="text/javascript" src="./resources/adminjs/jquery-3.2.1.min.js"/></script>
<script>
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	google.setOnLoadCallback(function() {
		var chart = new google.visualization.PieChart(document
				.querySelector('#sexRatio_div'));
		$.getJSON("sexRatio.do", function(data, status) {
			if (status == "success") {
				console.dir(data);
				//1. 차트 데이터 
				var charData = new google.visualization.DataTable();
				charData.addColumn('string', '성');
				charData.addColumn('number', '인원수');
				for (i = 0; i < data.length; i++) {
					var arr = [ data[i].MEMBER_SEX, data[i].HUMANNUM ];
					console.log(arr);
					//charData.push(arr);
					charData.addRow(arr);
				}
				//2. 차트옵션
				var options = {
					title : '전체 유저의 성비',
					width : 420,
					height : 250
				};
				//chart.draw(google.visualization.PieChart(document.getElementById('piechart'));
				chart.draw(charData, options);
			} else {
				alert("오류!!!");
			}
		});
	});
</script>
<script>
google.load('visualization', '1.0', {
	'packages' : [ 'corechart' ]
});
google.setOnLoadCallback(function() {
	var chart = new google.visualization.PieChart(document
			.querySelector('#countryRatio_div'));
	$.getJSON("countryRatio.do", function(data, status) {
		if (status == "success") {
			console.dir(data);
			//1. 차트 데이터 
			var charData = new google.visualization.DataTable();
			charData.addColumn('string', '국적');
			charData.addColumn('number', '인원수');
			for (i = 0; i < data.length; i++) {
				var arr2 = [ data[i].COUNTRY, data[i].HUMANNUM ];
				console.log(arr2);
				//charData.push(arr);
				charData.addRow(arr2);
			}
			//2. 차트옵션
			var options = {
				title : '국가별 인원수',
				width : 420,
				height : 250
			};
			//chart.draw(google.visualization.PieChart(document.getElementById('piechart'));
			chart.draw(charData, options);
		} else {
			alert("오류!!!");
		}
	});
});
</script>
<script>
function goChart(){
	location.href="Ratioview.do"
}


</script>
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
          <p><a href="${pageContext.request.contextPath}/">HOME</a></p>
          <p><a href="getUserList.do?member_level=1">새로운 회원 신청 현황</a></p>
          <p><a href="getWarningList.do">비매너 신고 현황</a></p>
          <p><a href="getNoticeList.do">공지사항</a></p>
          <p><a href="getEventList.do">이벤트</a></p>
          <p><a href="getUserList.do?member_level=2">유저 리스트</a></p>
          <p><a href="Ratioview.do">Site 통계</a></p>
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
        <h2 class="w3-text-grey w3-padding-16" style="width:600px; display:inline-block;"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Homepage management</h2>
        <button class="w3-button w3-xlarge w3-circle w3-disabled right" onclick="goChart()">+</button>
        <div class="w3-container">
         	<div id="sexRatio_div" style="width:420px; height:252px; display:inline-block;"></div>
			<div id="countryRatio_div" style="width:420px; height:252px; display:inline-block;"></div>
        </div>
      </div>
      
    <!-- End Right Column -->
    </div>
  
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->
</div>
</body>
</html>
