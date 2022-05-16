<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/gall/insert" method="post">
		작성자 : <input type="text" name="writer" placeholder="작성자"><br/>
		제목 : <input type="text" name="title" placeholder="제목"><br/>
		본문 : <textarea name="content"  rows="20" cols="100" placeholder="본문"></textarea><br/>
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>