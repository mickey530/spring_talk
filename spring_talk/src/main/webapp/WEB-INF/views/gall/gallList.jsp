<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  html, body {height:100%;}
  body {
    background-color: white;
    color: black;
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<header class="sticky-top p-3 bg-primary text-white border-bottom row" style="margin:0px;">
			<span class="col-11">IN & OUT 커뮤니티</span>
			<a href="/post/insert" class="col-1 text-left text-white">+</a>
		</header>
		
	<div class="container row">
	
		<a href="/gall/dogList">멍 갤</a><br/>
		<a href="#">냥 갤</a><br/>
		<a href="#">냠냠 갤</a><br/>
		<a href="#">운동 갤</a><br/>
		<a href="#">게임 갤</a><br/>
		<a href="#">등산 갤</a><br/>
		
	</div> 
	
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