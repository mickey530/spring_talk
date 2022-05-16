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
		<h1>멍 갤</h1>
		<table boarder="1" class="table table-hover">
		      <thead>
		        <tr>
		          <th>게시글 번호</th>
		          <th>글쓴이</th>
		          <th>제목</th>
		          <th>올린날짜</th>
		          <th>수정날짜</th>
		        </tr>
		      </thead>
		      <tbody>
		        <c:forEach var="dog" items="${dogList }">
		          <tr>
		          	<td><a href="/galldog/detail/${dog.board_num }">${dog.board_num }</a></td>
		            <td>${dog.writer }</td>
		            <td>${dog.board_title }</td>	            
		            <td>${dog.w_date }</td>
		            <td>${dog.m_date }</td>
		          </tr>
		        </c:forEach>
		      </tbody>
		    </table>
		    <a href="/galldog/insert" class="btn btn-warning">게시글 작성</a><hr/>
	</div>
</body>
</html>