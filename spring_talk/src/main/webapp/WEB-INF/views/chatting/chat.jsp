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
1
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width : 800px; height:700px; padding:10px; border: solid 1px #000;">
		<div id="divChatData"></div>
	</div>
	<div style="width : 100%; height:10%; padding:10px;">
		<input type="text" id="message" size="110" onkeypress="if(event.keyCode==13){sendChat()}">
		<input type="button" id="btnSend" value = "전송" onclick="sendChat()">
	</div>
</body>


</html>