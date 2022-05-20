<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
	<header class="sticky-top p-3 bg-primary text-white border-bottom row" style="margin:0px;">
		<span class="col-11">${login_id }'s follow</span>
		<a href="/post/insert" class="col-1 text-left text-white">+</a>
	</header>

<div class="container">
<!-- <div id="followList">


</div> -->


		<div class="followerList followMenu">
		
			<div class="subTitle">
				<a>팔로우하는 사람</a>
			</div>			
			<ul></ul>
		</div>
	<hr/>
		<div class="freindList followMenu">
		
			<div class="subTitle">
			
				<a>맞팔된 사람 목록</a>
			</div>
			<ul></ul>
		</div>
	<hr/>
		<div class="favoriteList followMenu">
		
			<div class="subTitle">
				<a>즐겨찾기</a>
			</div>
			<ul></ul>
		</div>
	</div>
	




	
	


	
 
 
</div> <!-- container -->
 
 
</div> <!-- wrapper -->

<footer class="mx-0 py-2 w-100 border-top row justify-content-between">
     <a href="#" class="col-2">팔로우</a>
     <a href="#" class="col-2">채팅</a>
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
	
	 
	 // 팔로잉
	 followed_id = "";

	 /* function followed(){
		$.getJSON("/user/followed/" + login_id, function(data){

			console.log(data);
 			$(data).each(
				function() {
					followed_id += "<div class='row'><span class='col-9 data-followed='" + this.followed + "'>"
								+ "<a href='/user/room/"+this.followed+"'>"+this.followed+"</a></span>"
								+ "<button class='col-2 btn btn-sm btn-primary'>팔로잉</button></div>";
								

					if(this.favorite == 'Y'){

						followed_id += "<button class='btn btn-sm btn-danger favorite'>☆ 즐겨찾기</button>";
					}else{

						followed_id += "<button class='btn btn-sm btn-outline-danger favorite'>☆ 즐겨찾기</button>";
					}
					
					followed_id += "<hr/>";
					console.log(this.followed);
				}
			
			); 
			$("#followList").html("<br/>" + followed_id);			
		});
	 } followed(); */
	 

	 function getFollower(){
		$.getJSON("/user/getFollowerList/" + login_id, function(data){
			
			var follower = "";

			console.log("getFollowerList : ");
			console.log(data);
			
			$(data).each(
				function() {
						follower += "<li><div class='col-4' data-follower='"+this.follower+"'><p class='follower'>"
						+ "<a href='/user/room/" + this.follower + "'>"
						+ this.follower +"</a></p>"
						+ "<button class='col-4 btn btn-sm btn-primary'>팔로잉</button>";
						console.log("favorite "+this.follower+" : "+this.favorite);
						
						if(this.favorite == 'Y'){

							follower += "<button class='btn btn-sm btn-danger favorite'>☆ 즐겨찾기</button>";
						}
						else{

							follower += "<button class='btn btn-sm btn-outline-danger favorite'>☆ 즐겨찾기</button>";
						}
						
						follower += "</div></li><br/>"
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

			console.log("getFollowedList : ");
			console.log(data);
			
			$(data).each(
				function() {
						follower += "<li><div class='col-2'><p class='favorite'>"
						+ "<a href='/user/room/" + this.user_id + "'>"
						+ this.user_name +"</a></p></div></li><br/>"
				});
			$(".favoriteList > ul").html(follower);			
		});
	 }
	 getFavoriteList();
	 
	 
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
					follower : ${login_id}, // 로그인 아이디
					followed : user_id, // 팔로우할 아이디
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