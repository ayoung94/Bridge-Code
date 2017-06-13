<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 등록</title>
</head>
<body>
<h1>공지사항 등록</h1>
	<%-- <div class="">
		
	</div>
	<div>
		<form action="noticeInsert.do" method="post">
			<input type="hidden" name="action" value="ins" />
			<div class=>
				<label>제목</label> <input type="text" name="noticeTitle">
			</div>
			<div class="">
				<label>작성자</label> <input type="text" name="memberId" 
				value="${login}" readonly="readonly">
			</div>
			<div class="">
				<label>내용</label>
				<textarea name="noticeContent" rows="5" cols="40"></textarea>
			</div>
			<button type="submit" class="">
				<i>등록</i>
			</button>
			<button type="button" onclick="" class="">글 목록</button>
		</form> 
	</div>--%>
	
	<form action="noticeInsert.do" method="post" enctype="multipart/form-data">
	
	제목<input type="text" name="noticeTitle"><br/>
	<!-- 작성자<input type="text" name="memberId"><br/> -->
	내용<textarea name="noticeContent"></textarea><br/>
	<!-- 첨부파일<input type="file" name="uploadfile"/> -->
	<input type="submit" value="저장">
	</form>
</body>
</html>