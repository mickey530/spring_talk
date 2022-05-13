<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<meta name="viewport" content="width=device-width, initial-scale=1">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {width:100%;}
	.container{width : 100%}
</style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.user_id" var="login_id"/>
</sec:authorize>

	<header class="justify-content-center">
	<h2>${user_id}'s Room</h2>
	
	<c:if test="${login_id ne 'null' }">
		팔로워 : <span id="followNum"></span>명<button id="follow">팔로</button>
		<button id="ban">응 차단~</button>
	</c:if>

	
	

	</header>
	<hr/>
	
	<div class="container m-1">
		<div class="post row">

		</div>
	</div>
	
	<button id="more" onclick="more()">more</button>
 
 
 </div>
<!-- jquery cdn 코드 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	

	<script type="text/javascript">
	
	var _csrf = '${_csrf.token}';
	var _csrf_header = '${_csrf.headerName}';
	
	/* 게시글 불러오는 로직 */
	let page_num = 0;
	let user_id = '${user.user_id}';
	var post = "";

	 function more(){
		page_num += 1;
		$.getJSON("/post/userfeed/" + user_id + "?page_num=" + page_num, function(data){

			console.log(data);
			
			$(data).each(
				function() {
					post += "<div class='col-4'><p data-post_num='" + this.post_num + "' class='post'>"
						+ "<a href='/post/detail/" + this.post_num + "'> "+ this.post_num +"</a> | <a href='/user/room/" + this.writer + "'>"+ this.writer +"</a><br/> " + this.title + " <br/> " + this.content
						+ "</p></div>";

				});
			$(".post").html(post);			
		});
	 }
	 more();
	 
	 // 팔로우 숫자
	 
	 let login_id = '${login_id}';
	 function followerNum(){
		$.getJSON("/user/getFollow/" + user_id, function(data){

			console.log(data)
		
			$("#followNum").html(data);			
		});
	 }
	 followerNum();

	 // 로딩 끝나고
		 
	 // 팔로우 기능
	 $("#follow").on("click", function(){
			$.ajax({
				type : 'post',
				url : '/user/follow',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					follower : login_id, // 로그인 아이디
					followed : user_id, // 팔로우할 아이디
					favorite : 'N'
				}),
	            beforeSend: function(xhr){
	                xhr.setRequestHeader(_csrf_header, _csrf);
	            },
				success : function(result){
					if(result == 'FOLLOW SUCCESS'){
						
					} followerNum() // 팔로우 수 재호출
				}
			}) 
		});
	 // 밴 기능
	 $("#ban").on("click", function(){
			$.ajax({
				type : 'post',
				url : '/user/ban',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					user_id : login_id, // 로그인 아이디
					ban_id : user_id // 차단할 아이디
				}),
				beforeSend: function(xhr){
	                xhr.setRequestHeader(_csrf_header, _csrf);
	            },
				success : function(result){
					if(result == 'OK'){
					}
				}
			});
		});
	 
		 
	 
	 </script>
	
	

</body>
</html>