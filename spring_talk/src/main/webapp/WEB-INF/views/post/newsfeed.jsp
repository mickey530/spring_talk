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

@font-face {
    font-family: 'CookieRunOTF-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
  }
  @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
  }  
  html, body {height:100%;}
  body {
    background-color: white;
    color: black;
    font-family: 'CookieRun-Regular';    
  }
  h3, .title {
      font-family: 'CookieRunOTF-Bold';
      margin: 0px;
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
header{
        background-color: white;
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
<header class="sticky-top p-3 text-black border-bottom row" style="margin:0px;">
<h3 class="col-11 px-0">IN n OUT</h3>
<a href="/post/insert" class="col-1 text-left text-black">+</a>
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
<button id="more" class="btn btn-outline-secondary btn-sm" onclick="more()">와 ! 게시물 ! 더보기!</button>

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
     <a href="/chatting/chat" class="col-2">채팅</a>
     <a href="/post/newsfeed" class="col-2">피드</a>
     <a href="/gall/gallList" class="col-2">커뮤</a>
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
					post += `<div><div class="py-2">
			            <img src="https://yt3.ggpht.com/ytc/AKedOLTi6w4E6985-QdVBbovBSsnCeTETyj0WomjM5IY8Q=s88-c-k-c0x00ffffff-no-rj" alt="mdo" width="32" height="32" class="rounded-circle cardHeader">
			            <a href="/user/room/\${this.writer}" class="nav-link px-2 link-dark fw-bold cardHeader">\${this.writer}</a>
			          </div>
			            <a href="/post/detail/\${this.post_num}"><img src="https://i.ytimg.com/vi/4k48gvdAsFY/maxresdefault.jpg" class="w-100" alt="..." border:radius=0px;></a>
			          <div class="card-menu py-2" style="margin-left: 0px;">
							<button class='btn btn-sm postLike' id='postNum_\${this.post_num}' data-post_num='\${this.post_num}'>♡\${this.like_count}</button> 댓글 <span class=replyCount>\${this.replycount}</span>개<br/>		
			          </div>

			          <div class="card-body">

			            <details>
			              <summary>
			                <p><strong>@\${this.writer }</strong> \${this.title}</p>
			              </summary>
			              <form class="card p-2">
			                <span>\${this.content}</span>
			                <hr/>
			                <p><a href="/post/detail/\${this.post_num}">댓글 <span class=replyCount>\${this.replycount}</span>개</a></p>
			                <div class='replyArea'></div>
			              </form>              
			            </details>
			            <div class="input-comment">
			              <div class="input-group">
			                <input type="text" class="form-control sm_font newReplyText" placeholder="댓글">
			                <button type="submit" class="btn btn-outline-secondary sm_font replyAddBtn">게시</button>
			              </div>
			            </div>
			          </div>
			          </div>`
						
						getReply(this.post_num);
 						isLike(this.post_num);
 				}
				// 댓글 불러오는 로직
				
			
			);
			$("#postList").html(post+reply);			
		});
	 }
	 more();
	 
	// 인피니티 스크롤
	    $(window).scroll(function(){ 
	    	var scrT = $(window).scrollTop();
		    	if(scrT >= $(document).height() - $(window).height()){
					more();
		    	}
		    	else { //아닐때 이벤트
	    		
	    		}
	    	})
	 
	 
	 let reply = "";
	 function getReply(post_num){
			$.getJSON("/replies/preview/" + post_num, function(data){

				reply = ""
				$(data).each(
					function() {
						reply += `<p><strong>@\${this.reply_id}</strong> \${this.reply_content}</p>`

						console.log(reply)	
	 				}			
				
				);
				$("#postNum_"+post_num).parent().siblings(".card-body").children("details").children(".card").children(".replyArea").append(reply);			
			});
			reply = "";
		 }
	 
	 
	 
	 
	 
	 
	 

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
			 let post_num = $(this).attr("data-post_num");
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
		let post_num = $(this).parent().parent().parent().siblings(".card-menu").children(".btn").attr("data-post_num");
		let replyArea = $(this).parent().parent().siblings("details").children(".card").children(".replyArea");
		
		let reply_count = replyArea.siblings("p").children().children(".replyCount");
		console.log(reply_count)
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
					replyArea.append(`<p><strong>@\${login_id}</strong> \${reply_content}</p>`)
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