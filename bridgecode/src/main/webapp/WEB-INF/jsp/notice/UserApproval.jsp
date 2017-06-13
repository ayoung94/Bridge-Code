<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="">
		<h1>회원 신청 현황</h1>
	</div>
	<table class="">
		<thead>
		</thead>
		<tbody>
			<tr>
				<th>no</th>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>생년월일</th>
				<th>신청일</th>
			</tr>
			<c:forEach var="result" items="" varStatus="status">
				<tr>
					<td>1</td>
					<td>newtls120</td>
					<td>신동섭</td>
					<td>데임</td>
					<td>19890828</td>
					<td>2017.05.31</td>
			</c:forEach>
			<td><input type="button" value="프로필" onclick="" /></td>
			<td><input type="button" value="승인" onclick="" /></td>
			<td><input type="button" value="거부" onclick="" /></td>
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>






</body>
</html>