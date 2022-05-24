<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/noteInsert" method="post">
		보내는이 : <input type ="text" name="note_sender"><br/>
		받는이  : <input type ="text" name="note_recipient"><br/>
		본 문 : <textarea name ="note_content" rows="20" cols="50"></textarea>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<input type ="submit" value="전송"><input type ="reset" value="초기화"> 
	</form>
</body>
</html>