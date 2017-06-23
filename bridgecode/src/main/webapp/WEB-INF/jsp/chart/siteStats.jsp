<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체 회원 대비 성비</title>
<script src="//www.google.com/jsapi"></script>
<script src="./scripts/jquery-3.1.1.min.js"></script>
<script>
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	google.setOnLoadCallback(function() {
		var chart = new google.visualization.PieChart(document
				.querySelector('#chart_div'));
		$.ajax("/sexRatio.do", function(data, status) {
			if(status == "success") {
			//1. 차트 데이터 
			var charData = new google.visualization.DataTable();
			charData.addColumn('SEX', '성');
			charData.addColumn('NUMBER', '인원수');
			for(i=0;i<data.length;i++) {
				var arr = [HUMAN, NUMBER_SEX];
				//charData.push(arr);
				charData.addRow(arr);
			}	
			/* //2. 차트옵션
			var options = {
				title : '부서별 인원수',
				width : 600,
				height : 500
			}; */

			//chart.draw(google.visualization.PieChart(document.getElementById('piechart'));
			chart.draw(charData, options);
			}
		});

	});
</script>
</head>
<body>
	<div id="chart_div"></div>
</body>
</html>