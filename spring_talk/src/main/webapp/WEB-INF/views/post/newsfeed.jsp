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
  @media (min-width: 768px) {
  .container{
        max-width: 540px;
  }
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

#img{
	position: relative;
	width: 100%;
	padding-bottom: 100%;
	overflow: hidden;
}
.upload_img{
	position: absolute;
	top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
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

<div id="postList">

</div>
<button id="more" class="btn btn-outline-secondary btn-sm" onclick="more()">와 ! 게시물 ! 더보기!</button>

</div> <!-- container -->

</div> <!-- wrapper -->

<footer class="mx-0 py-2 w-100 border-top row justify-content-between">
	<a href="/user/follow" class="col-2">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
          <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
        </svg>	
	</a>
	<a href="/user/chatList/${login_id }" class="col-2">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
          <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
        </svg>	
	</a>
	<a href="/post/newsfeed" class="col-2">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-terminal" viewBox="0 0 16 16">
          <path d="M6 9a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3A.5.5 0 0 1 6 9zM3.854 4.146a.5.5 0 1 0-.708.708L4.793 6.5 3.146 8.146a.5.5 0 1 0 .708.708l2-2a.5.5 0 0 0 0-.708l-2-2z"/>
          <path d="M2 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h12z"/>
        </svg>	
	</a>
	<a href="/gall/gallList" class="col-2">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
          <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
        </svg>	
	</a>
	<a href="/user/room/${login_id }" class="col-2">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
          <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
        </svg>	
	</a>
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
					post += "<div><div class='py-2'>"
			             + "<img src='https://yt3.ggpht.com/ytc/AKedOLTi6w4E6985-QdVBbovBSsnCeTETyj0WomjM5IY8Q=s88-c-k-c0x00ffffff-no-rj' alt='mdo' width='32' height='32' class='rounded-circle cardHeader user_id_"+this.writer+"'>"
			             + "<a href='/user/room/" + this.writer + "' class='nav-link px-2 link-dark fw-bold cardHeader'>" + this.writer + "</a>"
			             + "</div>"
			             + "<div id='img' href='/post/detail/" + this.post_num + "'></div>"
			          	 + "<div class='card-menu py-2' style='margin-left: 0px;'>"
						 + "<button class='btn btn-sm postLike' id='postNum_" + this.post_num + "' data-post_num='" + this.post_num + "'>♡" + this.like_count + "</button><a href='/post/detail/" + this.post_num + "'> 댓글 <span class=replyCount>" + this.replycount + "</span>개</a><br/>"	
			          	 + "</div>"

			         	 + "<div class='card-body'>"

			             + "<details>"
			             + "<summary>"
			             + "<p><strong>@" + this.writer + "</strong> " + this.title + "</p>"
			             + "</summary>"
			             + "<form class='card p-2'>"
			             + "<span>" + this.content + "</span>"
			             + "<hr/>"
			             + "<p><a href='/post/detail/" + this.post_num + "'>댓글 <span class=replyCount>" + this.replycount + "</span>개</a></p>"
			             + "<div class='replyArea' id='"+ this.post_num+"_reply'></div>"
			             + "</form>"              
			             + "</details>"
			           	 + "<div class='input-comment'>"
			             + "<div class='input-group'>"
			             + "<input type='text' onkeyup='enterkey(" + this.post_num + ")'  class='form-control sm_font newReplyText' placeholder='댓글'>"
			             + "<button type='submit' class='btn btn-outline-secondary sm_font replyAddBtn'>게시</button>"
			             + "</div>"
			             + "</div>"
			          	 + "</div>"
			          	 + "</div>"

			          	getImages(this.post_num);
						getReply(this.post_num);
 						isLike(this.post_num);
 				}
				
			
			);
			$("#postList").html(post+reply);		


			$(data).each(
				function() {
					var src = $(".user_id_"+this.writer).attr("src");
					if(src == "https://yt3.ggpht.com/ytc/AKedOLTi6w4E6985-QdVBbovBSsnCeTETyj0WomjM5IY8Q=s88-c-k-c0x00ffffff-no-rj"){
						load_blob_img(this.writer)
					}
				});
				/*  */
			
 			ad();

		});
	 }
	 more();


	 function setImage(data,user_id){
		 $(".user_id_"+user_id).attr({ src: data });
	 }
	 function load_blob_img(user_id) {
		 	
		 		$.ajax({
		 			url: '/user/getByte/'+user_id,
		 			processData: false,
		 			contentType: false,
		 			type:"get",
		 			beforeSend : function(xhr) {
		 			 xhr.setRequestHeader(_csrf_header, _csrf);
		 			},
		 			success: function(result){
			 			setImage(data.responseText,user_id)
		 			},
		 			
		 		}).fail(function(data, textStatus, errorThrown){
		 			setImage(data.responseText,user_id)
		 		}); // ajax

		 };
		 
	 
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
				console.log($("#"+post_num+"_reply"))
				 $("#"+post_num+"_reply").append(reply); 			
				/* $("#postNum_"+post_num).parent().find(".replyArea").append(reply); */	
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
					 /* let likeNum = parseInt(thisPost.html().substr(1, 1)); // 왜 없어도 돌아감?
					 thisPost.html("♡" + likeNum) // 왜 없어도 돌아감? */
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
		console.log("!!!!"+post_num)
		let replyArea = $("#"+post_num+"_reply");
		let reply_count = replyArea.siblings("p").children().children(".replyCount");

		/* reply_count.html(parseInt(reply_count.html())+1); */
		let reply_content = $(this).siblings(".newReplyText").val();
		console.log("여기 어디? " + reply_content)
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
					
					// 윗 댓글 개수
					reply_count = $("#postNum_" + post_num).parent().children("a").children()
					reply_count.html(parseInt(reply_count.html())+1);
					
					// 아래 댓글 개수
					reply_count = replyArea.siblings("p").children("a").children();
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
	
	let inputArea = "";
	$("#postList").on("click", ".newReplyText", function(){
		inputArea = $(this);
		console.log(inputArea);
	});
	
	function enterReply(post_num){
		 if(login_id == ""){
			 var result = confirm("로그인이 필요한 기능입니다. \n로그인 페이지로 이동하시겠습니까?")
			 if(result){
				 location.replace('/user/login')
			 }
		 } else{
		/* let post_num = $(this).parent().parent().parent().siblings(".card-menu").children(".btn").attr("data-post_num"); */
		let replyArea = $(this).parent().parent().siblings("details").children(".card").children(".replyArea");
		let reply_count = replyArea.siblings("p").children().children(".replyCount");
		console.log(reply_count)

		/* reply_count.html(parseInt(reply_count.html())+1); */
		let reply_content = inputArea.val();
		console.log("댓글내용"+reply_content);
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
					
					console.log(replyArea);
					replyArea = $("#"+post_num+"_reply");
					replyArea.append("<p><strong>@" + login_id + "</strong> " + reply_content + "</p>")
					
					// 윗 댓글 개수
					reply_count = $("#postNum_" + post_num).parent().children("a").children()
					reply_count.html(parseInt(reply_count.html())+1);
					
					// 아래 댓글 개수
					reply_count = replyArea.siblings("p").children("a").children();
					reply_count.html(parseInt(reply_count.html())+1);
					refresh();
				}
				
			},
			/* error도 설정 가능 */
			error: function(){
				alert("error")
			}
			
		});
		
	}}
	
	function enterkey(post_num) {
        if (window.event.keyCode == 13) {
        	console.log(post_num);
 
             // 엔터키가 눌렸을 때 실행할 내용
              enterReply(post_num);
        }
	}
	
	
	// 이미지 콘텐츠 관련 ////////////////////////////////////////////////////////////////////////
	  function getImages(post_num){
		  console.log("post_num");
		  console.log(post_num);
		  

			$.getJSON("/post/getImages/" + post_num, function(data){
				
				if(data != ""){
				
				console.log(data);
				
				var imgData = "";

				$(data).each(
					function() {

						var fileCallPath = this.upload_path + "/" + this.uuid + "_" + this.file_name;
						
						fileCallPath = encodeURIComponent(this.upload_path + "/s_" + this.uuid + "_" + this.file_name);
						console.log("fileCallPath2");
						console.log(fileCallPath);
						imgData += "<img class='upload_img w-100' src='/post/display?fileName="+ fileCallPath + "'>"
							
							
							
					});
				$("#postNum_"+post_num).parent().siblings("#img").prepend(imgData);	
				
				} else{
					$("#postNum_"+post_num).parent().siblings("#img").remove();	
					let cardMenu = $("#postNum_"+post_num).parent(); // 포스트 메뉴바
					let insert = $("#postNum_"+post_num).parent().siblings(".card-body").children("details").children("summary"); // 들어갈 위치
					insert.append(cardMenu); // 위치 변경
					$("#postNum_"+post_num).parent().siblings("p").children("strong").remove();
					
				}
				
			});
	 };
	
	// 광고글 불러오는 메서드
	function ad(){
		let ad_num = 1;
		$.getJSON("/post/ad?ad_num=" + ad_num, function(data){
			post_ad = "";
			console.log(data);
			
			$(data).each(
				function() {
					post_ad += `<sec:authorize access="!hasRole('ROLE_MEMBER')">`;

					post_ad += "<div><div class='py-2'>"
			             + "<img src='https://yt3.ggpht.com/ytc/AKedOLTi6w4E6985-QdVBbovBSsnCeTETyj0WomjM5IY8Q=s88-c-k-c0x00ffffff-no-rj' alt='mdo' width='32' height='32' class='rounded-circle cardHeader'>"
			             + "<a href='/user/room/" + this.company + "' class='nav-link px-2 link-dark fw-bold cardHeader'>" + this.company + "</a>"
			             + "</div>"
			             + "<div id='img'class='border-top border-bottom' href='/post/detail/" + this.ad_num + "'><a href='/pay'><img src='/resources/logo.png' class='upload_img w-100'></a></div>"
			          	 + "<div class='card-menu py-2' style='margin-left: 0px;'>"
			          	 + "</div>"

			         	 + "<div class='card-body'>"

			             + "<p><strong>@" + this.title + "</strong> <br>"
			            
			             + "<span><a href='/pay'>" + this.content + "</a></span>"
			             + "<hr/>"
			   
			             + "</div>"
			          	 + "</div>"
					
			         post_ad += `</sec:authorize>`
 				}
				
			
			);
			$("#postList").append(post_ad);			

		});
	 }
	
	 </script>




</body>
</html>