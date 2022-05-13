<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authentication property="principal.user.user_id" var="login_id"/>
	<form action="/post/insert" method="post">
		<input type="hidden" name="writer" value="${login_id }" placeholder="작성자">
		<input type="text" name="title" placeholder="제목"><br/>
		<textarea name="content" placeholder="내용"></textarea><br/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>