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

	<sec:authorize access="isAuthenticated()">
			<h1>
				<sec:authentication property="principal.username"/>
			</h1>
			<tbody>
			
					<tr>
						<td><button onclick="location.href='/user/logout'">로그아웃</button></td>
						<td><button onclick="location.href='/user/delete'">탈퇴</button></td>
						<td><button onclick="location.href='/user/userInfo/${user_id}'">회원정보 확인</button></td>
					</tr>
			</tbody>
	</sec:authorize>
		<!-- 비로그인 -->
	<sec:authorize access="isAnonymous()">	
			
			
			<tbody>
			
					<tr>
						<td><button onclick="location.href='/user/login'">로그인</button></td>
						<td><button onclick="location.href='/user/insert'">회원가입</button></td>
					</tr>
			</tbody>
		</sec:authorize>
		</table>

</body>
</html>
