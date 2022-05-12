<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/post/update" method="post">
		<input type="hidden" name="post_num" value="${post.post_num }">
		작성자 : <input type="text" value="${post.writer }" readonly><br/>
		제목 : <input type="text" name="title" value="${post.title }"><br/>
		내용 : <input type="text" name="content" value="${post.content }"><br/>
		<input type="submit" value="수정완료">
	</form>
</body>
</html>