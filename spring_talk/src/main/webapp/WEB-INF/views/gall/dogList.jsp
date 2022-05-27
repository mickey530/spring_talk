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
		          <th>제목</th>
		          <th>글쓴이</th>
		          <th>올린날짜</th>
		          <th>수정날짜</th>
		          <th>조회수</th>
		        </tr>
		      </thead>
		      <tbody>
		        <c:forEach var="dog" items="${dogList }">
		          <tr>
		          	<td>${dog.board_num}</td>		  
		            <td><a href="/gall/detail/${gall_name}/${dog.board_num}">${dog.board_title}</a></td>
		            <td>${dog.writer }</td>	            
		            <td>${dog.w_date }</td>
		            <td>${dog.m_date }</td>
		            <td>${dog.hit }</td>
		          </tr>
		        </c:forEach>
		      </tbody>
		    </table>
		    <a href="/gall/insert/${gall_name}" class="btn btn-warning">게시글 작성</a><hr/>
		    

		    
		    <!-- 이전 페이지 버튼 보일지 결정하는 부분 -->
		    <ul class="pagination justify-content-center">		  
		  	<c:if test="${pageMaker.prev }">
		  		<li class="page-item">
		  			<a class="page-link" href="/gall/list/gall_dog?pageNum=${pageMaker.startPage - 1}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">이전</a>
		  		</li>
		  	</c:if>
		  	
		  	<!-- 밑에 깔아줄 버튼들 -->
		  	<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
    			<li class="page-item ${pageMaker.cri.pageNum eq idx ? 'active' : '' }">
    				<a class="page-link" href="/gall/list/gall_dog?pageNum=${idx }&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${idx }</a>
    			</li>
    		</c:forEach>
    		
		    <c:if test="${pageMaker.next }">
		  		<li class="page-item">
		  			<a class="page-link" href="/gall/list/gall_dog?pageNum=${pageMaker.endPage + 1}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">다음</a>
		  		</li>
		  	</c:if>
		  			  
		  </ul>
		  <div class="row">
		  	<!-- 검색창 부분 -->
		  	<form action="/gall/list/gall_dog" method="get">
		  		<!-- select태그를 이용해서 클릭해 검색조건을 선택하도록 처리 -->
		  		<select name="searchType">		  		
		  			<!-- 검색조건을 option태그를 이용해 만들기 -->
		  			<option value="n">-</option>
		  			<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected' : ''}>제목</option>
		  			<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected' : ''}>글쓴이</option>
		  		</select>
		  		<input type="text" name="keyword" placeholder="검색어" value="${pageMaker.cri.keyword }">
		  		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		  		<input type="submit" value="검색">
		  	</form>
		  </div>
	</div>
</body>
</html>