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

	<form action="/report/reply" method="post">
		<input type="hidden" name="report_reply_num" value="${reply_num }"><br/>
		<input type="text" name="report_id" placeholder="${login_id }"><br/>		
		<textarea name="report_reason" placeholder="신고 사유"></textarea><br/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" value="신고">
	</form>
</body>
</html>