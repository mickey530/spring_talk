<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
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
					<th>밴 한 횟수</th>
					<th>밴 당한 횟수</th>
					<th>팔로워 수</th>
					<th>팔로우 한 수</th>
				</tr>
			</thead>	
			<tbody>
					<tr>
						<td id="user_num">${userInfo.user_num }</td>
						<td id="user_id">${userInfo.user_id }</td>
						<td id="user_pw">${userInfo.user_pw }</td>
						<td id="user_name">${userInfo.user_name}</td>
						<td id="last_name">${userInfo.last_name }</td>
						<td id="user_age">${userInfo.user_age }</td>
						<td id="phone_num">${userInfo.phone_num }</td>
						<td id="ban">0</td>
						<td id="baned">0</td>
						<td id="follower">0</td>
						<td id="followed">0</td>
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
		<c:if test="${userInfo.user_id eq sessionScope.user_id }">
		

			<button onclick="location.href='/user/logout'">로그아웃</button>
			<button onclick="location.href='/user/delete'">탈퇴</button>
			<button onclick="location.href='/user/getAllUsers'">전체 회원 조회</button>
			<button onclick="location.href='/user/update'">회원정보 수정</button>
			<button onclick="location.href='/user/userInfo/${user_id}'">회원정보 확인</button>
		</c:if>
		
		<!-- 타인 -->
		<c:if test="${userInfo.user_id ne sessionScope.user_id }">
			<button id="followBtn">팔로우</button>
			<button id="banBtn">밴</button>
			<button onclick="location.href='/user/getAllUsers'" id="getAllUsers">전체 회원 조회</button>
			 
		</c:if>
		
		
	<script>
	 
	// 팔로우 정보 가져오기
	function getFollow(){
		$.getJSON("/user/getFollow/${userInfo.user_id }" , function(data){
			$("#followed").html(data);
		});
	}

	// 팔로워 정보 가져오기
	function getFollower(){
		$.getJSON("/user/getFollower/${userInfo.user_id }" , function(data){
			$("#follower").html(data);
		});
	}

	// 밴 정보 가져오기
	function getBaned(){
		$.getJSON("/user/getBaned/${userInfo.user_id}" , function(data){
			console.log("getBaned : " + data);
			$("#baned").html(data);
		});
	}

	// 밴 한 정보 가져오기
	function getBan(){
		$.getJSON("/user/getBan/${userInfo.user_id}" , function(data){
			console.log("getBan : " + data);
			$("#ban").html(data);
		});
	}
	
	function getAllData(){
		getFollower()
		getFollow();
		getBan();
		getBaned();
	}
	
	getAllData();

	 // 밴 업데이트 버튼
	 $("#banBtn").on("click", function(){


		var jsonData = {
				user_id:'${sessionScope.user_id}',
				ban_id:$("#user_id").text()
		};
			
		$.ajax({
			type : 'post', 
			url : '/user/ban/${userInfo.user_id}',
			header : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PATCH" 
			},	
			contentType:"application/json", // json 자료를 추가로 입력받기 때문에
			data: JSON.stringify(jsonData),
			dataType : 'text',
			success : function(result){
				if(result == 'BAN SUCCESS'){
					$("#banBtn").text('언밴');
				}
				if(result == 'UNBAN SUCCESS'){
					$("#banBtn").text('밴');
				}
				console.log("result: " + result);
				getAllData(); //수정된 팔로우/밴 사항 업데이트
			}
		});
	 });

	 // 밴 업데이트 버튼
	 $("#followBtn").on("click", function(){

		var jsonData = {
				follower:'${sessionScope.user_id}',
				followed:$("#user_id").text(),
				favorite: 'N'
		};
		$.ajax({
			type : 'post', 
			url : '/user/follow/${userInfo.user_id}',
			header : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PATCH" 
			},	
			contentType:"application/json", // json 자료를 추가로 입력받기 때문에
			data: JSON.stringify(jsonData),
			dataType : 'text',
			success : function(result){
				if(result == 'FOLLOW SUCCESS'){
					$("#followBtn").text('언팔로우');
				}
				if(result == 'UNFOLLOW SUCCESS'){
					$("#followBtn").text('팔로우');
				}
				console.log("result: " + result);
				getAllData(); //수정된 팔로우/밴 사항 업데이트
			}
		});
	 });
	
	</script>
</body>
</html>