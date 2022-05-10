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
	
	<form action="/secu/customLogout" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" value="로그아웃">
	</form>
</body>
</html>
