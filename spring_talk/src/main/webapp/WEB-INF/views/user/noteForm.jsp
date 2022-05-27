<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{margin: 0;padding: 0;list-style: none;;}
body {width:100%;}
.container{width : 100%}

 #wrapper{
    height: auto;
    min-height: 100%;
    padding-bottom: 121px;
 }
 
 .footer {
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
</sec:authorize>

<div id="wrapper">
	<header class="sticky-top p-3 bg-primary text-white border-bottom row" style="margin:0px;">
		<span class="col-11">${post.writer }'s post</span>
		<a href="/post/insert" class="col-1 text-left text-white">+</a>
	</header>

<div class="container">


	<form action="/user/noteInsert" method="post">
		<input type ="hidden" name="note_sender" value="${login_id }"><br/>
		받는이  : <input type ="text" name="note_recipient" value="${note_recipient }" readonly><br/>
		본 문 : <textarea name ="note_content" rows="20" cols="50"></textarea>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<input type ="submit" value="전송"><input type ="reset" value="초기화"> 
	</form>
	
	
	
</div> <!-- container -->
 
 
</div> <!-- wrapper -->	

<footer class="mx-0 py-2 w-100 border-top row justify-content-between">
     <a href="/user/follow" class="col-2">팔로우</a>
     <a href="/chatting/chat" class="col-2">채팅</a>
     <a href="/post/newsfeed" class="col-2">피드</a>
     <a href="/gall/gallList" class="col-2">커뮤</a>
     <a href="/user/room/${login_id }" class="col-2">마이룸</a>
</footer>
</body>
</html>