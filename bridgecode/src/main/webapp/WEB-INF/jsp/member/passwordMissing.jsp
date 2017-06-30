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
<h4><spring:message code="비밀번호를잊으셨나요" /></h4>
<spring:message code="비밀번호를잊으셨나요2" /><br>
<hr>
<form method="post">

<div class="col-sm-3">
<div class="form-group">
<input type="text" name="member_id" class="form-control" placeholder="<spring:message code="이메일을입력해주세요" />">
</div>
</div>
<button class="btn btn-primary btn-sm" style="margin-top: 30px;"><spring:message code="전송" /></button>

</form>
</body>
</html>