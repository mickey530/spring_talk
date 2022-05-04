<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	
<html>

<head>
	<title>Home</title>
</head>
<body>

	<form action="/user/login" method="get">
		<input type="text" name="uid" placeholder="아이디" value="${user.user_id }"><br/>
		<input type="password" name="upw" placeholder="비밀번호" value="${user.user_pw }"><br/>
		<input type="submit" value="로그인">
	</form>


</body>
</html>