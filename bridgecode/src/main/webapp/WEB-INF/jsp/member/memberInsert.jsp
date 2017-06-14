<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(function(){ 
	$(':checkbox').click(function(){
		var checkboxs = $(" :checked");
		console.log(checkboxs);
		console.log(checkboxs[0]);
	});
});
</script>
</head>

<body>
회원 가입
<hr>
<form method="post" enctype="multipart/form-data">
아이디 : <input type="text" name="member_id" > <br>
프로필 사진: <input type="file" name="uploadFile" ><br>
비밀번호: <input type="password" name="member_password" > <br>
닉네임: <input type="text" name="member_nickname" > <br>
성별: 남<input type="radio" name="member_sex" value="1"> 여<input type="radio" name="member_sex" value="2"> <br>
국적: <select name="member_country">
<option value="ko">한국</option>
<option value="cn">중국</option>
<option value="jp">일본</option>
</select> <br>
생년월일: <input type="date" name="member_birth" ><br>
관심사:
	<table>
			<tr>
				<%
					int j = 0;
				%>
				<c:forEach items="${list}" var="interest">
					<td>
						<div class="checkbox">
							<label> <input type="checkbox" name="interest">
								${interest.code_name }
							</label>
						</div>
					</td>
					<%
						j++;
							if (j % 5 == 0) {
								out.print("</tr><tr>");
							}
					%>
				</c:forEach>
			</tr>
		</table>

<br>
자기소개:<textarea cols="30" rows="6" name="member_introduction"></textarea>

<button> 등록 </button>

</form>

</body>
</html>