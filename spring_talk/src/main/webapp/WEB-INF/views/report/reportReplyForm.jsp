<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/report/reply" method="post">
		<input type="hidden" name="report_reply_num" value="${reply_num }"><br/>
		<input type="text" name="report_id" placeholder="신고자"><br/>		
		<textarea name="report_reason" placeholder="신고 사유"></textarea><br/>
		<input type="submit" value="신고">
		<input type="reset" value="초기화">
	</form>
</body>
</html>