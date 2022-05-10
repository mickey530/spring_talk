<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" >
		
		${replyvo }
	
		<h1>댓글 신고번호 - ${reply.report_reply_num }번 신고내역</h1>
		<div class="row">
			<div class="col-md-3">
				<input type="text" class="form-control" value="신고자: ${sessionScope.user_id }" readonly/>
			</div>
		</div>
		<textarea readonly rows="10" class="form-control">사유 : ${reply.report_reason }</textarea>
		
		<c:if test="${sessionScope.user_id eq reply.report_id }">
			<a href="/report/reportReplyDelete/${reply.report_reply_num }" class="btn btn-danger">삭제하기</a><hr/>
		</c:if>	
			<a href="/report/reportReplyList" class="btn btn-dark">댓글 신고목록</a>
		
	</div>
</body>
</html>