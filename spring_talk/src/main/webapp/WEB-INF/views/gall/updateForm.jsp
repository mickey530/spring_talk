<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/gall/updateForm" method="post">
		<input type="hidden" name="post_num" value="${post.post_num }">
		작성자 : <input type="text" value="${gall.writer }" readonly><br/>
		제목 : <input type="text" name="title" value="${gall.board_title }"><br/>
		내용 : <input type="text" name="content" value="${gall.board_content }"><br/>
		<input type="submit" value="등록완료">
	</form>
</body>
</html>