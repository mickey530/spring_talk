<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>


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
		
		<!-- 
		

						${userInfo.user_num }
						${userInfo.user_id }
						${userInfo.user_pw }
						${userInfo.user_name}
						${userInfo.last_name }
						${userInfo.user_age }
						${userInfo.phone_num }
						
		 -->
		 
		 
		<!-- 본인 -->
		<c:if test="${userInfo.user_id eq sid }">
		

			<button onclick="location.href='/user/logout'">로그아웃</button>
			<button onclick="location.href='/user/delete'">탈퇴</button>
			<button onclick="location.href='/user/getAllUsers'">전체 회원 조회</button>
			<button onclick="location.href='/user/update'">회원정보 수정</button>
			<button onclick="location.href='/user/userInfo/${user_id}'">회원정보 확인</button>
		</c:if>
		
		<!-- 타인 -->
		<c:if test="${userInfo.user_id ne sid }">
			<button onclick="location.href='/user/follow'">팔로우</button>
			<button onclick="location.href='/user/unfollow'">언팔</button>
			<button onclick="location.href='/user/ban'">밴</button>
			<button onclick="location.href='/user/unban'">언밴</button>
			<button onclick="location.href='/user/getAllUsers'">전체 회원 조회</button>
		</c:if>
</body>
</html>