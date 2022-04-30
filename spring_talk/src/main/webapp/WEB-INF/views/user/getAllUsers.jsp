<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
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
				</tr>
			</thead>	
			<tbody>
			
			<c:forEach var = "userInfo" items="${userInfoList}">
					<tr>
						<td><p><c:out value="${userInfo.user_name}"/></p></td>
						<td><p><c:out value="${userInfo.user_id}"/></p></td>
						<td><p><c:out value="${userInfo.user_pw}"/></p></td>
						<td><p><c:out value="${userInfo.user_name}"/></p></td>
						<td><p><c:out value="${userInfo.last_name}"/></p></td>
						<td><p><c:out value="${userInfo.user_age}"/></p></td>
						<td><p><c:out value="${userInfo.phone_num}"/></p></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

</body>
</html>
