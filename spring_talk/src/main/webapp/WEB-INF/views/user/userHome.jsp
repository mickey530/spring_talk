<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>
Get All Users</title>
</head>
<body>

	<sec:authorize access="isAnonymous()">	
			<h1>
				익명
			</h1>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
			<h1>
				인증된
			</h1>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_ALL')">
			<h1>
				평시의 권한
			</h1>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_MEMBER')">
			<h1>
				매니저의 권한
			</h1>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
			<h1>
				관리자의 권한
			</h1>
	</sec:authorize>
			
<table border="1" class="table">

		<c:if test="${user_id ne null }">
     	    	
			<h1>
				세션 : ${sessionScope.user_id }
			</h1>
			
			<tbody>
			
					<tr>
						<td><button onclick="location.href='/user/logout'">로그아웃</button></td>
						<td><button onclick="location.href='/user/delete'">탈퇴</button></td>
						<td><button onclick="location.href='/user/userInfo/${user_id}'">회원정보 확인</button></td>
					</tr>
			</tbody>
     	</c:if>
		<!-- 비로그인 -->
		<c:if test="${user_id eq null }">
			
			
			<tbody>
			
					<tr>
						<td><button onclick="location.href='/user/loginForm'">로그인</button></td>
						<td><button onclick="location.href='/user/insert'">회원가입</button></td>
					</tr>
			</tbody>
		</c:if>
		</table>

</body>
</html>
