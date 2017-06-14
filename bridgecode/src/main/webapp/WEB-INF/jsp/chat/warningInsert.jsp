<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function dd(){
	alert("신고가 완료 되었습니다. 빠른 시일내로 처리해드리겠습니다.");
	window.open("about:blank","_self").close();
}
</script>
<body>
<br>
 　　신고 사유를 입력해주세요.
<div style="text-align: center;">
<form action="${pageContext.request.contextPath}/warning/warningInsert.do" method="post">
<textarea cols="40" rows="5"></textarea>
<button onclick="dd();">신고하기</button>
</form>
</div>
</body>
</html>