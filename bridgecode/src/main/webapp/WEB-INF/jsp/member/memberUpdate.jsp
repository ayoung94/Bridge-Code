<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
내 회원 정보
<hr>
<form method="post">
아이디 : <input type="text" name="member_id" value="${member.member_id }"> <br>
비밀번호: <input type="password" name="member_password" required> <br>
닉네임: <input type="text" name="member_nickname" value="${member.member_nickname }"> <br>
<!-- 성별: 남<input type="radio" name="member_sex" value="1"> 여<input type="radio" name="member_sex" value="2"> <br>
국적: <select name="member_country" >
<option value="ko">한국</option>
<option value="cn">중국</option>
<option value="jp">일본</option>
</select> <br>
생년월일: <input type="date" name="member_birth" ><br>
관심사:<br> -->
자기소개:<textarea cols="30" rows="6" name="member_introduction">${member.member_introduction}</textarea>

<button> 등록 </button>

</form>

</body>
</html>