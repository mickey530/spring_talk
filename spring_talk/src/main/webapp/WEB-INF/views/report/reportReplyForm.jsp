<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		<input type="hidden" name="report_id" value="${login_id }"><br/>		
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<textarea name="report_reason" placeholder="신고 사유"></textarea><br/>
		<input type="submit" value="신고">
		<input type="reset" value="초기화">
	</form>
</body>
</html>