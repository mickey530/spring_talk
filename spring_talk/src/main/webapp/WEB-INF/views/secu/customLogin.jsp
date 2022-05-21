<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>title</title>
</head>
<body>
	<h2>
		<c:out value="${error}"></c:out>
		<c:out value="${logout}"></c:out>
	</h2>
	
	<form action="/secu/customLogin" method="post">
		아이디 : <input type="text" name="username" value=""><br>
		비밀번호 : <input type="password" name="password" value=""><br>
		<input type="submit" value="로그인">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	
	<c:if test="${url ne null }">
		<div id="naver_id_login">
			<a href="${url }"><img width="223" 
				src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
		</div>
	</c:if>
</body>
</html>
