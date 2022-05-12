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
		<input type="checkbox" name="roles" value="ROLE_ALL">평회원 권한 &nbsp;&nbsp;&nbsp;
		<input type="submit" value="회원가입">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	</form>
</body>
</html>