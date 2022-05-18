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
	<form action="/galldog/update" method="post">
		<input type="hidden" name="board_num" value="${dog.board_num }">
		<input type="hidden" value="${login_id }" readonly><br/>
		제목 : <input type="text" name="board_title" value="${dog.board_title }"><br/>
		내용 : <textarea name="board_content" rows="20" cols="100">${dog.board_content }</textarea><br/> 
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<input type="submit" value="수정완료">
	</form>
<script>
let login_id = '${login_id}';
console.log("login_id = " + login_id);

</script>
</body>
</html>