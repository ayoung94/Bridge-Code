<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function coupleDelete(){
	if(confirm("정말 커플 해제를 하시겠습니까?"))
	{	
		//alert("정상적으로 처리 되었습니다."); 
		location.href='${pageContext.request.contextPath}/couple/coupleDelete.do';
		return true;
	}else{
	return false;
	}
}
</script>
</head>

<body>
커플페이지<br>

<div style="border: 1px solid black;">
내 커플 <br> 
이름 ${partner.member_id }<br>
${partner.member_birth }<br>
${partner.member_country }<br>
<br>
커플 된지 00일째! <br>
<a href="#" 
onclick="window.open('${pageContext.request.contextPath}/chat/coupleChat.do',
					'window',
					'width=400,height=600,left=800,top=0')">1:1대화</a>
<br>
<button onclick="coupleDelete()">커플 해제</button>
</div>
</body>
</html>