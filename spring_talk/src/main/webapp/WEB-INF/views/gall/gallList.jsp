<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  html, body {height:100%;}
  body {
    background-color: white;
    color: black;
  }
  #wrapper{
      height: auto;
      min-height: 100%;
      padding-bottom: 50px;
  }
  a{
	  text-decoration:none;
	  text-align:center;
	  color: black;
  }
  footer {
        display: flex !important;
        position: fixed;
        bottom: 0px;
        width: 100%;
        height: 50px;
        font-size: 15px;
        align-items: center;
        background-color: white;
        z-index: 2;
  }
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<header class="sticky-top p-3 bg-primary text-white border-bottom row" style="margin:0px;">
			<span class="col-11">IN & OUT 커뮤니티</span>
		</header>
		
	<div class="container row">
		<table boarder="1" class="table table-hover">
		      <thead>
		        <tr>
		          <th>커뮤니티 이름</th>
		          <th>테이블명</th>
		          <th>관리</th>
		        </tr>
		      </thead>
		      <tbody>
		        <c:forEach var="gall" items="${gall }">
		          <tr>
		          	<td><a href="/gall/list/${gall.table_name }">${gall.gall_name }</a></td>
		          	<td>${gall.table_name }</td>  
		          	<td><form action="/delete/${gall.table_name}" method="post"><input type="submit" value="삭제"><input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/></form></td>
		          </tr>
		        </c:forEach>
		      </tbody>
		    </table>
		    <a href="/admin">생성하러가기</a>
	</div> 
	
	</div> <!-- wrapper -->
	
	<footer class="mx-0 py-2 w-100 border-top row justify-content-between">
	     <a href="/user/follow" class="col-2">팔로우</a>
	     <a href="/chatting/chat" class="col-2">채팅</a>
	     <a href="/post/newsfeed" class="col-2">피드</a>
	     <a href="/gall/gallList" class="col-2">커뮤</a>
	     <a href="/user/room/${login_id }" class="col-2">마이룸</a>
	</footer>	
	
</body>
</html>