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
  #friend_book{

  }

#profile_img{
	width:100px;
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
  
  
 #sideMenu > ul > li > a{
 	color: white;
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
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.user_id" var="login_id"/>
</sec:authorize>

<div id="wrapper">
<header class="sticky-top p-3 text-black border-bottom row" style="margin:0px;">
<h3 class="col-11 px-0">${user_id }'s Room</h3>
<a href="/post/insert" class="col-1 text-left text-black">+</a>
</header>
<div class="container"><br/>


<div class="profile-header row justify-content-between mx-0">
	<div id="profile_img" class="col-3 align-items-center">
	   <div id="img" class="rounded-circle">
			<c:if test="${login_id ne 'null' && login_id eq user.user_id}">
				<img class="upload_img w-100" alt="프로필 사진 추가" id="user_img" src="/resources/file.png" onclick="location.href='/user/update'">
			</c:if>
			<c:if test="${login_id ne 'null' && login_id ne user.user_id}">
				<img class="upload_img w-100" alt="프로필 사진" id="user_img" src="/resources/file.png">
			</c:if>    		 
		</div>
		
	</div>
		<c:if test="${login_id ne 'null' && login_id ne user.user_id}">
			<div class="row col-9">
				<button class="col-4 text-center btn align-self-center" id="follow"><span id="followNum"></span><br/>팔로우</button>
				<button class="col-4 text-center btn align-self-center" onclick="location.href='/user/noteDetail/${login_id}/${user.user_id }'"><br/>쪽지</button>
				<button class="col-4 text-center btn align-self-center" onclick="callNumber('${user.phone_num}')"><br/>전화</button>
			</div>
		</c:if>
		<c:if test="${login_id ne 'null' && login_id eq user.user_id}">
			<div class="row col-9">
				<button class="col-4 text-center btn align-self-center" id="follow"><span id="followNum"></span><br/>팔로우</button>
				<button class="col-4 text-center btn align-self-center" onclick="location.href='/user/update'"><br/>정보수정</button>
				<button class="col-4 text-center btn align-self-center" onclick="location.href='/user/logout'"><br/>로그아웃</button>
			</div>
		</c:if>
	
	
	<div class="col-12 text-start align-self-center p-3">${user.user_comment }</div><br>

</div>
	
	<hr/>
	
	
	
	<button onclick='bookToggle()' class="form-control toggleBtn">방명록</button><br/>
	<div id="friend_book" class="visually-hidden">
		
		<c:if test="${login_id ne 'null' && login_id ne user.user_id}">
			<br/>
	  		<textarea class="form-control" onkeyup="enterkey()" name="book_comment" 
	  			id="exampleFormControlTextarea1" placeholder="방명록을 남겨주세요!"></textarea><br/>
		</c:if>
	
	
		<div class="uploadBookResult">
			<ul class="p-0 justify-content-between">
				<!-- 방명록 들어갈 자리 -->
				
			</ul>
		</div>
	</div>
	
	
	
	<div id="postList" class="d-flex row p-2"></div>
	
	<hr/>
	<button id="more" class="btn btn-sm btn-outline-secondary" onclick="more()">와! 게시물 ! 더보기</button>
	


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
	
	var _csrf = '${_csrf.token}';
	var _csrf_header = '${_csrf.headerName}';
	
	/* 게시글 불러오는 로직 */
	let page_num = 0;
	let user_id = '${user.user_id}';
	let uploadResult = $(".uploadBookResult ul");
	var post = "";
	var isFriend = false;

	 $("#insertBookComment").on("click", function(){

		$.getJSON("/user/insertBookData/" + user_id , function(data){
			console.log(data);
		});
			 
	 });


	 $("#getBookComment").on("click", function(){

		$.getJSON("/user/bookData/${user.user_id}" + user_id , function(data){
			console.log(data);
		});
			 
	 });

	 function more(){
		page_num += 1;
		$.getJSON("/post/userfeed/" + user_id + "?page_num=" + page_num, function(data){
			post = $("#postList").html();			
			
			console.log(data);
			
			$(data).each(
				function() {
					post += "<div id='postNum_"+this.post_num+"' class='col-4 p-1'>"
						 + this.title + "</div>";
					
					
					getImages(this.post_num)
				}		
			);
			$("#postList").html(post);			
		});
	 }
	 more();
	 more();
	 
	 // 팔로우 숫자
	 
	 let login_id = '${login_id}';
	 function followerNum(){
			$.getJSON("/user/countFollowed/" + user_id, function(data){

			
				$("#followNum").html(data);			
			});
		 }
		 


	 function getFollower(){
		$.getJSON("/user/getFollowerList/" + user_id, function(data){
			
			var follower = "";
			
			$(data).each(
				function() {
						follower += "<div class='col-2' data-follower='"+this.follower+"'><p class='follower'>"
						+ "<a href='/user/room/" + this.follower + "'>"
						+ this.follower +"</a></p>";
						
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

		function getBook(){

				$.getJSON("/user/bookData/" + user_id, function(data){

					$(data).each(
						function() {
							let str = "";
							str += "<li class='d-flex p-2 justify-content-between'>"+this.friend+" : "+this.book_comment+"<span class='d-flex text-end' data-book_num='"+this.book_num+"'> X </span></li>";

							uploadResult.append(str);
							$("#exampleFormControlTextarea1").val("");
						});
				});
			};
			getBook();
			

			$(".uploadBookResult").on("click", "span", function(e){
				var book_num = $(this).data("book_num");

				var thisLi = $(this).closest("li");
				
				$.ajax({
					url: '/user/deleteBook',
					beforeSend : function(xhr) {
		                xhr.setRequestHeader(_csrf_header, _csrf);
					},
					data: {book_num : book_num},
					dataType : 'text',
					type: 'POST',
					success : function(result){
						alert(result);
						thisLi.remove();
					}
				});// ajax
			});	// click span
		


//	 유저 이미지 불러오는 함수
	 
	 function setImage(data){
	     const previewImage = document.getElementById("user_img")
	     previewImage.src = data
	 }
	 
	 function load_blob_img() {
		 	
		 		$.ajax({
		 			url: '/user/getByte/${user.user_id}',
		 			processData: false,
		 			contentType: false,
		 			type:"get",
		 			beforeSend : function(xhr) {
		 			 xhr.setRequestHeader(_csrf_header, _csrf);
		 			},
		 			success: function(result){
			 			setImage(data.responseText)
		 			},
		 			
		 		}).fail(function(data, textStatus, errorThrown){
		 			setImage(data.responseText)
		 		}); // ajax

		 };
		 
	load_blob_img();
	
	 function checkfriend() {
		 	
		 		$.ajax({
		 			url: '/user/isFriend',
		 			processData: false,
		 			contentType: false,
		 			type:"post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
		 			beforeSend : function(xhr) {
		 			 xhr.setRequestHeader(_csrf_header, _csrf);
		 			},
					data : JSON.stringify({
						follower : login_id, // 로그인 아이디
						followed : user_id, // 팔로우 아이디
						favorite : 'N'
					}),
		 			success: function(result){
			 			console.log("isfriend success")
			 			console.log("result")
			 			console.log(result)
			 			
			 			if(result == "YES"){
			 				isFriend = true;
			 			}
		 			},
		 			
		 		}).fail(function(data, textStatus, errorThrown){
		 			console.log("isfriend fail")
		 			console.log("data")
		 			console.log(data)
		 		}); // ajax

		 };checkfriend();
		 

		 function enterkey() {
	        if (window.event.keyCode == 13) {
	        	console.log("enter")
	        	console.log($("#exampleFormControlTextarea1").val())
	        	if(isFriend){
		        	console.log("isFriend")

		 			insertBook($("#exampleFormControlTextarea1").val());
	        	}
	             // 엔터키가 눌렸을 때 실행할 내용
	        }
		}
		 
				
				
		function insertBook(content){

					$.ajax({
						type : 'post',
						url : '/user/insertBookData',
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						beforeSend: function(xhr){
				           xhr.setRequestHeader(_csrf_header, _csrf);
				        },
						data : JSON.stringify({
							book_owner : user_id,
							friend : login_id,
							book_comment : content
						}),
						success : function(result){
							console.log("result")
							console.log(result)
							if(result == 'OK'){
								alert("방명록이 등록되었습니다.");
								let str = "";
								str += "<li class='d-flex p-2 justify-content-between'>"+login_id+" : "+content+"<span class='d-flex text-end'> X </span></li>";
								uploadResult.prepend(str);
								$("#exampleFormControlTextarea1").val("");
							}
								
						},
						error: function(){
							alert("error")
						}
							
					});
				};
				
				function callNumber(num){
				    location.href = "tel:" + num;
				}			
			
				
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
									imgData += "<div><a href='/post/detail/"+post_num+"'>"
									   		+ "<div id='img'>"
									   		+ "<img class='upload_img w-100' src='/post/display?fileName="+ fileCallPath + "'>"
											+ "</div></a></div>"
										
								});
							$("#postNum_"+post_num).html(imgData);	
							
							} else{
								
								
							$("#postNum_"+post_num).remove();
								
							} 
							
						});
				 };
				 
				 function bookToggle(){
					 $("#friend_book").toggleClass("visually-hidden");
					 $("#postList").toggleClass("visually-hidden");
					 
					 if ($(".toggleBtn").html() == '방명록'){
						 $(".toggleBtn").html("게시물");
						 $("#more").hide()
					 } else{
						 $(".toggleBtn").html("방명록");
						 $("#more").show()
					 }
				 }
	 </script>
	
	

</body>
</html>