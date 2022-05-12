<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/updateUser" method="get">
		<input type="hidden" name="user_num" value="${userInfo.user_num }">
		<input type="text" name="id" placeholder="아이디" value="${userInfo.user_id }"><br/>
		<input type="text" name="pw" placeholder="비밀번호" value="${userInfo.user_pw }"><br/>
		<input type="text" name="user_name" value="${userInfo.user_name }"><br/>
		<input type="text" name="last_name" value="${userInfo.last_name }"><br/>
		<input type="number" name="age" value="${userInfo.user_age }"><br/>
		<input type="submit" value="정보 수정">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	</form>
</body>
</html>