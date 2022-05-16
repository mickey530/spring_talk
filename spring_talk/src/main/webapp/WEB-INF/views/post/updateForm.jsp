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

	<form action="/post/update" method="post">
		<input type="hidden" name="post_num" value="${post.post_num }">
		작성자 : <input type="text" value="${login_id }" readonly><br/>
		제목 : <input type="text" name="title" value="${post.title }"><br/>
		내용 : <input type="text" name="content" value="${post.content }"><br/>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<input type="submit" value="수정완료">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	</form>
<script>
let login_id = '${login_id}';
console.log("login_id = " + login_id);

</script>
</body>
</html>