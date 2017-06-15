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
		var checkboxs = $("[name='interest']:checked"); // :checked
		var checkValue = "";
		for(i=0;i<checkboxs.length;i++){
			checkValue += checkboxs[i].value;
			if(i != checkboxs.length-1 ){checkValue += ",";}
		}
		
		$("#interestLength").attr('value',checkboxs.length);
		var arr = checkValue.split(',');
		$("#member_interest1").attr('value',arr[0]);
		$("#member_interest2").attr('value',arr[1]);
		$("#member_interest3").attr('value',arr[2]);
	});
});

function aa(){
	if($("#interestLength").attr('value')>3){
	alert("관심사는 최대 3개까지 등록 가능합니다.");
	return false;
	}else{
	return true;
	}
}
</script>
</head>

<body>
회원 가입
<hr>
<form method="post" enctype="multipart/form-data" onsubmit="return aa();">
아이디 : <input type="text" name="member_id"  > <br> <!-- required -->
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
							<label> <input type="checkbox" name="interest" value="${interest.code_id }">
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
<input type="hidden" id="interestLength" >
<input type="hidden" id="member_interest1" name="member_interest1">
<input type="hidden" id="member_interest2" name="member_interest2">
<input type="hidden" id="member_interest3" name="member_interest3">

<br>
자기소개:<textarea cols="30" rows="6" name="member_introduction"></textarea>

<button> 등록 </button>

</form>

</body>
</html>