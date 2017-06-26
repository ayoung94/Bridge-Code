<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 상세보기</title>
<style>
.modal-backdrop {
	z-index: -1;
}
</style>
<style>
.test th {
	box-shadow: 5px 0px 5px #888888;
	text-align: center;
	padding: 5px;
}

.test td {
	box-shadow: 5px 0px 5px #888888;
	text-align: center;
	padding: 5px;
}
}
</style>
<style>
.margin {
	margin:auto;
}
</style>	
<style>
.shadow {
	box-shadow: 5px 5px 5px #888888;
}
</style>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
	</div>
	<div class="modal-body">
		<table class="test margin">

			<tr>
				<th>아이디</th>
				<td>${userList.member_id}</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${userList.member_nickname}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${userList.member_name}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${userList.member_birth}</td>
			</tr>
			<tr>
				<th>마지막 접속일</th>
				<td>${userList.member_last_connection}</td>
			</tr>
			<tr>
				<th>관심사1</th>
				<td>${userList.member_interest1}</td>
			</tr>
			<tr>
				<th>관심사2</th>
				<td>${userList.member_interest2}</td>
			</tr>
			<tr>
				<th>관심사3</th>
				<td>${userList.member_interest3}</td>
			</tr>
			<tr>
				<th>level</th>
				<td>${userList.member_level}</td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td><img
					src="${pageContext.request.contextPath}/profile_img/${userList.member_profile_img}"
					style="width: 350px; height: 250px"></td>
			</tr>
			<tr>
				<th>경고횟수</th>
				<td>${userList.member_warning}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${userList.member_sex}</td>
			</tr>
			<tr>
				<th>파트너ID</th>
				<td>${userList.member_partner_id}</td>
			</tr>
			<tr>
				<th>국적</th>
				<td>${userList.member_country}</td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td>${userList.member_introduction}</td>
			</tr>
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</body>
</html>