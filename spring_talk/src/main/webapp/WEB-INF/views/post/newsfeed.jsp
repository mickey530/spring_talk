<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
  html, body {height:100%;}
  body {
    background-color: white;
    color: black;
  }
  #wrapper{
      height: auto;
      min-height: 100%;
      padding-bottom: 50px;
  }
  a{
	  text-decoration:none;
	  text-align:center;
	  color: black;
  }
.title-padding{
    padding:10px;
}
.cardHeader {
    display: inline-block;
}

.card-menu {
    margin-left: 2px;
}
.card-body {
    padding: 0px;
}
details > summary {
    list-style: none;
    text-align: start;
}
  
details > summary::-webkit-details-marker {
    display: none;
}
summary > p {
    text-align: start;
}
.card {
    font-size: 12px;
}

footer {
        display: flex !important;
        position: fixed;
        bottom: 0px;
        width: 100%;
        height: 50px;
        font-size: 15px;
        align-items: center;
        background-color: white;
        z-index: 2;
        }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.user_id" var="login_id"/>
</sec:authorize>
<!-- 대충 헤더임 -->

<div id="wrapper">
<header class="sticky-top p-3 bg-primary text-white border-bottom row" style="margin:0px;">
<span class="col-11">대충 헤더영역 : 뉴스피드</span>
<a href="/post/insert" class="col-1 text-left text-white">+</a>
</header>
<div class="container">




<%-- 
<div class="row justify-content-center">
<c:forEach var="post" items="${postList }">
	<div class="card" style="width: 100%;">
	  <div class="card-title">${post.post_num } | ${post.writer } </div>
	
	  <!-- <img src="#" class="" alt="사진 들어갈 자리"> -->
	  <div class="card-body">
	  	<details>
	    <summary class="card-title">${post.title }</summary>
	    <p class="card-text">${post.content }</p>
	  	</details>
	  </div>
	</div>
</c:forEach>
</div>
 --%>



<div id="postList">

</div>
<button id="more" onclick="more()">more</button>

</div> <!-- container -->

<!-- 
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">댓글 입력</label>
  <textarea class="form-control newReplyText" id="exampleFormControlTextarea1 " rows="3">
  </textarea>
  <button class='replyAddBtn'>ADD REPLY</button>
</div>

 -->
</div> <!-- wrapper -->

<footer class="mx-0 py-2 w-100 border-top row justify-content-between">
      <a href="/user/follow" class="col-2">팔로우</a>
      <a href="#" class="col-2">채팅</a>
      <a href="/post/newsfeed" class="col-2">피드</a>
      <a href="#" class="col-2">커뮤</a>
      <a href="/user/room/${login_id }" class="col-2">마이룸</a>
</footer>
 

<!-- jquery cdn 코드 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	

	<script type="text/javascript">
	
	// csrf 토큰 정의
	let _csrf = '${_csrf.token}';
    let _csrf_header = '${_csrf.headerName}';
    // 로그인 아이디 정의
    let login_id = '${login_id}';
    
    
    
    
	/* 게시글 불러오는 로직 */
	let page_num = 0;
	var post = "";

	 function more(){
		page_num += 1;
		$.getJSON("/post/newsfeed?page_num=" + page_num, function(data){
			post = $("#postList").html();			

			console.log(data);
			
			$(data).each(
				function() {
					post += "<div data-post_num='" + this.post_num + "' class='post'>"
						+ "<a href='/post/detail/" + this.post_num + "'>"+ this.post_num +"</a> | <a href='/user/room/" + this.writer + "'>"+ this.writer +"</a><br/> " + this.title + " <br/> " + this.content
						+ "<br/><button class='btn btn-sm postLike' id='postNum_"+ this.post_num +"'>♡"+this.like_count+"</button> 댓글 <span class=replyCount>" + this.replycount+ "</span>개<br/>"
						+ "<input type='text' class='newReplyText'>"
						+ "<button class='replyAddBtn'>ADD REPLY</button></div><hr/>";
						
						
 						isLike(this.post_num);
 				}			
			
			);
			$("#postList").html(post);			
		});
	 }
	 more();

		// 좋아요 유무 확인	
 	  function isLike(post_num){
		 $.ajax({
				type : 'post',
				url : '/post/islike',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				beforeSend: function(xhr){
	                xhr.setRequestHeader(_csrf_header, _csrf);
	            },
				data : JSON.stringify({
					post_num : post_num,
					user_id : login_id
				}),
				success : function(result){
					 let thisPost = $("#postNum_"+ post_num);
					 let likeNum = parseInt(thisPost.html().substr(1, 1)); // 왜 없어도 돌아감?
					 thisPost.html("♡" + likeNum) // 왜 없어도 돌아감?
					if(result != ""){
						thisPost.addClass("post-liked");
						thisPost.removeClass("post-like");
						thisPost.addClass("btn-danger");
						thisPost.removeClass("btn-outline-danger");
					} else{
						thisPost.addClass("post-like");
						thisPost.removeClass("post-liked");
						thisPost.addClass("btn-outline-danger");
						thisPost.removeClass("btn-danger");
					}
					
				}
			});
	 }
	  
	  
		


	 
		// 좋아요 버튼 클릭 시
		 $("#postList").on("click", ".postLike", function(){
			 if(login_id == ""){
				 var result = confirm("로그인이 필요한 기능입니다. \n로그인 페이지로 이동하시겠습니까?")
				 if(result){
					 location.replace('/user/login')
				 }
			 } else{
			 let post_num = $(this).parent()[0].dataset.post_num;
			 let thisPost = $("#postNum_"+ post_num);
			 let likeNum = parseInt(thisPost.html().substr(1, 1));
/* 			 if(thisPost.hasClass("post-liked")){
				 thisPost.html("♡" + (likeNum - 1))
			 } if(thisPost.hasClass("post-like")){
				 thisPost.html("♡" + (likeNum + 1))
			 } */
 			 if($(this).hasClass("post-liked")){
				 $(this).html("♡" + (likeNum - 1))
			 } if($(this).hasClass("post-like")){
				 $(this).html("♡" + (likeNum + 1))
			 }
			 console.log(post_num);
				$.ajax({
					type : 'post',
					url : '/post/like',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					beforeSend: function(xhr){
		                xhr.setRequestHeader(_csrf_header, _csrf);
		            },
					data : JSON.stringify({
						post_num : post_num,
						user_id : login_id
					}),
					success : function(result){
						if(result == 'OK'){
 							isLike(post_num);
						}
					}
				});
			 }});
	 

	  
	  // 댓글달기
	 $("#postList").on("click", ".replyAddBtn", function(){
		 if(login_id == ""){
			 var result = confirm("로그인이 필요한 기능입니다. \n로그인 페이지로 이동하시겠습니까?")
			 if(result){
				 location.replace('/user/login')
			 }
		 } else{
		let post_num = $(this).parent()[0].dataset.post_num;
		console.log(post_num);
		let reply_count = $(this).siblings(".replyCount");
		/* reply_count.html(parseInt(reply_count.html())+1); */
		let reply_content = $(this).siblings(".newReplyText").val();
		$.ajax({
			type : 'post',
			url : '/replies',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			beforeSend: function(xhr){
	               xhr.setRequestHeader(_csrf_header, _csrf);
	           },
			data : JSON.stringify({
				post_num : post_num,
				reply_id : login_id,
				reply_content : reply_content
			}),
			success : function(result){
				if(result == 'OK'){
					alert("등록되었습니다.");
					reply_count.html(parseInt(reply_count.html())+1);
					refresh();
				}
				
			},
			/* error도 설정 가능 */
			error: function(){
				alert("error")
			}
			
		});
		
	}});
	  
	function refresh(){
	 $(".newReplyText").val("");	 
	}
	

	  
	  
	 </script>




</body>
</html>