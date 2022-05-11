<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<meta name="viewport" content="width=device-width, initial-scale=1">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="justify-content-center">
	${user.user_id}<br/>
	${user.user_name}' Room
	<button id="follow">팔로</button>
	<button id="ban">응 차단~</button>
	</header>
	<hr/>
	
	<div class="container">
		<div class="post row">

		</div>
	</div>
	
	<button id="more" onclick="more()">more</button>
 
 
 </div>
<!-- jquery cdn 코드 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	

	<script type="text/javascript">
	
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
						+ "<a href='/post/detail/" + this.post_num + "'> "+ this.post_num +"</a> | " + this.writer + " <br/> " + this.title + " <br/> " + this.content
						+ "</p></div>";

				});
			$(".post").html(post);			
		});
	 }
	 more();
	 
	 let login_id = '${sessionScope.user_id}';
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
				success : function(result){
					if(result == 'OK'){
					}
				}
			});
		});
	 
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
				success : function(result){
					if(result == 'OK'){
					}
				}
			});
		});
	 
	 
	 </script>
	
	

</body>
</html>