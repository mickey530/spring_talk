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

<P>  The time on the server is ${serverTime}. </P>


<table border="1" class="table table">
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
					<tr>
						<td>${userInfo.user_num }</td>
						<td>${userInfo.user_id }</td>
						<td>${userInfo.user_pw }</td>
						<td>${userInfo.user_name}</td>
						<td>${userInfo.last_name }</td>
						<td>${userInfo.user_age }</td>
						<td>${userInfo.phone_num }</td>
						<td>${baned }</td>
						<td>${follower }</td>
						<td>${followed}</td>
					</tr>
			</tbody>
		</table>

</body>
</html>