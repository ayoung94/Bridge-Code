<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.meTalk{
margin-left: 180px;
margin-right: 20px;
text-align: right;
border: 1px solid black;
width: 200px;
padding: 10px;
}
.alertTalk{
text-align: center;
}
.youTalk{
margin-left: 20px;
text-align: left;
border: 1px solid black;
width: 200px;
padding: 10px;
}
</style>
</head>
<body style="width: 400px; height:600px;">
<ul class="w3-ul w3-card-4">
  <li class="w3-padding-16">
    <img src="img_avatar2.png" class="w3-left w3-circle w3-margin-right" style="width:50px">
    <span class="w3-large">${partner.member_nickname }</span><br>
    <span>${partner.member_id }</span><span style="float: right;"><a href="">신고하기</a></span>
  </li>
</ul>
<div style="overflow-y:auto; height:470px; overflow-x:hidden;" id="messageWindow">
</div>
<input id="inputMessage" type="text" style="width: 320px;" onkeydown="if(event.keyCode==13) send();"/> 
<input type="submit" value="send" onclick="send()" /> 


</body>

<script type="text/javascript"> 
		var me = '${login.member_id}';
		var partner = '${partner.member_id}';
		
        var textarea = document.getElementById("messageWindow"); 
        var webSocket = new WebSocket('ws://localhost:8085/bridgecode/coupleChat'); 
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
    	textarea.innerHTML += "<div class='youTalk'>" + event.data + "</div>"; 
        textarea.scrollTop = textarea.scrollHeight;
    } 
    function onOpen(event) { 
        textarea.innerHTML += "<div class='alertTalk'>연결이 되었습니다.</div>"; 
    } 
    function onError(event) { 
    console.log(event); 
        alert(event.data); 
    } 
    function send() { 
        textarea.innerHTML += "<div class='meTalk'>" + inputMessage.value + "</div>"; 
        webSocket.send(inputMessage.value+','+me); 
        inputMessage.value = ""; 
        textarea.scrollTop = textarea.scrollHeight;
    } 
  </script> 

</html>