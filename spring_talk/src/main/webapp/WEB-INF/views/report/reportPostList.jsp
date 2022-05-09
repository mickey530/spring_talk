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
	 <div class="container">
			<h1>게시글 신고 목록</h1>
			<table boarder="1" class="table table-hover">
		      <thead>
		        <tr>
		          <th>신고번호</th>
		          <th>신고일</th>
		          <th>신고한 게시물번호</th>
		          <th>신고자</th>
		          <th>신고 사유</th>
		        </tr>
		      </thead>
		      <tbody>
		        <c:forEach var="post" items="${postList }">
		          <tr>
		          	<td>${post.report_pnum }</td>
		            <td>${post.report_post_date }</td>
		            <td>${post.report_post_num }</td>
		            <td>${post.report_id }</td>
		            <td><a href="/report/reportPostDetail/${post.report_pnum }">${post.report_reason }</a></td>		
		          </tr>
		        </c:forEach>
		      </tbody>
		    </table>
		    <a href="/report/post" class="btn btn-warning">게시글 신고하기</a><hr/>	    
		 </div>
</body>
</html>