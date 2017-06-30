<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Roboto", sans-serif
}

a {
	text-decoration: none;
}

.fontC {
	text-align: center;
}
</style>
<style>
.right {
	float: right;
	margin: 20px;
}
</style>
<script src="//www.google.com/jsapi"></script>
<script type="text/javascript"
	src="./resources/adminjs/jquery-3.2.1.min.js" /></script>
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
					charData.addRow(arr);
				}
				//2. 차트옵션
				var options = {
					title : '전체 유저의 성비',
					width : 280,
					height : 250
				};
				chart.draw(charData, options);
			} else {
				alert("오류!!!");
			}
		});


		var chart1 = new google.visualization.PieChart(document
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
					charData.addRow(arr2);
				}
				//2. 차트옵션
				var options = {
					title : '국가별 인원수',
					width : 280,
					height : 250
				};
				chart1.draw(charData, options);
			} else {
				alert("오류!!!");
			}
		});

		var chart2 = new google.visualization.ColumnChart(document
				.querySelector('#monthRatio_div'));
		$.getJSON("monthRatio.do", function(data, status) {
			if (status == "success") {
				console.dir(data);
				//1. 차트 데이터 
				var charData = new google.visualization.DataTable();
				charData.addColumn('string', '월');
				charData.addColumn('number', '가입자수');
				for (i = 0; i < data.length; i++) {
					var arr3 = [ data[i].MONTH, data[i].COUNT ];
					console.log(arr3);
					charData.addRow(arr3);
				}
				//2. 차트옵션
				var options = {
					title : '월별 가입자수',
					width : 280,
					height : 250
				};
				chart2.draw(charData, options);
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

	<br>
	<br>
	<br>
	<br>
	<div class="row">
		<div class="col-lg-1 col-md-3 col-sm-3"></div>
		<div class="col-lg-3 col-md-6 col-sm-6">
			<div class="card card-stats">
				<div class="card-header" data-background-color="orange">
					<i class="material-icons">face</i>
				</div>
				<div class="card-content">
					<p class="category">회원가입 List</p>
					<h3 class="title">${countUserApplication}<small>명</small>
					</h3>
				</div>
				<div class="card-footer">
					<div class="stats">
						<i class="material-icons">description</i> <a
							href="${pageContext.request.contextPath}/getUserList.do?member_level=1">회원
							신청 처리</a>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 col-sm-6">
			<div class="card card-stats">
				<div class="card-header" data-background-color="red">
					<i class="material-icons">report_problem</i>
				</div>
				<div class="card-content">
					<p class="category">신고처리</p>
					<h3 class="title">${count}<small>건</small>
					</h3>
				</div>
				<div class="card-footer">
					<div class="stats">
						<i class="material-icons">description</i> <a
							href="${pageContext.request.contextPath}/getWarningList.do">신고
							내역 처리</a>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 col-sm-6">
			<div class="card card-stats">
				<div class="card-header" data-background-color="blue">
					<i class="material-icons">group</i>
				</div>
				<div class="card-content">
					<p class="category">총 회원수</p>
					<h3 class="title">${countAllUser}<small>명</small></h3>
				</div>
				<div class="card-footer">
					<div class="stats">
						<i class="material-icons">update</i> <a
							href="${pageContext.request.contextPath}/getUserList.do?member_level=2">유저 리스트</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 차트 부분 -->
	<div class="row">
		<div class="col-md-4">
			<div class="card">
				<div class="card-header card-chart" style="background-color: white;">
					<div id="sexRatio_div"
						style="width: 285px; height: 252px; display: inline-block;"></div>
				</div>
				<div class="card-content">
					<h4 class="title fontC">전체 유저 성비</h4>
				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="card">
				<div class="card-header card-chart" style="background-color: white;">
					<div id="countryRatio_div"
						style="width: 285px; height: 252px; display: inline-block;"></div>
				</div>
				<div class="card-content">
					<h4 class="title fontC">국가별 인원 수</h4>
				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="card">
				<div class="card-header card-chart" style="background-color: white;">
					<div id="monthRatio_div"
						style="width: 285px; height: 252px; display: inline-block;"></div>
				</div>
				<div class="card-content">
					<h4 class="title">월별 가입자수</h4>
				</div>
			</div>
		</div>
</body>
</html>