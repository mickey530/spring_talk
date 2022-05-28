<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>운영자</h1>
	<hr/>
	
	<form action="/gallList" method="post">
		<input type="text" name="gall_name" placeholder="커뮤니티명"/>
		<input type="text" name="table_name" placeholder="테이블명(gall_?)"/>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<input type="submit" value="리스트 생성">
	</form>
	
	<form action="/create/{gall_name }" method="post">
		<input type="text" name="gall_name"/>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<input type="submit" value="테이블 생성">
	</form>
</body>
</html>