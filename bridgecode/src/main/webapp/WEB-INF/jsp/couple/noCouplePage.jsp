<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<div class="col-sm-9">
<div class="jumbotron">
  <h2><i class="material-icons" style="font-size: 50px;">error_outline</i><spring:message code="커플이없습니다." /></h2>
  <p>...</p>
  <p><a 
  class="btn btn-primary btn-lg"
  href="${pageContext.request.contextPath}/matching/memberMatchingList.do"
  role="button"
  style="float:right;"><spring:message code="회원매칭" /></a></p>
  <br><br>
</div>
</div>

</body>
</html>