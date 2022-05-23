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
  .container{
  	height: 100%;
    min-height: 100%;
  }
  a{
	  text-decoration:none;
	  text-align:center;
	  color: black;
  }
  .form-signin{
  	max-width: 390px;
    position: absolute;
    width: 100%;
	padding: 10px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
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

<head>
	<title>Home</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<script>
		location.href="/user";
	</script>
</sec:authorize>

<div id="wrapper">
<header class="sticky-top p-3 text-black border-bottom row" style="margin:0px;">
<h3 class="col-11 px-0">IN n OUT</h3>
<a href="/post/insert" class="col-1 text-left text-black">+</a>
</header>
<div class="container">

<main class="form-signin">
  <form class="form-signin" method="post" action="/login">
    <h1 class="h3 mb-3 fw-normal">로그인 정보를 입력하세요</h1>

    <div class="form-floating">
      <input  type="text" id="uid" name="uid" class="form-control" placeholder="Your ID" required autofocus">
      <label for="floatingInput">Your ID</label>
    </div>
    <div class="form-floating">
      <input type="password" id="upw" name="upw" class="form-control" placeholder="Password" required><br>
      <label for="floatingPassword">Password</label>
    </div>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"  name="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
    <p class="mt-5 mb-3 text-muted">&copy; IN n OUT</p>
  </form>
</main>
	

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