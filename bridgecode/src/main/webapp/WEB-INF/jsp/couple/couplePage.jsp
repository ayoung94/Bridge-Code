<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
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
$(function(){
	$("button[name='likeBtn']").on("click",function(){
		var THIS = $(this);
		console.log(THIS.attr('value'));
		var reqStr = THIS.attr('value');
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/couple/boardUpdateLike.json',
			data:reqStr,
			dataType:'text',
			success:
					 function(data){
						console.log(data);
						if(data == '1'){
							//좋아해 
							THIS.html('<i class="material-icons" style="color: #CC3D3D;">favorite</i>');
							
						}else{
							//안좋아해 
							THIS.html('<i class="material-icons" style="color: #CC3D3D;">favorite_border</i>');
						}
					}, error:
							function(){
							console.log("에러2");
						}
					});
	});
});
</script>
</head>

<body class="w3-theme-l5">

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card-2 w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">My partner</h4>
         <p class="w3-center"><img src="${pageContext.request.contextPath}/profile_img/${partner.member_profile_img}" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <button onclick="coupleDelete()" style="float: right;" class="btn btn-default btn-sm btn-simple">커플 해제</button><br>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>${partner.member_nickname}</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> ${partner.member_country}</p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i>
	         <fmt:parseDate value="${member.member_birth }" pattern="yyyy-MM-dd" var="memberBirth" scope="page" />
			<fmt:formatDate value="${memberBirth}" pattern="yyyy/MM/dd" />
         </p>
        </div>
      </div>
      <br>
       <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          <i class="fa fa-remove"></i>
        </span>
        <p><strong>♥</strong></p>
        <p>우리 지금 커플 된 지
        <fmt:parseDate value="${heart.heart_confirm_time }" var="strPlanDate" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
		 
		<jsp:useBean id="toDay" class="java.util.Date" />
		<fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' var="nowDate"/>
		<fmt:parseDate value="${nowDate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
		
		<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
		${(endDate - strDate)+1}
		
		<%--  ${heart.heart_confirm_time } --%>일째!
        
        </p>
      </div>
      <!-- Accordion -->
      <div class="w3-card-2 w3-round">
        <div class="w3-white">
          <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>introduction</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>${partner.member_introduction }</p>
          </div>
          <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i>photos</button>
          <div id="Demo3" class="w3-hide w3-container">
         <div class="w3-row-padding">
         <br>
           <div class="w3-half">
             <img src="${pageContext.request.contextPath}/profile_img/${partner.member_img1}" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="${pageContext.request.contextPath}/profile_img/${partner.member_img2}" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="${pageContext.request.contextPath}/profile_img/${partner.member_img3}" style="width:100%" class="w3-margin-bottom">
           </div>
         </div>
          </div>
        </div>      
      </div>
      <br>
      
    

    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card-2 w3-round w3-white">
            <div class="w3-container w3-padding" style="text-align:center;">
              <button type="button" class="w3-button w3-theme" onclick="window.open('${pageContext.request.contextPath}/chat/coupleChat.do',
							'window',
							'width=400,height=600,left=800,top=0')"> 1:1채팅 바로가기</button> 
              
            </div>
          </div>
        </div>
      </div>
      <br>
        <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card-2 w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">오늘 하루는 어땠나요?</h6>
              <form action="${pageContext.request.contextPath}/couple/boardInsert.do">
              <input type="hidden" name="board_writer" value="${login.member_id }">
              <input type="text" name="board_content" style="width: 100%;height: 40px;border: 1px #bbb solid;padding: 10px;" placeholder="이야기를 나누어보세요..." ><br>
              <br>
              <button type="button" class="w3-button w3-theme" style="float: right;" onclick="submit();"><i class="fa fa-pencil"></i> Post</button> 
              </form>
             
            </div>
          </div>
        </div>
      </div>
      <br>
      
      <c:forEach items="${boardlist}" var="bo">
      
      <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <img src="${pageContext.request.contextPath}/profile_img/${bo.MEMBER_PROFILE_IMG}" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px;height:60px;margin-left: 5px;">
        <span class="w3-right w3-opacity">${bo.BOARD_TIME}</span>
        <h4>${bo.MEMBER_NICKNAME}</h4><br> 
        <hr class="w3-clear">
        <p style="text-align: center;">${bo.BOARD_CONTENT}</p>
       
        <br>
        
		<c:if test="${bo.BOARD_LIKE == 0}">
		<button class="btn btn-white btn-fab btn-fab-mini btn-round" style="float:right;"
		 value="board_id=${bo.BOARD_ID}&like=${bo.BOARD_LIKE}"
		 data-toggle="tooltip" data-placement="top" title="like!"  name="likeBtn">
			<i class="material-icons" style="color: #CC3D3D;">favorite_border</i>
		</button>
		</c:if>
		<c:if test="${bo.BOARD_LIKE == 1}"> 
		<button class="btn btn-white btn-fab btn-fab-mini btn-round" style="float:right;"
		 value="board_id=${bo.BOARD_ID}&like=${bo.BOARD_LIKE}" name="likeBtn">
			<i class="material-icons" style="color: #CC3D3D;">favorite</i>
		</button>

		</c:if>

		<c:if test="${login.member_id == bo.BOARD_WRITER}">
        <button onclick="location.href='${pageContext.request.contextPath}/couple/boardDelete.do?board_id=${bo.BOARD_ID}'"; style="float: right;" class="btn btn-default btn-sm btn-simple">삭제</button>
        </c:if>
		<br>
		<br>
		<br>
      </div>
      
      
      </c:forEach>

    <!-- End Middle Column -->
    </div>
    
   
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<script>
// Accordion
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>
<%-- 
      
<div class="panel panel-danger" style="width: 700px;">
	<div class="panel-heading" style="background-color: lavenderblush;color:black;">Couple Page</div>
	<div class="panel-body">
		
		내 커플 <br> 
		이름 ${partner.member_id }<br>
		${partner.member_birth }<br>
		${partner.member_country }<br>
		<br>
		커플 된지
		
		<fmt:parseDate value="${heart.heart_confirm_time }" var="strPlanDate" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
		 
		<jsp:useBean id="toDay" class="java.util.Date" />
		<fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' var="nowDate"/>
		<fmt:parseDate value="${nowDate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
		
		<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
		${(endDate - strDate)+1}
		
		 ${heart.heart_confirm_time }일째! <br>
		<a href="#" 
		onclick="window.open('${pageContext.request.contextPath}/chat/coupleChat.do',
							'window',
							'width=400,height=600,left=800,top=0')">1:1대화</a>
		<br>
		<button onclick="coupleDelete()">커플 해제</button>
	
		
	</div>
</div>
 --%>

</body>
</html>