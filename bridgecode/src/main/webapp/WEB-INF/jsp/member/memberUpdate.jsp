<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function(){ 
	var mb = "${member.member_birth}";
	mb = mb.substring(0,10);
	mb = mb.replace('-', '/');
	mb = mb.replace('-', '/');
	$( "#member_birth" ).val(mb.substring(0, 10));
	
	
	$('#member_birth').blur(function(){
		console.log($('#member_birth').attr('value'));
		console.log("아");
		
	}); 
	
	$(':checkbox').click(function (){
		var checkboxs = $("[name='interest']:checked"); // :checked
		var checkValue = "";
		for(i=0;i<checkboxs.length;i++){
			checkValue += checkboxs[i].value;
			if(i != checkboxs.length-1 ){checkValue += ",";}
		}
		
		$("#interestLength").attr('value',checkboxs.length);
		console.log($("#interestLength").attr('value'));
		var arr = checkValue.split(',');
		$("#member_interest1").attr('value',arr[0]);
		$("#member_interest2").attr('value',arr[1]);
		$("#member_interest3").attr('value',arr[2]);
	});
	
	$("#member_password").bind("keypress blur",
			function(){
			if($("#member_password").val() ==''){
				$("#member_password_div").attr('class','form-group label-floating has-error');
				$("#passwordOK").hide();
				$("#passwordNOTOK").show();
				$("#password_label").text("<spring:message code='비밀번호를입력해주세요' />");
				$("#password_label").show();
				$("#password_check").attr('value','false');
			}else if($("#member_password1").val() == $("#member_password").val()){
				$("#member_password_div").attr('class','form-group label-floating has-success');
				$("#passwordNOTOK").hide();
				$("#passwordOK").show();
				$("#password_label").hide();
				$("#password_check").attr('value','true');
				console.log($("#member_password").val());
			}else{
				$("#member_password_div").attr('class','form-group label-floating has-error');
				$("#passwordOK").hide();
				$("#passwordNOTOK").show();
				$("#password_label").text("<spring:message code='비밀번호가다릅니다' />");
				$("#password_label").show();
				$("#password_check").attr('value','false');
			}
		});	
});



function aa(){
	if($("#interestLength").attr('value')>3){ 
		alert(document.getElementById("interesetMSG").getAttribute("value"));
		return false;
		}else if($("#password_check").attr('value') == 'false'){
			alert(document.getElementById("passwordMSG").getAttribute("value"));
			return false;
		}else{
		return true;
		} 
}

</script>
<style>
.widthSmall{
width:200px; 
}
#joinForm td:first-child{
/* border: 1px solid black; */
text-align: right;
margin: 30px;
padding: 30px;
width: 300px;
}
</style>
</head>
<body>
<input type="hidden" id="interesetMSG" value="<spring:message code="관심사는최대3개까지등록가능합니다."/>">
<input type="hidden" id="passwordMSG" value="<spring:message code="비밀번호를다시확인해주세요" />">

<h3><spring:message code="회원정보수정" /></h3>
<hr>
<form method="post" enctype="multipart/form-data" onsubmit="return aa();">
<table id="joinForm">
<tr>
<td><spring:message code="아이디" /> :</td><td>${member.member_id}</td>
</tr>
<tr>
<td><spring:message code="이름" /> :</td>
<td>
${member.member_name}</td>
</tr>
<tr>
<td><spring:message code="생년월일" /> :</td>
<td>
<div class="col-sm-4">
<input type="text" id="member_birth" name="member_birth" class="datepicker form-control widthSmall" data-date-format="yyyy/mm/dd">
</div>
</td>
</tr>
<tr>
<td><spring:message code="비밀번호" />:<br><br><br><br><spring:message code="비밀번호확인" />:</td>
<td>
<div class="col-sm-4">
<input type="password" id="member_password1" class="form-control widthSmall">
<div class="form-group  label-floating" id="member_password_div">
<label id="password_label" class="control-label" style="display: none;"><spring:message code="비밀번호가다릅니다" /></label>
<input type="password" id="member_password" name="member_password" class="form-control widthSmall">
<span class="form-control-feedback">
			<i id="passwordOK" class="material-icons" style="display: none;">done</i>
			<i id="passwordNOTOK" class="material-icons" style="display: none;">clear</i>
</span>
</div>
</div>
<input type="hidden" id="password_check" value="false">
</td>
</tr>
<tr>
<td><spring:message code="닉네임" /> :
</td>
<td>
<div class="col-sm-4">
<input type="text" name="member_nickname" class="form-control widthSmall" value="${member.member_nickname}">
</div>
</td>
</tr>
<tr>
<td><spring:message code="성별" />:</td>
<td> 
<div class="radio" style="margin-left: 20px;"> 
<label><input type="radio" name="member_sex" value="1" <c:if test="${member.member_sex == 1}">checked</c:if> ><spring:message code='남성' /></label>
<label><input type="radio" name="member_sex" value="2" <c:if test="${member.member_sex == 2}">checked</c:if> ><spring:message code='여성' /></label>
</div></td>
</tr>
<tr>
<td><spring:message code="국적" />:</td>
<td>
<div class="col-sm-4">
<select name="member_country" class="form-control">
<option value="ko" <c:if test="${member.member_country == 'ko'}">selected</c:if>  ><spring:message code='한국' /></option>
<option value="cn" <c:if test="${member.member_country == 'cn'}">selected</c:if>><spring:message code='중국' /></option>
<option value="jp" <c:if test="${member.member_country == 'jp'}">selected</c:if>><spring:message code='일본' /></option>
</select>
</div></td>
</tr>
<tr>
<td><spring:message code="관심사" /> :</td>
<td>
<br>
<div class="radio">
<label><i class="material-icons">done</i><spring:message code='관심사는최대3개까지등록가능합니다.' /></label>
</div><br>
<%
	int j = 0;
%>
<c:forEach items="${list}" var="interest">
<div class="checkbox" style="display: inline;padding: 10px; margin: 10px;" >
<label style="width: 100px;"> <input type="checkbox" name="interest" value="${interest.code_id }"
<c:if test="${member.member_interest1 == interest.code_id or member.member_interest2 == interest.code_id 
						  				or member.member_interest3 == interest.code_id}">checked</c:if>>
<spring:message code='${interest.code_name }' />
</label>
</div>
<%
	j++;
		if (j % 5 == 0) {
			out.print("<br>");
		}
%>
</c:forEach> 
<input type="hidden" id="interestLength" >
<input type="hidden" id="member_interest1" name="member_interest1" value="${member.member_interest1}">
<input type="hidden" id="member_interest2" name="member_interest2" value="${member.member_interest2}">
<input type="hidden" id="member_interest3" name="member_interest3" value="${member.member_interest3}">
</td>
</tr>
<tr>
<td><spring:message code="자기소개" />:</td>
<td>
<div class="col-sm-7">
<textarea class="form-control"cols="30" rows="5" name="member_introduction">${member.member_introduction}</textarea>
</div>
</td>
</tr>
</table>

<button class="btn btn-primary" style="margin-left: 800px;"><spring:message code="전송" /></button>

</form>

</body>
</html>