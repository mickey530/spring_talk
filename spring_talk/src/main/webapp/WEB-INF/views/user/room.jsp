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

 #wrapper{
    height: auto;
    min-height: 100%;
    padding-bottom: 50px;
 }
 
 #profile_img{
    flex-grow: 1;
	float:left
}
 
 .menulist_ul{
 
    padding: 0px;
 }
 .menulist{
    font-size: 16px;
    margin-right: 40px;
    list-style: none;
 }
 .menu{
    text-align: left;
 	display:block
 }
 
 #sideMenu > ul > li > a{
 	color: white;
 }
 a{
 	text-decoration:none;
 	text-align:center;
  	color: black;	
 	}
 	
 	#sideMenu > ul{
 		display: none;
 	}
 	
 	#sideMenu > ul > li{
 		list-style: none;
 	}
 	
 	#modDiv{width: 100%;max-width: 600px;
margin: 0 auto;
padding:10px;
box-sizing: border-box;
background-color: blanchedalmond;}

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
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.user_id" var="login_id"/>
</sec:authorize>

<div id="wrapper">
	<header class="sticky-top p-3 bg-primary text-white border-bottom row" style="margin:0px;">
		<span class="col-11">${user_id }'s room</span>
		<a href="/post/insert" class="col-1 text-left text-white">+</a>
	</header>	


<div class="container">

	<div id="profile_img">
		<div>
			<button title="프로필 사진 추가">
				<img alt="프로필 사진 추가" id="user_img" src="/resources/file.png">
			</button>
		</div>
	
	<section class="profile_section">
		<div class="wrap_info">
			<h2 id="user_id">${user.user_id}</h2>
			
			<ul class="menulist_ul ">
				
				
				<sec:authorize access="isAuthenticated()">
						
				<sec:authentication property="principal" var="princ"/>
					<li class="menulist">
						<a href="/user/update?uid=${princ.username}" tabindex="0">
							<div class="menu">
							프로필 편집 <span class="profile" title="0"></span>
							</div>
						</a>
					</li>
				</sec:authorize>
				<li class="menulist">
					<div class="menu">팔로워 <span class="follower" title="0">0</span>
					</div></a>
				</li>
				<li class="menulist">
					<div class="menu ">
						팔로우 <span class="followed">0</span>
					</div>
				</li>
				<li class="menulist">
					<div class="menu ">
						연락처 : <span class="phone_num">0</span>
					</div>
				</li>
				<li class="menulist">
					<div class="menu ">
						나이 <span class="user_age">0</span>
					</div>
				</li>
			</ul>
		</div>
	</section>
	</div>
	
	<c:if test="${login_id ne 'null' && login_id ne user.user_id}">
		팔로워 : <span id="followNum"></span>명<button id="follow">팔로</button>
		<button id="ban">응 차단~</button>
	</c:if>
	
	
	<hr/>
	
	<div class="container">
		<div class="post row">
	
		</div>
	
	<hr/>
	<button id="more" onclick="more()">more</button>
	

	</div>

</div>
</div>

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

	 function setImage(data){
	     const previewImage = document.getElementById("user_img")
	     previewImage.src = data
	 }

	 function load_blob_img() {

	 	console.log("byte")
	 	
	 	
	 		$.ajax({
	 			url: '/user/getByte/${user.user_id}',
	 			processData: false,
	 			contentType: false,
	 			type:"get",
	 			beforeSend : function(xhr) {
	 			 xhr.setRequestHeader(_csrf_header, _csrf);
	 			},
	 			success: function(result){
		 			console.log("data")
		 			console.log(data.responseText)
		 			setImage(data.responseText)
	 			},
	 			
	 		}).fail(function(data, textStatus, errorThrown){
	 			console.log("data")
	 			console.log(data.responseText)
	 			setImage(data.responseText)
	 		}).done(function(data, textStatus, errorThrown){

	 			console.log("data")
	 			console.log(data.responseText)
	 			setImage(data.responseText)
	 		}); // ajax
	 		
	 /* 		$.getJSON("/user/getByte/${user.user_id}" , function(data){
	 			console.log("byte");
	 			console.log(data);
	 		}); */
	 	/* 
	 	byte[] imgByte = '${user.user_img}';
	 	byte[] byteEnc64 = Base64.encodeBase64(imgByte);
	 	console.log("byteEnc64");
	 	console.log(byteEnc64);
	 	String imgStr = new String(byteEnc64 , "UTF-8");
	 	console.log("imgStr");
	 	console.log(imgStr); */
	 };
	 /* load_blob_img(); */
	 
	 // 팔로우 숫자
	 
	 let login_id = '${login_id}';
	 function followerNum(){
			$.getJSON("/user/countFollower/" + user_id, function(data){

				console.log(data)

				$("#followNum").html(data);		
				$(".follower").html(data);			
			});
		 }

	 function followedNum(){
			$.getJSON("/user/countFollowed/" + user_id, function(data){

				console.log(data)

				$(".followed").html(data);			
			});
		 }followedNum();
		 


	 function getFollower(){
		$.getJSON("/user/getFollowerList/" + user_id, function(data){
			
			var follower = "";

			console.log("getFollowerList : ");
			console.log(data);
			
			$(data).each(
				function() {
						follower += "<div class='col-2' data-follower='"+this.follower+"'><p class='follower'>"
						+ "<a href='/user/room/" + this.follower + "'>"
						+ this.follower +"</a></p>";

						console.log("favorite "+this.follower+" : "+this.favorite);
						
						if(this.favorite == 'Y'){

							follower += "<button class='btn btn-sm btn-danger favorite'>☆ 즐겨찾기</button>";
						}
						else{

							follower += "<button class='btn btn-sm btn-outline-danger favorite'>☆ 즐겨찾기</button>";
						}
						
						follower += "</div><br/>"
				});
			$(".followerList").html(follower);			
		});
	 }
	 getFollower();

	 function getFreindList(){
		$.getJSON("/user/getFreindList/" + user_id, function(data){
			
			var follower = "";

			console.log("getFollowedList : ");
			console.log(data);
			
			$(data).each(
				function() {
						follower += "<div class='col-2'><p class='freind'>"
						+ "<a href='/user/room/" + this.user_id + "'>"
						+ this.user_name +"</a></p></div><br/>"
						if(this.favorite == 'Y'){

							follower += "<button class='btn btn-sm btn-danger favorite'>☆ 즐겨찾기</button>";
						}
						else{

							follower += "<button class='btn btn-sm btn-outline-danger favorite'>☆ 즐겨찾기</button>";
						}
						
				});
			$(".freindList").html(follower);			
		});
	 }
	 getFreindList();

	 function getFavoriteList(){
		$.getJSON("/user/getFavoriteList/" + user_id, function(data){
			
			var follower = "";

			console.log("getFollowedList : ");
			console.log(data);
			
			$(data).each(
				function() {
						follower += "<div class='col-2'><p class='favorite'>"
						+ "<a href='/user/room/" + this.user_id + "'>"
						+ this.user_name +"</a></p></div><br/>";
						
						if(this.favorite == 'Y'){

							follower += "<button class='btn btn-sm btn-danger favorite'>☆ 즐겨찾기</button>";
						}
						else{

							follower += "<button class='btn btn-sm btn-outline-danger favorite'>☆ 즐겨찾기</button>";
						}
						
				});
			$(".favoriteList").html(follower);			
		});
	 }
	 getFavoriteList();
	 

//	프로필 가져오기
	 function getProfile(){
		console.log("getProfile");
		$.getJSON("/test/userProfile/" + user_id, function(data){
			
			var follower = "";

			console.log("data");
			console.log(data);
			console.log("user_img"	);
			console.log(data.user_img);
			console.log("user_name"	);
			console.log(data.user_name);
			console.log("user_num"	);
			console.log(data.user_age);	
			
			load_blob_img();

/* 			if(data.user_img != ""){
				
				var image_path = encodeURIComponent(fileCallPath);
				$(".user_img").attr("src", '/post/display?fileName='+image_path);
			} */
			$(".phone_num").html(data.phone_num);
			$(".user_age").html(data.user_age);
		
			
			
			/* $(data).each(
				function() {
						follower += "<div class='col-2'><p class='freind'>"
						+ "<a href='/user/room/" + this.user_id + "'>"
						+ this.user_name +"</a></p></div><br/>"
						if(this.favorite == 'Y'){

							follower += "<button class='btn btn-sm btn-danger favorite'>☆ 즐겨찾기</button>";
						}
						else{

							follower += "<button class='btn btn-sm btn-outline-danger favorite'>☆ 즐겨찾기</button>";
						}
						
				});
			$(".freindList").html(follower);	 */		
		});
	 }
		getProfile();
		

		 
		 function user_none_check(){
			 console.log('${user.user_id}');
			 if('${user.user_id}' == ""){
					alert("존재하지 않는 유저입니다!");

				location.href="/user";
			 }
		 }
		 user_none_check();
	 
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

	 $(".followerList").on("click", ".favorite", function(){
		 let follower = $(this).parent()[0].dataset.follower;
		 let favorite = '';
		 if($(this).hasClass('btn-danger') === true){

			 favorite = 'N';
		 }else{
			 favorite = 'Y';
		 }	
			 
		 $(this).toggleClass( 'btn-outline-danger' );
		 $(this).toggleClass( 'btn-danger' );

		 console.log("login_id : " + login_id);
		 console.log("followed : " + follower);
		 console.log("favorite : " + favorite);

		 $.ajax({
				type : 'post',
				url : '/user/checkFavorite',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					follower : follower, // 로그인 아이디
					followed : login_id, // 차단할 아이디
					favorite : favorite
				}),
				beforeSend: function(xhr){
	                xhr.setRequestHeader(_csrf_header, _csrf);
	            },
				success : function(result){
					console.log(result);
				}
			});
	 });
	 
	 </script>
	
	

</body>
</html>