<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<meta name="viewport" content="width=device-width, initial-scale=1">
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>

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
      padding-bottom: 116px;
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
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.user.user_id" var="login_id"/>
<sec:authentication property="principal.user.user_name" var="login_name"/>
</sec:authorize>
<div id="wrapper">
	<header class="sticky-top p-3 text-black border-bottom row" style="margin:0px;">
		<h3 class="col-11 px-0">${gall_name} 갤러리 채팅방</h3>
		
	</header>
<div class="container">

	<div class="p-2">
		<div id="divChatData"></div>
	</div>
	<div>
		<input type="text" id="message" class="form-control p-2" onkeypress="if(event.keyCode==13){sendChat()}">
		<!-- <input type="button" id="btnSend" class="justify-content-right" value = "전송" onclick="sendChat()"> -->
	</div>
</body>

</div> <!-- container -->

</div> <!-- wrapper -->

<footer class="mx-0 py-2 w-100 border-top row justify-content-between">
	<a href="/user/follow" class="col-2">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
          <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
        </svg>	
	</a>
	<a href="/post/newsfeed" class="col-2">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-terminal" viewBox="0 0 16 16">
          <path d="M6 9a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3A.5.5 0 0 1 6 9zM3.854 4.146a.5.5 0 1 0-.708.708L4.793 6.5 3.146 8.146a.5.5 0 1 0 .708.708l2-2a.5.5 0 0 0 0-.708l-2-2z"/>
          <path d="M2 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h12z"/>
        </svg>	
	</a>
	<a href="/gall/gallList" class="col-2">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
          <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
        </svg>	
	</a>
	<a href="/user/room/${login_id }" class="col-2">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
          <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
        </svg>	
	</a>
</footer>


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
	       .replace('http:','ws:').replace('chatting/chat/${gall_name}','chat/websocket');
	    console.log("url");
	    console.log(url);
	    const webSocket = new WebSocket(url);
	    

	    console.log("ORIGIN webSocket");
	    console.log(webSocket);

	    
		function onMessage(evt){
			var data = JSON.parse(evt.data);
			

			
			console.log("서버에서 데이터 받음 : " + data.msg);
    		$('#divChatData').append('<div>'+data.msg+'</div>');
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
    	 
    	 function sendEnter(){
     		console.log('sendEnter');
     		console.log($('#message').val());

     		if($('#message').val()==""){
     			return;
     		}

    		var data = {
					
    				room_id : '${gall_name}',
    				cmd : "CMD_ENTER",
    				msg : ""
    		}
     		
    		var jsonData = 	JSON.stringify(data);
    		webSocket.send(jsonData);
     		$('#message').val('');
     	}
    	 
    	 function receiveMessage(data){
	    		console.log('receiveMessage');
	    		console.log(data);
	    		$('#divChatData').append('<div>'+data.msg+'</div>');
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
    		console.log(str);
    		
    		var data = {

    				room_id : '${gall_name}',
    				user_name : '${login_name}',
    				cmd : "CMD_MSG_SEND",
    				msg : str
    		}
    		var jsonData = 	JSON.stringify(data);
    		webSocket.send(jsonData);
//    	     webSocket.prototype.oldSend.apply(webSocket, [str]);
    		document.body.scrollTop = document.body.scrollHeight;
    	}
    	
    	function _initSocket(){
    		console.log('_initSocket');
    		
    		sendEnter();
    		
    		webSocket._socket = new SockJS(this._url);
    		webSocket.onopen = function(evt){
    			
    			sendEnter();
    		};
    		webSocket.onmessage = function(evt){
    			webSocket.receiveMessage(evt.data)
    		};
    		webSocket.onclose = function(evt){
    			webSocket.closeMessage(evt.data)
    		};
    	}

        webSocket.receiveMessage = receiveMessage;
        webSocket.onmessage = onMessage;
        webSocket.closeMessage = closeMessage;
        webSocket.disconnect = disconnect;
        webSocket._sendMessage = _sendMessage;
        webSocket.init = init;
        webSocket._initSocket = _initSocket;
/*         
        webSocket._initSocket = _initSocket;
        webSocket.init = init;
        webSocket.sendChat = sendChat; */
	    console.log("new webSocket");
	    console.log(webSocket);

	</script>

<script type="text/javascript">
	$(document).on('load',function(){
		webSocket._initSocket()
/* 	    var url = document.location.toString()
	       .replace('http:','ws:').replace('chatting/chat/${gall_name}','chat/websocket'); */
	});
</script>
</html>