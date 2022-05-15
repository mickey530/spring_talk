<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	
		${postvo }
	
		<h1>${post.report_post_num }번 게시물 신고내역</h1>
		<div class="row">
			<div class="col-md-3">
				<input type="text" class="form-control" value="신고자: ${post.report_id }" readonly />
			</div>
		</div>
		<textarea readonly rows="10" class="form-control">사유 : ${post.report_reason }</textarea>
		
			<a href="/report/reportPostDelete/${post.report_pnum }" class="btn btn-danger">신고내역 삭제</a>		
			<a href="/report/reportPostList" class="btn btn-dark">게시물 신고목록</a>
			<a href="/post/delete/${postvo.post_num }" class="btn btn-danger">해당 게시물 삭제</a>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>		
	<script type="text/javascript">
	// 선택한 댓글 외부에서 사용 ///////////////////
	 	let select = "";
		var _csrf = '${_csrf.token}';
		var _csrf_header = '${_csrf.headerName}';	
		
	</script>	
</body>
</html>