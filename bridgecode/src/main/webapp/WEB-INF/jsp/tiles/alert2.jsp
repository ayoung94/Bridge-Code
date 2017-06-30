<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<title>alert</title>

</head>
<body>
<input id="msg" type="hidden" value="<spring:message code='${msg}'/>">
<script type="text/javascript"> 
var message = '${msg}'; 
var returnUrl = '${pageContext.request.contextPath}${url}'; 
alert(message); 
document.location.href = returnUrl;
</script>
</body>
</html>