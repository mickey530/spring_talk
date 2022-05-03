<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	로그아웃 확인용 페이지
</h1>

	<form action="/user/deleteUser" method="get">
		<input type="text" name="uid" placeholder="아이디" value=""><br/>
		<input type="password" name="upw" placeholder="비밀번호" value=""><br/>
		<input type="submit" value="회원탈퇴">
	</form>
</body>
</html>