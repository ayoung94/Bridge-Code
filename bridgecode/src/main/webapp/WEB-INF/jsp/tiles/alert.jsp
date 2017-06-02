<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>alert</title>
<script>

alert('${msg}');
//부모창 갱신
winodw.opener.document.location.reload();
//부모창 페이지 이동
window.opener.document.location.href = 
	'${pageContext.request.contextPath}${url}';
window.close();
</script>

</head>
<body>

</body>
</html>