<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/post/insert" method="post">
		작성자 : <input type="text" name="writer">
		제목 : <input type="text" name="title">
		내용 : <input type="text" name="content">
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>