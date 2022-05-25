<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	
	<div class="card align-middle" style="width:20rem; border-radius:20px; margin:auto">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">로그인 폼</h2>
		</div>
		<div class="card-body">
		      <form action="/user/insert" class="form-signin" method="POST">
		        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
		        <label for="inputEmail" class="sr-only">Your ID</label>
		        <input type="text" id="user_id" name="user_id" class="form-control" placeholder="Your ID" required autofocus><BR>
		       
		        <label for="inputPassword" class="sr-only">Password</label>
		        <input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="Password" required><br>
		        
		        <label for="inputEmail" class="sr-only">이름</label>
		        <input type="text"  name="user_name" class="form-control" placeholder="Your Name" required><br>
		       
		        <label for="inputEmail" class="sr-only">성</label>
		        <input type="text" name="last_name" class="form-control" placeholder="Last Name" required><br>
		       
		        <label for="inputEmail" class="sr-only">전화번호</label>
		        <input type="text" name="phone_num" class="form-control" placeholder="Phone Number" required><br>
		       
		        <label for="inputEmail" class="sr-only">나이</label>
		        <input type="text" name="user_age" class="form-control" placeholder="Age" required><br>
		       
		        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">회원가입</button>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		      </form>
	      </div>
      </div>
      
</body>
</html>