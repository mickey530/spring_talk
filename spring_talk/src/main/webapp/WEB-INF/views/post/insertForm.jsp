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
		<input type="text" name="writer" placeholder="작성자"><br/>
		<input type="text" name="title" placeholder="제목"><br/>
		<textarea name="content" placeholder="내용"></textarea><br/>
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>