<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$('[data-toggle="tooltip"]').tooltip();
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

	$("#fileUpload").on('change', function () {
		
        if ($('#fileUpload').val() != "") {
  
            var image_holder = $("#image-holder");
            image_holder.empty();

            var reader = new FileReader();
            reader.onload = function (e) {
                $("<img />", {
                    "src": e.target.result,
                    "class": "thumb-image",
                    "width" : "200px",
                    "height" : "200px",
                    "onclick":"document.getElementById('fileUpload').click();",
                    "title":"프로필 사진을 등록하지 않으면, 승인 거부 사유가 됩니다."
             
                }).appendTo(image_holder);

            }
            image_holder.show();
            reader.readAsDataURL($(this)[0].files[0]);
        } else {
			$(".thumb-image").attr('src','${pageContext.request.contextPath}/resources/img/examples/addimage.png');
            //alert("This browser does not support FileReader.");
        }
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
<style>
.widthSmall{
width:200px; 
}
#joinForm td:first-child{
border: 1px solid black;
text-align: right;
margin: 10px;
padding: 10px;
}
.thumb-image{
 width: 200px;
 height: 200px;
 border:1px dotted black;
 cursor:pointer;
 }
</style>
</head>

<body>
회원 가입
<hr>
<form method="post" enctype="multipart/form-data" onsubmit="return aa();">
<table id="joinForm">
<tr>
<td>프로필 사진 :</td>
<td>
<div id="wrapper">
	<input id="fileUpload" type="file" name="uploadFile"  style="display: none;" /><br>

		<div id="image-holder"> 
		<img src="${pageContext.request.contextPath}/resources/img/examples/addimage.png" class="thumb-image" onclick="document.getElementById('fileUpload').click();"
		data-toggle="tooltip" data-placement="top" title="프로필 사진을 등록하지 않으면, 승인 거부 사유가 됩니다.">
		</div>

</div></td>
</tr>
<tr>
<td>아이디 :</td><td><input type="text" name="member_id"  class="form-control widthSmall" placeholder="이메일 형식으로 입력해주세요."></td>
</tr>
<tr>
<td>비밀번호:</td>
<td><input type="password" name="member_password" class="form-control widthSmall"></td>
</tr>
<tr>
<td>이름 :</td>
<td><input type="text" name="member_name" class="form-control widthSmall" ></td>
</tr>
<tr>
<td>닉네임:
</td>
<td><input type="text" name="member_nickname" class="form-control widthSmall">
</td>
</tr>
<tr>
<td>성별:</td>
<td> 남<input type="radio" name="member_sex" value="1"> 여<input type="radio" name="member_sex" value="2"></td>
</tr>
<tr>
<td>국적:</td>
<td><select name="member_country">
<option value="ko">한국</option>
<option value="cn">중국</option>
<option value="jp">일본</option>
</select></td>
</tr>
<tr>
<td>생년월일:</td>
<td><input type="text" name="member_birth" class="datepicker form-control widthSmall" data-date-format="yyyy/mm/dd">
</td>
</tr>
<tr>
<td>관심사:</td>
<td>
<%
	int j = 0;
%>
<c:forEach items="${list}" var="interest">
<div class="checkbox" style="display: inline;padding: 10px; margin: 10px;" >
<label style="width: 100px;"> <input type="checkbox" name="interest" value="${interest.code_id }">
${interest.code_name }
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
<input type="hidden" id="member_interest1" name="member_interest1">
<input type="hidden" id="member_interest2" name="member_interest2">
<input type="hidden" id="member_interest3" name="member_interest3">
</td>
</tr>
<tr>
<td>자기소개:</td>
<td><textarea cols="30" rows="6" name="member_introduction"></textarea></td>
</tr>
</table>

<button> 등록 </button>

</form>

</body>
</html>