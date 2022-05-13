<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
	<title>
Get All Users</title>
</head>
<body>
<h1>

		<sec:authorize access="isAuthenticated()">
			
			<sec:authentication property="principal" var="princ"/>
				환영합니다 ${princ.user.user_id}님
		</sec:authorize>
Get All Users
</h1>


<table border="1" class="table">
			<thead>
				<tr>
					<th>유저번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>성</th>
					<th>나이</th>
					<th>전화번호</th>
					<th>밴 당한 횟수</th>
					<th>팔로워 수</th>
					<th>팔로우 한 수</th>
				</tr>
			</thead>	
			<tbody>
			
			<c:forEach var = "userInfo" items="${userInfoList}">
					<tr onclick="location.href='/user/userInfo/${userInfo.user_id}'">
							
						<td><p><c:out value="${userInfo.user_num}"/></p></td>
						<td><p><c:out value="${userInfo.user_id}"/></p></td>
						<td><p><c:out value="${userInfo.user_pw}"/></p></td>
						<td><p><c:out value="${userInfo.user_name}"/></p></td>
						<td><p><c:out value="${userInfo.last_name}"/></p></td>	
						<td><p><c:out value="${userInfo.user_age}"/></p></td>
						<td><p><c:out value="${userInfo.phone_num}"/></p></td>
						<td><p><c:out value="${ban_service.baned(userInfo.user_id)}"/></p></td>
						<td><p><c:out value="${follow_service.countFollowed(userInfo.user_id)}"/></p></td>
						<td><p><c:out value="${follow_service.countFollower(userInfo.user_id)}"/></p></td>
					
					</tr>
				</c:forEach>
			</tbody>
		</table>

</body>
</html>
