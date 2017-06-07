<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>alert</title>
<script type="text/javascript"> 
var message = '${msg}'; 
var returnUrl = '${pageContext.request.contextPath}${url}'; 
alert(message); 
document.location.href = returnUrl; 
</script>

</head>
<body>

</body>
</html>