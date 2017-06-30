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
					width : 450,
					height : 380
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
					width : 450,
					height : 380
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
				charData.addColumn('number', '하트 수');
				for (i = 0; i < data.length; i++) {
					var arr3 = [ data[i].MONTH, data[i].COUNT ];
					console.log(arr3);
					charData.addRow(arr3);
				}
				//2. 차트옵션
				var options = {
					title : '월별 하트 사용 수',
					width : 450,
					height : 380
				};
				chart2.draw(charData, options);
			} else {
				alert("오류!!!");
			}
		});

		var chart3 = new google.visualization.ColumnChart(document
				.querySelector('#monthCoupleRatio_div'));
		$.getJSON("monthCoupleRatio.do", function(data, status) {
			if (status == "success") {
				console.dir(data);
				//1. 차트 데이터 
				var charData = new google.visualization.DataTable();
				charData.addColumn('string', '월');
				charData.addColumn('number', '커플 수');
				for (i = 0; i < data.length; i++) {
					var arr3 = [ data[i].MONTH, data[i].COUPLECOUNT ];
					console.log(arr3);
					charData.addRow(arr3);
				}
				//2. 차트옵션
				var options = {
					title : '월별 커플 성사 수',
					width : 450,
					height : 380
				};
				chart3.draw(charData, options);
			} else {
				alert("오류!!!");
			}
		});

		var chart4 = new google.visualization.ColumnChart(document
				.querySelector('#monthCoupleRatio_div'));
		$.getJSON("monthCoupleRatio.do", function(data, status) {
			if (status == "success") {
				console.dir(data);
				//1. 차트 데이터 
				var charData = new google.visualization.DataTable();
				charData.addColumn('string', '전체 유저 수');
				charData.addColumn('number', '수');
				charData.addColumn('string', '');
				for (i = 0; i < data.length; i++) {
					var arr3 = [ data[i].MONTH, data[i].COUPLECOUNT ];
					console.log(arr3);
					charData.addRow(arr3);
				}
				//2. 차트옵션
				var options = {
					title : '월별 커플 성사 수',
					width : 450,
					height : 380
				};
				chart4.draw(charData, options);
			} else {
				alert("오류!!!");
			}
		});
	});
</script>
</head>
<body>
	<div class="col-md-12">
		<div class="card card-plain">
			<div class="card-header" data-background-color="purple">
				<h4 class="title">사이트 통계</h4>
				<p class="category">사이트 DB를 활용한 통계 결과물입니다.</p>
			</div>
			<div class="card-content table-responsive">
				<div id="sexRatio_div"
					style="width: 455px; height: 400px; display: inline-block;"></div>
				<div id="countryRatio_div"
					style="width: 455px; height: 400px; display: inline-block;"></div>
				<div id="monthRatio_div"
					style="width: 455px; height: 400px; display: inline-block;"></div>
				<div id="monthCoupleRatio_div"
					style="width: 455px; height: 400px; display: inline-block;"></div>
			</div>
		</div>
	</div>
</body>
</html>