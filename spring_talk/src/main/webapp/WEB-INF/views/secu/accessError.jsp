<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>접근권한 없음</title>
</head>
<body>
<h1>
	접근 실패!
</h1>

<h2>
	<c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"></c:out>
</h2>

<h2>
	<c:out value="${accessDenied}"></c:out>
</h2>
</body>
</html>
