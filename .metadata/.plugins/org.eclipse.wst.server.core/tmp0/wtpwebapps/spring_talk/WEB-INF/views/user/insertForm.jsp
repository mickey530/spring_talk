<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/insertUser" method="get">
		<input type="text" name="user_id" placeholder="아이디" value="${user.user_id }"><br/>
		<input type="password" name="user_pw" placeholder="비밀번호" value="${user.user_pw }"><br/>
		<input type="text" name="user_name" placeholder="이름"  value="${user.user_name }"><br/>
		<input type="text" name="last_name" placeholder="성"  value="${user.last_name }"><br/>
		<input type="number" name="user_age" placeholder="나이"  value="${user.user_age }"><br/>
		<input type="text" name="phone_num" placeholder="전화번호"  value="${user.phone_num }"><br/>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>