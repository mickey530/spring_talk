<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<meta name="viewport" content="width=device-width, initial-scale=1">
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>

	<script type="text/javascript">

		// csrf 토큰 정의
		let _csrf = '${_csrf.token}';
	    let _csrf_header = '${_csrf.headerName}';
	    // 로그인 아이디 정의
	    let login_id = '${login_id}';
	    
	    /* 
	    var webSocket = {
		    	init : function(param){
		    		
		    		console.log('init');
		    		console.log(param);
		    		
		    		this._url = param.url;
		    		this._initSocket();
		    	},	
		    	sendChat : function(){
		    		console.log('sendChat');
		    		console.log($('#message').val());
		    		this._sendMessage($('#message').val());
		    		$('#message').val('');
		    	},	
		    	receiveMessage : function(str){
		    		console.log('receiveMessage');
		    		console.log(str);
		    		$('#divChatData').append('<div>'+str+'</div>');
		    	},	
		    	closeMessage : function(str){
		    		console.log('closeMessage');
		    		console.log(str);
		    		$('#divChatData').append('<div> 연결 끊김'+str+'</div>');
		    	},	
		    	disconnect : function(){
		    		console.log('disconnect');
		    		this._socket.close();
		    	},	
		    	_initSocket : function(){
		    		console.log('_initSocket');
		    		this._socket = new SockJS(this._url);
		    		this._socket.onmessage = function(evt){
		    			webSocket.receiveMessage(evt.data)
		    		};
		    		this._socket.onclose = function(evt){
		    			webSocket.closeMessage(evt.data)
		    		};
		    	},	
		    	_sendMessage : function(str){
		    		console.log('_sendMessage');
		    		console.log(this._socket);
		    		this._socket.send(str);
		    	}
	    }; */
	    var url = document.location.toString()
	       .replace('http:','ws:').replace('chatting/chat','chat/websocket');
	    console.log("url");
	    console.log(url);
	    const webSocket = new WebSocket(url);
	    

	    console.log("ORIGIN webSocket");
	    console.log(webSocket);

	    
		function onMessage(evt){
			var data = evt.data;
			console.log("서버에서 데이터 받음");
    		$('#divChatData').append('<div>'+data+'</div>');
			console.log(evt);
			console.log(data);
		}


	    function init(param){
    		
    		console.log('init');
    		console.log(param);
    		
    		webSocket.url = param.url;
    		webSocket._initSocket();
    	}
	    
		
    	 function sendChat(){
    		console.log('sendChat');
    		console.log($('#message').val());
    		_sendMessage($('#message').val());
    		$('#message').val('');
    	}
    	 
    	 function receiveMessage(str){
	    		console.log('receiveMessage');
	    		console.log(str);
	    		$('#divChatData').append('<div>'+str+'</div>');
	    	}
    	 
    		
	    function closeMessage(str){
	    		console.log('closeMessage');
	    		console.log(str);
	    		$('#divChatData').append('<div> 연결 끊김'+str+'</div>');
	    }
	    

    	function disconnect(){
    		console.log('disconnect');
    		webSocket.close();
    	}
	    	
	    

    	function _sendMessage(str){
    		console.log('_sendMessage');
    		console.log(webSocket);
    		webSocket.send(str);
//    	     webSocket.prototype.oldSend.apply(webSocket, [str]);
    	}
    	
    	function _initSocket(){
    		console.log('_initSocket');
    		webSocket._socket = new SockJS(this._url);
    		webSocket._socket.onmessage = function(evt){
    			webSocket.receiveMessage(evt.data)
    		};
    		webSocket._socket.onclose = function(evt){
    			webSocket.closeMessage(evt.data)
    		};
    	}

    	
        webSocket.receiveMessage = receiveMessage;
        webSocket.onmessage = onMessage;
/*         webSocket.closeMessage = closeMessage;
        webSocket.disconnect = disconnect;
        webSocket._sendMessage = _sendMessage;
        webSocket._initSocket = _initSocket;
        webSocket.init = init;
        webSocket.sendChat = sendChat; */
	    console.log("new webSocket");
	    console.log(webSocket);

	</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

@font-face {
    font-family: 'CookieRunOTF-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
  }
  @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
  }  
  html, body {height:100%;}
  body {
    background-color: white;
    color: black;
    font-family: 'CookieRun-Regular';    
  }
  h3, .title {
      font-family: 'CookieRunOTF-Bold';
      margin: 0px;
  }
  #wrapper{
      height: auto;
      min-height: 100%;
      padding-bottom: 50px;
  }
  a{
	  text-decoration:none;
	  text-align:center;
	  color: black;
  }
  
#message{
       display: flex !important;
       background-color:white;
       position: fixed;
       bottom: 50px;
       left: 0px;
}
header{
        background-color: white;
}

footer {
        display: flex !important;
        position: fixed;
        bottom: 0px;
        width: 100%;
        height: 50px;
        font-size: 15px;
        align-items: center;
        background-color: white;
        z-index: 2;
}
</style>
</head>
<body>
<div id="wrapper">
	<header class="sticky-top p-3 text-black border-bottom row" style="margin:0px;">
		<h3 class="col-11 px-0">IN n OUT</h3>
		<a href="/post/insert" class="col-1 text-left text-black">+</a>
	</header>
<div class="container">

	<div class="p-2">
		<div id="divChatData"></div>
	</div>
	<div class="p-2">
		<input type="text" id="message" class="form-control p-2" onkeypress="if(event.keyCode==13){sendChat()}">
		<!-- <input type="button" id="btnSend" class="justify-content-right" value = "전송" onclick="sendChat()"> -->
	</div>
</body>

</div> <!-- container -->

</div> <!-- wrapper -->

<footer class="mx-0 py-2 w-100 border-top row justify-content-between">
     <a href="/user/follow" class="col-2">팔로우</a>
     <a href="/chatting/chat" class="col-2">채팅</a>
     <a href="/post/newsfeed" class="col-2">피드</a>
     <a href="/gall/gallList" class="col-2">커뮤</a>
     <a href="/user/room/${login_id }" class="col-2">마이룸</a>
</footer>
</html>