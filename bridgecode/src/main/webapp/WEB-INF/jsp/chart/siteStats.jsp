<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체 회원 대비 성비</title>
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
					width : 500,
					height : 400
				};
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
					charData.addRow(arr2);
				}
				//2. 차트옵션
				var options = {
					title : '국가별 인원수',
					width : 500,
					height : 400
				};
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
		var chart = new google.visualization.ColumnChart(document
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
					width : 600,
					height : 500
				};
				chart.draw(charData, options);
			} else {
				alert("오류!!!");
			}
		});
	});
</script>
</head>
<body>
	<h1>Site 통계</h1>
	<div id="sexRatio_div"
		style="width: 500px; height: 450px; display: inline-block;"></div>
	<div id="countryRatio_div"
		style="width: 500px; height: 450px; display: inline-block;"></div>
	<div id="monthRatio_div"
		style="width: 600px; height: 400px; display: inline-block;"></div>
</body>
</html>