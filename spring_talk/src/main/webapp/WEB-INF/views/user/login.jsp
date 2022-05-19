<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style>
body{

  display: flex;
  }

#wrap_content{
  margin: 18em auto;
}
</style>
<html>

<head>
	<title>Home</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<script>
		location.href="/user";
	</script>
</sec:authorize>
	<div id="wrap_content" class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">로그인 폼</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" method="POST" action="/login">
        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
        <label for="inputEmail" class="sr-only">Your ID</label>
        <input type="text" id="uid" name="uid" class="form-control" placeholder="Your ID" required autofocus><BR>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="upw" name="upw" class="form-control" placeholder="Password" required><br>
        
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
          <label>
            <input type="checkbox" value="remember-me"  name="remember-me"> 기억하기
          </label>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
      </form>
      
		</div>
	
</div>

</body>
</html>