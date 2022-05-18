<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/insert" method="post">
		<input type="text" name="user_id" placeholder="아이디" value="${user.user_id }"><br/>
		<input type="password" name="user_pw" placeholder="비밀번호" value="${user.user_pw }"><br/>
		<input type="text" name="user_name" placeholder="이름"  value="${user.user_name }"><br/>
		<input type="text" name="last_name" placeholder="성"  value="${user.last_name }"><br/>
		<input type="number" name="user_age" placeholder="나이"  value="${user.user_age }"><br/>
		<input type="text" name="phone_num" placeholder="전화번호"  value="${user.phone_num }"><br/>
		<input type="checkbox" name="roles" value="ROLE_ADMIN">어드민 권한 &nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="roles" value="ROLE_MEMBER">멤버십 회원 권한 &nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="roles" value="ROLE_ALL" checked>평회원 권한 &nbsp;&nbsp;&nbsp;
		<input type="submit" value="회원가입">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	</form>
	
	
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
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