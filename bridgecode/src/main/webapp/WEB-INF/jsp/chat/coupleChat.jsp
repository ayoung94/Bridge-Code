<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ attribute name="paginationInfo" required="true" type="com.yedam.bridgecode.chat.ChatVO"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
    var newName, n=0;
    //팝업 창 제목 만들기 함수(다중 팝업을 위한..)    
    function newWindow(value)
    {
       n = n + 1;
       newName = value + n;     
    }
 
    function MyOpenWindow()
    {
        newWindow("MyWindow");
        window.open('${pageContext.request.contextPath}/warning/warningInsert.do',
				newName,
				'width=450,height=200,left=1000,top=200');
    }
</script>   
<style>
.meTalk{
background-color: white;
border: 1px solid black;
padding: 10px;
 max-width: 60%;
    clear: both;
    float: right;
    margin: 5px;
}
.alertTalk{
border-bottom: 2px solid #bbb;
border-top: 2px solid #bbb;
padding:5px;
margin: 5px;
clear: both;
text-align: center;
}
.youTalk{
background-color: white;
 max-width: 60%;
    clear: both;
    float: left;
border: 1px solid black;
/* display:inline-block; */
padding: 5px;
margin: 5px;
}
</style>
<script>
$(function(){
	console.log("작동"); 
	$("#messageWindow").on("mouseenter",".youTalk",function(){ //수정
				var THIS = $(this);
				var partnerLang = "${partner.member_country}";
				var myLang = "${login.member_country}";
				var reqStr = ""; 
				var translateText = "";
					if(partnerLang != "ko" && myLang != "ko"){ //양쪽다 ko가 아닐경우
						reqStr = "value="+THIS.children().first().text()+"&source=${partner.member_country}&target=ko";
						//1.한국어로 번역
						$.ajax({
							type:'get',
							url:'${pageContext.request.contextPath}/chat/chatTranslate.json',
							data:reqStr,
							dataType:'text',
							success:
									 function(data){
									 translateText = decodeURIComponent((data + '').replace(/\+/g, '%20'));
									//2.해당 언어로 번역	
										reqStr = "value="+translateText+"&source=ko&target=${login.member_country}";
										$.ajax({
											type:'get',
											url:'${pageContext.request.contextPath}/chat/chatTranslate.json',
											data:reqStr,
											dataType:'text',
											success:
													 function(data){
																text = decodeURIComponent((data + '').replace(/\+/g, '%20'));
																THIS.children().last().text(text);
																THIS.children().last().show();
																},
											error:
												function(){
												console.log("에러1");
											}
										});						 
									}, error:
											function(){
											console.log("에러2");
										}
									});
									
									}else{
										//한쪽이라도 언어가 ko인 경우 
										console.log('else');
									reqStr = "value="+THIS.children().first().text()+"&source=${partner.member_country}&target=${login.member_country}";
									console.log(reqStr);
									
									$.ajax({
										type:'get',
										url:'${pageContext.request.contextPath}/chat/chatTranslate.json',
										data:reqStr,
										dataType:'text',
										success:
												 function(data){
															text = decodeURIComponent((data + '').replace(/\+/g, '%20'));
															THIS.children().last().text(text);
															THIS.children().last().show();
															},
										error:
											function(){
											console.log("에러3");
										}
									});}
					});

 	$(".youTalk").on({"mouseleave":function(){
		var THIS = $(this);
		THIS.children().last().hide();
	  }});
	 
});

</script>
</head>
<body style="width: 400px; height:600px;">
<ul class="w3-ul w3-card-4">
  <li class="w3-padding-16">
    <img src="${pageContext.request.contextPath}/profile_img/${partner.member_profile_img}" class="w3-left w3-circle w3-margin-right" style="width:50px;height: 50px;">
    <span class="w3-large">${partner.member_nickname }</span><br>
	<div style="text-align: right;">
    <a href="#" onclick="MyOpenWindow()">신고하기</a>
	</div>
  </li>
</ul>


<div style="overflow-y:auto; height:470px; overflow-x:hidden;background-image: url('${pageContext.request.contextPath}/resources/img/chatBG.JPG');" id="messageWindow">

<br>
<a href="#" onclick="">더보기</a>
<c:forEach begin="${paginationInfo.firstPageNoOnPageList}"            
            end="${paginationInfo.lastPageNoOnPageList}" var="p"> 
       <a href="#" onclick="fn_egov_link_page(${p})">${p}</a> 
</c:forEach>
<br>

<c:forEach items="${chatlist}" var="chat" >
<c:set var="sender" value="${chat.CHAT_FROM_ID}" />
<c:if test="${sender eq login.member_id }">  
<div class='meTalk w3-round-xlarge'>${chat.CHAT_CONTENT }</div>
<div style="float: right;margin-top: 30px;vertical-align: bottom;display: inline;">
<span style="font-size: xx-small;font-style: italic;">
<jsp:useBean id="Today" class="java.util.Date" />
<fmt:formatDate value="${Today}" pattern="yyyy-MM-dd" var="date" />
<fmt:parseDate value="${chat.CHAT_TIME }" pattern="yyyy-MM-dd HH:mm:ss" var="chatTime" scope="page" />
<fmt:formatDate value="${chatTime}" pattern="yyyy-MM-dd" var="chatt" />
<c:if test="${date eq chatt}">
<fmt:formatDate value="${chatTime }" pattern="hh:mm" />
</c:if>
<c:if test="${date ne chatt}">
<fmt:formatDate value="${chatTime }" pattern="yyyy-MM-dd" />
</c:if>
</span>
</div>


</c:if>
<c:if test="${sender ne login.member_id }">  


<div class='youTalk w3-round-xlarge'>
<p>${chat.CHAT_CONTENT }</p>
<p></p>
</div>


<div style="float: left;margin-top: 30px;vertical-align: bottom;">
<span style="font-size: xx-small;font-style: italic;">
<jsp:useBean id="toDay" class="java.util.Date" /> 
<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="date" />
<fmt:parseDate value="${chat.CHAT_TIME }" pattern="yyyy-MM-dd HH:mm:ss" var="chatTime" scope="page" />
<fmt:formatDate value="${chatTime}" pattern="yyyy-MM-dd" var="chat" />

<c:if test="${date eq chat}">
<fmt:formatDate value="${chatTime }" pattern="hh:mm" />
</c:if>
<c:if test="${date ne chat}">
<fmt:formatDate value="${chatTime }" pattern="yyyy-MM-dd" />
</c:if>
</span>
</div>

</c:if>
</c:forEach>

</div>

<input id="inputMessage" type="text" style="width: 320px;margin: 6px;margin-top: 10px;" onkeydown="if(event.keyCode==13) send();"
placeholder="텍스트를 입력하세요..."/> 
<!-- <input type="submit" value="send" onclick="send()" />  -->
<button onclick="send()" class="w3-button w3-purple w3-round w3-small">전송</button>

</body>

<script> 
		
        var textarea = document.getElementById("messageWindow"); 
        var webSocket = new WebSocket('ws://192.168.0.79:8085/bridgecode/coupleChat.do'); 
        var inputMessage = document.getElementById('inputMessage'); 
        
        textarea.scrollTop = textarea.scrollHeight;
        
    webSocket.onerror = function(event) { 
      onError(event) 
    }; 
    webSocket.onopen = function(event) { 
      onOpen(event) 
    }; 
    webSocket.onmessage = function(event) { 
      onMessage(event) 
    }; 
    function onMessage(event) { 
    	var me = "${login.member_id}";
    	var msg = event.data.split(",");
    	var d = new Date();
    	var min = d.getMinutes();
    	var hour = d.getHours();
    	if(hour > 12){
    		hour -= 12;
    		var newhour = "0"+hour;
    		hour = newhour;
    	}
    	
    	if(msg[0] == me){
    		
    		textarea.innerHTML += "<div class='meTalk w3-round-xlarge'>"+msg[2]+"<div>";
    		textarea.innerHTML += "<div style='float: right;margin-top: 30px;vertical-align: bottom;display: inline;'>"+
    		"<span style='font-size: xx-small;font-style: italic;'>"+hour+":"+min+"</span></div>";
    	}else{
    		textarea.innerHTML += "<div class='youTalk w3-round-xlarge'><p>" + msg[2] + "</p><p></p></div>"; 
    		textarea.innerHTML += "<div style='float: left;margin-top: 30px;vertical-align: bottom;'>"+
    		"<span style='font-size: xx-small;font-style: italic;'>"+hour+":"+min+"</span></div>";
    	}
        textarea.scrollTop = textarea.scrollHeight;
    } 
    function onOpen(event) {
    	textarea.innerHTML += "<br><div class='alertTalk'>연결이 되었습니다.</div>"; 
    	textarea.scrollTop = textarea.scrollHeight;
    } 
    function onError(event) { 
    	
    console.log(event); 
        alert(event.data); 
    } 
    function send() { 
    	var me = "${login.member_id}";
    	var you = "${partner.member_id}"
        webSocket.send(me+","+you+","+inputMessage.value); 
        inputMessage.value = "";
        textarea.scrollTop = textarea.scrollHeight;
    } 
  </script> 

</html>