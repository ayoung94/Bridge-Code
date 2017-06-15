<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function memberDelete(){
	if(confirm("정말 탈퇴 하시겠습니까?"))
	{	
		//alert("정상적으로 처리 되었습니다."); 
		location.href='${pageContext.request.contextPath}/member/memberDelete.do';
		return true;
	}else{
	return false;
	}
}
</script>

</head>
<body>
<img src="${pageContext.request.contextPath}/profile_img/${login.member_profile_img}" style="height: 100px;">
<br><input type="button" value="프로필 수정하기">
<br>
아이디: ${member.member_id}<br>
닉네임: ${member.member_nickname}<br>
이름: ${member.member_name}<br>
성별 : ${member.member_sex}<br>
생년월일 : 
<fmt:parseDate value="${member.member_birth }" pattern="yyyy-mm-dd" var="memberBirth" scope="page"/>
<fmt:formatDate value="${memberBirth}" pattern="yyyy/MM/dd" /> <br>
국적 : ${member.member_country }<br>
자기소개: ${member.member_introduction }<br>

<a href="${pageContext.request.contextPath}/member/memberUpdate.do">회원 정보 수정</a><br>
<button onclick="memberDelete()">회원 탈퇴</button>

</body>
</html>