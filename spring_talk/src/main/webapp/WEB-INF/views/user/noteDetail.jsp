<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1 class="text text-primary">${note.note_num}번 쪽지</h1>
			<div class="row">
				<div class ="col-me-3">
					<input type = "text" class="form-control" value="${note.note_sender}"/><br/>
				</div>
			</div>
			<textarea rows ="10" class="form-control">${note.note_content}</textarea>
			<div class = "row">
				<div class="col-md-3">보낸날짜 : </div>
				<div class="col-me-3">${note.regdate}</div>
			</div>
	</div>
	
	<div class ="col-md-1">
		<form action="/user/noteDelete" method="post">
			<input type="hidden" value="${note.note_num}" name="note_num">
			 <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/> 
			<input type="submit" class="btn btn-danger" value="삭제">
		</form>
	</div>
	
	<div class="row">
		<div class="col=md-1">
			<a href="http://localhost:8181/user/noteList" class="btn brn-success">쪽지목록</a>
		</div>
	</div>
</body>
</html>