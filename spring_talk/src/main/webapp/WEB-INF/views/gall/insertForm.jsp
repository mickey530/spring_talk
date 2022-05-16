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
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.user.user_id" var="login_id"/>
	</sec:authorize>
	
	<form action="/galldog/insert" method="post">
		<input type="hidden" name="writer" value="${login_id }"><br/>
		<input type="text" name="board_title" placeholder="제목"><br/>
		<textarea name="board_content" 	 placeholder="내용"></textarea><br/>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>