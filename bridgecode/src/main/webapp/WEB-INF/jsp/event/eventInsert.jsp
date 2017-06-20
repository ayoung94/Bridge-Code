<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Event Register</title>
<script>
	function getEventList() {
		location.href = "getEventList.do"
	}
</script>
</head>
<body>
	<form class="w3-container w3-card-4" action="eventInsert.do"
		method="post" style="width: 80%; margin: auto;">
		<h2 class="w3-text-blue">Event Register</h2>
		<p>
			<label class="w3-text-blue"><b>제목</b></label> <input
				class="w3-input w3-border" name="eventTitle" type="text">
		</p>
		<p>
			<label class="w3-text-blue"><b>내용</b></label>
			<textarea class="w3-input w3-border" name="eventContent"
				style="height: 200px"></textarea>
		</p>
		<p>
			<button type="submit" class="w3-btn w3-blue">Register</button>
			<button type="reset" class="w3-btn w3-blue">reset</button>
			<button type="button" class="w3-btn w3-blue" onclick="getEventList()">list</button>
		</p>
	</form>
</body>
</html>