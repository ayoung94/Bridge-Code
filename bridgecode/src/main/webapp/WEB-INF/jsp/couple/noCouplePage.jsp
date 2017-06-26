<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <h2><i class="material-icons" style="font-size: 50px;">error_outline</i>커플이 없습니다.</h2>
  <p>...</p>
  <p><a 
  class="btn btn-primary btn-lg"
  href="${pageContext.request.contextPath}/matching/memberMatchingList.do"
  role="button"
  style="float:right;">회원 매칭하기</a></p>
  <br><br>
</div>
</div>
<%-- <div class="alert alert-warning">
    <div class="container-fluid">
	  <div class="alert-icon">
		<i class="material-icons">warning</i>
	  </div>
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		<span aria-hidden="true"><i class="material-icons">clear</i></span>
	  </button>
      알림:<b>커플이 존재하지 않습니다. 커플을 찾아보세요.</b>
    </div>
</div>
<br>
<jsp:include page="../matching/memberMatchingList.jsp"></jsp:include> --%>
</body>
</html>