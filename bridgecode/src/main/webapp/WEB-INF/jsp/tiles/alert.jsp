<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    
<html>
<head>
<title>alert</title>


</head>
<body>

<input id="msg" type="text" value="<spring:message code='${msg}'/>">

<script type="text/javascript"> 
var message = "${msg}";   
var returnUrl = '${pageContext.request.contextPath}${url}'; 
alert(document.getElementById("msg").getAttribute("value")); 
history.go(-1);
</script> 
</body>
</html>