<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(function(){ 
	$('[data-toggle="tooltip"]').tooltip();
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
		console.log('sdsdaf');
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
	
	$("#member_id").bind("keypress blur",
			function(){
		 		 var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				if(regEmail.test($("#member_id").val())){	
					//email형식이 맞을 시, member_id 중복 여부 확인
					$.get(	
							'${pageContext.request.contextPath}/ajaxMemberId.json',
							{member_id:$("#member_id").val()},
							function(data){
								console.log(data);
								if(data == true){ //중복 없음
									console.log("여기!");
									$("#member_id_div").attr('class','form-group label-floating has-success');
									$("#idNOTOK").hide();
									$("#idOK").show();		
									$("#member_id_label").text("");
									$("#member_id_check").attr('value','true');
								} else{				//중복 있음
								console.log("false로 될시에 오는곳");
								$("#member_id_div").attr('class','form-group label-floating has-error');
								$("#idOK").hide();
								$("#idNOTOK").show();
								$("#member_id_label").text("중복된 아이디가 존재합니다.");
								$("#member_id_check").attr('value','false');
								} 
							});
				} else{
					console.log("이메일 아니면 오는곳.");
					$("#member_id_div").attr('class','form-group label-floating has-error');
					$("#idOK").hide();
					$("#idNOTOK").show();
					$("#member_id_label").text("이메일을 입력해주세요.");
					$("#member_id_check").attr('value','false');
				}
				
			});
	
	
	$("#member_password").bind("keypress blur",
			function(){
			console.log($("#member_password1").val());
			console.log($("#member_password").val()); 
			if($("#member_password").val() ==''){
				$("#member_password_div").attr('class','form-group label-floating has-error');
				$("#passwordOK").hide();
				$("#passwordNOTOK").show();
				$("#password_label").text("비밀번호를 입력해주세요.");
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
				$("#password_label").text("비밀번호가 다릅니다.");
				$("#password_label").show();
				$("#password_check").attr('value','false');
			}
		});
	
	
});



function aa(){
	if($("#interestLength").attr('value')>3){
	alert("관심사는 최대 3개까지 등록 가능합니다.");
	return false;
	}else if($("#member_id_check").attr('value') == 'false'){
		alert("아이디를 다시 확인해 주세요.");
		return false;
	}else if($("#password_check").attr('value') == 'false'){
		alert("비밀번호를 다시 확인해 주세요.");
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
.thumb-image{
 width: 200px;
 height: 200px;
 border:1px dotted black;
 cursor:pointer;
 }
</style>
</head>

<body>
<h3><i class="material-icons">people</i>회원 가입</h3>
<p class="text-muted"> 
	브릿지 코드의 회원이 되어주세요! 무성의한 정보 기입은 회원 승인 거부사유가 될 수 있습니다.
</p>
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
<td>아이디 :</td><td>
<div class="col-sm-4">
<div class="form-group label-floating" id="member_id_div">
<label id="member_id_label" class="control-label">이메일을 입력해주세요.</label>
<input type="hidden" id="member_id_check" value="false" >
<input type="text" name="member_id"  id="member_id" class="form-control">
<span class="form-control-feedback">
			<i id="idOK" class="material-icons" style="display: none;">done</i>
			<i id="idNOTOK" class="material-icons" style="display: none;">clear</i>
</span>
</div>
</div>
</td>
</tr>
<tr>
<td>비밀번호:<br><br><br><br>비밀번호 확인:</td>
<td>
<div class="col-sm-4">
<input type="password" id="member_password1" class="form-control widthSmall">
<div class="form-group  label-floating" id="member_password_div">
<label id="password_label" class="control-label" style="display: none;">비밀번호가 다릅니다.</label>
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
<td>이름 :</td>
<td>
<div class="col-sm-4">
<input type="text" name="member_name" class="form-control widthSmall" >
</div></td>
</tr>
<tr>
<td>닉네임:
</td>
<td>
<div class="col-sm-4">
<input type="text" name="member_nickname" class="form-control widthSmall">
</div>
</td>
</tr>
<tr>
<td>성별:</td>
<td> 
<div class="radio" style="margin-left: 20px;">
<label><input type="radio" name="member_sex" value="1">남</label>
<label><input type="radio" name="member_sex" value="2">여</label>
</div></td>
</tr>
<tr>
<td>국적:</td>
<td>
<div class="col-sm-4">
<select name="member_country" class="form-control">
<option value="ko">한국</option>
<option value="cn">중국</option>
<option value="jp">일본</option>
</select>
</div></td>
</tr>
<tr>
<td>생년월일:</td>
<td>
<div class="col-sm-4">
<input type="text" name="member_birth" class="datepicker form-control widthSmall" data-date-format="yyyy/mm/dd">
</div>
</td>
</tr>
<tr>
<td>관심사:</td>
<td>
<br>
<div class="radio">
<label><i class="material-icons">done</i>관심사는 3개 까지 입력해주세요.</label>
</div><br>
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
<td>
<div class="col-sm-7">
<textarea class="form-control"cols="30" rows="5" name="member_introduction"></textarea>
</div>
</td>
</tr>
</table>

<button class="btn btn-primary" style="margin-left: 800px;"> 등록 </button>

</form>

</body>
</html>