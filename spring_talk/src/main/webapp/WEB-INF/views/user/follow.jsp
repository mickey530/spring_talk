<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
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
 li{
 	list-style: none;
 }
 
 .followMenu > ul{
 	display: none;
 }
 
 a{
 	text-decoration:none;
 	text-align:center;
  	color: black;
 	
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
</head>
<body>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.user.user_id" var="login_id"/>
</sec:authorize>

<!-- 대충 헤더임 -->

<div id="wrapper">
<header class="sticky-top p-3 text-black border-bottom row" style="margin:0px;">
<h3 class="col-11 px-0">FOLLOW</h3>
<a href="/post/insert" class="col-1 text-left text-black">+</a>
</header>
<div class="container">
		
		<div class="followList followMenu">
			<div class="subTitle my-3">
				<a>내가 팔로우하는 사람</a>
	<hr/>
			</div>			
			<ul class="p-0"></ul>
		
		</div>
	
		<div class="followerList followMenu">
		
			<div class="subTitle my-3">
				<a>나를 팔로우하는 사람</a>
	<hr/>
			</div>			
			<ul class="p-0"></ul>
		</div>
		<div class="freindList followMenu">
		
			<div class="subTitle my-3">
			
				<a>맞팔된 사람 목록</a>
	<hr/>
			</div>
			<ul class="p-0"></ul>
		</div>
		<div class="favoriteList followMenu">
		
			<div class="subTitle my-3">
				<a>즐겨찾기</a>
	<hr/>
			</div>
			<ul class="p-0"></ul>
		</div>
	</div>
	




	
	


	
 
 
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
	
	 
	 // 팔로잉

	  function followed(){
		$.getJSON("/user/followed/" + login_id, function(data){
			follow = "";

			console.log(data);
 			$(data).each(
				function() {
					follow += "<li class='w-100'><div class='d-flex justify-content-between' data-follower='"+this.followed+"'><p class='follower m-0'>"
					+ "<a href='/user/room/" + this.followed + "'>"
					+ this.followed +"</a></p>"
					+ "<div class='d-flex'><button class='btn btn-sm btn-primary m-1 following'>언팔로우</button>";
					console.log("favorite "+this.followed+" : "+this.favorite);
					
					if(this.favorite == 'Y'){

						follow += "<button class='btn btn-sm btn-danger favorite m-1'>☆ 즐겨찾기</button>";
					}
					else{

						follow += "<button class='btn btn-sm btn-outline-danger favorite m-1'>☆ 즐겨찾기</button>";
					}
					
					follow += "</div></div></li>"
					
					console.log(this.followed);
				}
			
			); 
			$(".followList > ul").html(follow);			
		});
	 } followed();
	 

	 function getFollower(){
		$.getJSON("/user/getFollowerList/" + login_id, function(data){
			
			var follower = "";

			console.log("getFollowerList : ");
			console.log(data);
			
			$(data).each(
				function() {
						follower += "<li class='w-100'><div class='d-flex justify-content-between' data-follower='"+this.follower+"'><p class='follower m-0'>"
						+ "<a href='/user/room/" + this.follower + "'>"
						+ this.follower +"</a></p>"
						+ "<div class='d-flex'><button class='btn btn-sm btn-primary m-1 following'>언팔로우</button>"
						+ "</div></div></li>"
				});
			$(".followerList > ul").html(follower);			
		});
	 }
	 getFollower();

	 function getFreindList(){
		$.getJSON("/user/getFreindList/" + login_id, function(data){
			
			var follower = "";

			console.log("getFollowedList : ");
			console.log(data);
			
			$(data).each(
				function() {
						follower += "<li><div class='col-2'><p class='freind'>"
						+ "<a href='/user/room/" + this.user_id + "'>"
						+ this.user_name +"</a></p></div></li><br/>"
				});
			$(".freindList > ul").html(follower);			
		});
	 }
	 getFreindList();

	 function getFavoriteList(){
		$.getJSON("/user/getFavoriteList/" + login_id, function(data){
			
			var follower = "";

			console.log("getFavoriteList : ");
			console.log(data);
			
			$(data).each(
				function() {
						follower += "<li class='w-100'><div class='d-flex justify-content-between' data-follower='"+this.user_id+"'><p class='follower m-0'>"
						+ "<a href='/user/room/" + this.user_id + "'>"
						+ this.user_id +"</a></p>"
						+ "</div></div></li>"
				});
			$(".favoriteList > ul").html(follower);			
			

			 $(".following").on("click", function(){
				 var button = $(this);
				 followed = $(this).parent().parent()[0].dataset.follower
				 console.log(followed)

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
							followed : followed, // 차단할 아이디
							favorite : 'N'
						}),
						beforeSend: function(xhr){
			                xhr.setRequestHeader(_csrf_header, _csrf);
			            },
						success : function(result){
							console.log(result)
							console.log(button)
							if(result == "FOLLOW SUCCESS"){
								console.log("FOLLOW")
								 button.addClass( 'btn-primary' );
								button.removeClass( 'btn-outline-primary' );
								button.html("언팔로우")
							}
							else if(result == "UNFOLLOW SUCCESS"){

								button.addClass( 'btn-outline-primary' );
								button.removeClass( 'btn-primary' );
								console.log("UNFOLLOW")
								button.html("팔로우")
							}

						}
					});  
			 });
		});
	 }
	 getFavoriteList();
	 
	 
	 /* // 팔로우 기능
	 function follow(){
			$.ajax({
				type : 'post',
				url : '/user/follow',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					follower : ${login_id}, // 로그인 아이디
					followed : , // 팔로우할 아이디
					favorite : 'N'
				}),
	            beforeSend: function(xhr){
	                xhr.setRequestHeader(_csrf_header, _csrf);
	            },
				success : function(result){
					if(result == 'FOLLOW SUCCESS'){
					}
				}
			});
			console.log(${login_id})
		};
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
					user_id : ${login_id}, // 로그인 아이디
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
		}); */
	 


	 $(".followList").on("click", ".favorite", function(){
		 let followed = $(this).parent().parent()[0].dataset.follower;

		 let favorite = 'N';

		 if($(this).hasClass('btn-danger') === true){

			 favorite = 'N';
		 }else{
			 favorite = 'Y';
		 }	
			 
		 $(this).toggleClass( 'btn-outline-danger' );
		 $(this).toggleClass( 'btn-danger' );


		 $.ajax({
				type : 'post',
				url : '/user/checkFavorite',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					follower : login_id, // 로그인 아이디
					followed : followed, // 차단할 아이디
					favorite : favorite
				}),
				beforeSend: function(xhr){
	                xhr.setRequestHeader(_csrf_header, _csrf);
	            },
				success : function(result){
					getFavoriteList();
				}
			});
	 });

	 $(".followerList").on("click", ".favorite", function(){
		 let followed = $(this).parent().parent()[0].dataset.follower;

		 let favorite = 'N';

		 if($(this).hasClass('btn-danger') === true){

			 favorite = 'N';
		 }else{
			 favorite = 'Y';
		 }	

		 console.log("login_id : " + login_id);
		 console.log("login_id : " + login_id);
		 console.log(followed);
		 console.log("favorite : " + favorite);
		 $(this).toggleClass( 'btn-outline-danger' );
		 $(this).toggleClass( 'btn-danger' );

		 $.ajax({
				type : 'post',
				url : '/user/checkFavorite',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					follower : login_id, // 차단할 아이디
					followed : followed, // 로그인 아이디
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
	 


	 $(".followMenu").on("click", ".subTitle", function(){
			var subMenu = $(this).next("ul");

			if(subMenu.is(":visible")){
				subMenu.slideUp();
			}else{
				subMenu.slideDown();
			}
		});
		 
	 

	 
	 
	 </script>
	
	

</body>
</html>