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
  h3, .title, .user_id {
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
#replyBar{
       display: flex !important;
       background-color:white;
       position: fixed;
       bottom: 50px;
       left: 0px;
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
#modDiv, #modDiv2{
position:fixed;
z-index:100;
bottom:50 ; left:0;
width: 100%;
opacity : 0.95;
}
	     
#modDiv .btn-outline-dark{
	border: none;
}



.btn_content button:hover{background-color: #484848; color: #fff;}

    
</style>
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
	
	
	<div>
	<div class="py-2">
	<img src="https://yt3.ggpht.com/ytc/AKedOLTi6w4E6985-QdVBbovBSsnCeTETyj0WomjM5IY8Q=s88-c-k-c0x00ffffff-no-rj" alt="mdo" width="32" height="32" class="rounded-circle cardHeader"><a href="/user/room/1234" class="nav-link px-2 link-dark fw-bold postHeader">${post.writer }</a></div>
	<div id="img"></div>
	<div id="content">
	<div class="btnBar py-2">
		<c:if test="${login_id ne post.writer}">
			<button class="btn btn-outline-danger" id="postLike">♡</button>
			<a href="/report/post/${post.post_num}" class="btn btn-outline-dark">신고🚨</a>
		</c:if>
		<c:if test="${login_id eq post.writer}">
		<div>
			<button class="btn btn-outline-danger" id="postLike">♡</button>
		
			<a href="/post/updateForm/${post.post_num}" class="btn">수정</a>
			<form action="/post/delete/${post.post_num}" method="post" class="d-inline">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				<input type="submit" class="btn" value="삭제">
			</form>
		</div>

		</c:if>
		
	</div>
	<strong>@${post.writer }</strong><span> ${post.title }</span>
	<br/>
	 ${post.content }
	 </div>
</div>
	
	
	
	<div>
	<h2>${dog.board_num  }번 게시글</h2>
	<p>작성자 : ${dog.writer }</p>
	<p>제목 : ${dog.board_title }</p>
	
	
	<p id="content">내용 : ${dog.board_content }</p>
	<div>
		<c:if test="${login_id ne dog.writer}">
				<button class="btn btn-outline-danger" id="boardLike">♡</button>
		</c:if>
		<c:if test="${login_id eq dog.writer}">
		<div>
			<button class="btn btn-outline-danger" id="boardLike">♡</button>
		
			<form action="/gall/updateForm/${gall_name }/${dog.board_num}" method="get">
				<input type="submit" class="btn" value="수정">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			</form>
			<form action="/gall/delete/${gall_name }/${dog.board_num}" method="post">
				<input type="submit" class="btn" value="삭제">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			</form>
		</div>
		</c:if>
		<%-- <a href="/report/post/${dog.board_num}" class="btn btn-outline-dark">신고🚨</a> --%>
		
	</div>
</div>

<hr/>
<p>좋아요 <span id="likeCount">${dog.like_count}</span>개 / 댓글 <span id="replyCount">${dog.replycount }</span>개</p>
<hr/>	

	

	<div id="replies"></div>
	<br/>
	<button id="more" class="btn btn-outline-secondary btn-sm" onclick="getReplyList()">와 ! 댓글 ! 더보기!</button>
	<!-- 댓글 작성란 -->
	<div id="replyBar" class="mx-0 py-2 w-100 row justify-content-between">
		<br/>
	
	 <sec:authorize access="isAuthenticated()">
		<div>			
			<div>
			<input id="newReplyText" onkeyup="enterkey()" class="form-control" type="text" placeholder="댓글!" aria-label="default input example">
				<!-- REPLY TEXT <input type="text" id="newReplyText">
				<button id="replyAddBtn">ADD REPLY</button> -->
			</div>
		</div>
	</sec:authorize>
	
	<sec:authorize access="isAnonymous()">
		<a href="http://localhost:8181/user/login">로그인</a>
	</sec:authorize>
	<br/>
	
</div>

	<!-- 모달창 -->
	<div id="modDiv" style="display:none;">
		<div class="modal-title visually-hidden">
		</div>
			<div class="modal-dialog" role="document">
		<div class="modal-content rounded-6 shadow">
		
		<div class="btn-group-vertical" role="group" aria-label="Vertical button group">
			<button type="button" class="btn btn-lg btn-outline-dark border-bottom w-100 mx-0 " id="reReplyBtn" >답글달기</button>	
			<button type="button" class="btn btn-lg btn-outline-dark border-bottom w-100 mx-0 modalArea auth visually-hidden" id="btn">수정</button>
			<button type="button" class="btn btn-lg btn-outline-dark border-bottom w-100 mx-0 modalArea auth visually-hidden" id="replyDelBtn">삭제</button>
			<button type="button" class="btn btn-lg btn-outline-dark w-100 mx-0 modalArea" onclick="closeModal()">닫기</button>
		</div>
	</div>
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
	<a href="/chatting/chat" class="col-2">
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
	
	let _csrf = '${_csrf.token}';
    let _csrf_header = '${_csrf.headerName}';
    let login_id = '${login_id}';

    
	/* 댓글 불러오는 로직 */
	
	/* 게시글 번호, 갤러리 이름, 갤러리 이름(댓글) 변수 선언 */
	let board_num = '${dog.board_num}';	
	let gall_name = '${gall_name}';
	let gall_name_reply = '${gall_name}_reply';

/* 여어어어어어기 */
	 function getAllList(){
		 
		$.getJSON("/gallreplies/all/" + gall_name + "/" + board_num, function(data){

			var str = "";
			console.log(data);
			
			$(data).each(
				function() {
					// 시간
					
					let timestamp = this.m_date;
					
					console.log("timestamp : " + timestamp);
					
					let date = new Date(timestamp);
					console.log("date : " + date);
					let formattedTime = " 게시일 : " + date.getFullYear()
										+ "/" + (date.getMonth()+1)
										+ "/" + date.getDate()
										+ "-" + date.getHours()
										+":" + date.getMinutes()
										+":" + date.getSeconds()
										+ '&nbsp;&nbsp;&nbsp;';
										
										if(!(this.reply_id == login_id)){
											formattedTime += "<a type='button'href='/report/reply/"+this.reply_num+"' >🚨</a>";
										}
					
										
										formattedTime += '&nbsp;';
										+ "<button class='btn btn-outline-danger' id='boardLike'>좋아요</button>"
										
					str += "<div class='replyLi p-2' data-reply_num='" + this.reply_num + "'><strong class='reply_id'>"
						+ "<a href='/user/room/" + this.writer + "'>@"+this.writer + "</a></strong> : " /* + formattedTime */
						+ "<span class='reply_content'>" + this.reply_content 
						+ "</span>"
						+ "<button type='button' class='btn menu modalBtn modalArea'>메뉴</button>"
						+ "<button class='btn btn-outline-danger' id='boardLike'>좋아요</button>"
						
						+ "</div>";												
				});
			console.log("str : " + str);
			$("#replies").html(str);			
		});
	 }
	 getAllList();
	 
	 /* 댓글 작성 후 댓글작성란 비우는 로직 */
	 function refresh(){
		 $("#newReplyText").val("");	 
	 }
	 
	 // 기본댓글 작성하는곳
	 
	 function enterkey() {
	        if (window.event.keyCode == 13) {
	 
	             // 엔터키가 눌렸을 때 실행할 내용
	              reply();
	        }
	}

	// 댓글 시퀀스 가져오는 함수 선언
	/*
		let sequence = "";
		function getReplySequence(){
			$.getJSON("/gallreplies/sequence", function(data){
				sequence = data;
			});
		 }
	 */
		function reply(){
			console.log('${gall_name}')
		 	var reply_content = $("#newReplyText").val();
			console.log("갤네임"+gall_name);
			
			
			//getReplySequence(); // 시퀀스 번호 가져오기
	 
			// $("#replyAddBtn").on("click", function(){
			//	var reply_content = $("#newReplyText").val();
			
			$.ajax({
				type : 'post',
				url : '/gallreplies/'+gall_name+'/'+board_num,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				beforeSend: function(xhr){
	                xhr.setRequestHeader(_csrf_header, _csrf);
	            },
				data : JSON.stringify({
					board_num : board_num,
					writer : login_id,
					reply_content : reply_content,
					gall_name : gall_name
					
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("등록되었습니다.");
						$("#replyCount").html(parseInt($("#replyCount").html())+1); // 댓글 개수 반영 로직
						$("#replies").prepend(
								"<div class='replyLi p-2' data-reply_num='" + sequence + "'><strong class='reply_id'>@"
								+ login_id + "</strong> : "
								+ "<span class='reply_content'>" + reply_content 
								+ "</span>"
								+ "<button type='button' class='btn modalBtn modalArea'>메뉴</button>"
								+"<button class='btn btn-outline-danger' id='boardLike'>좋아요</button>"
								
								+ "</div>"		
					)
						refresh();
					}
					
				},
				/* error도 설정 가능 */
				error: function(){
					alert("error")
				}
				
			});
		};
	 
		 
		  
		
		
	// 선택한 댓글 외부에서 사용 ///////////////////
	 	let select = "";
	 	
	// 모달 이벤트 위임
	 let modalArea = false; // 모달 열려있는지 확인

	 $("#replies").on("click", ".modalBtn", function(){

		 let reply_id = $(this).siblings(".reply_id").children().html();
	     
	     console.log("reply_id = "+reply_id+" , login_id = " + login_id);
	     if(("@"+login_id) == reply_id){
	         $(".auth").removeClass("visually-hidden");
	     } else{
	         $(".auth").addClass("visually-hidden");

	     }
		 
		let replytag=$(this).parent();
	 	console.log(replytag);
		
		let reply_num = replytag.attr("data-reply_num");
		console.log(reply_num);
		
		let reply_content = $(this).siblings(".reply_content").text();
		console.log(reply_content);
		
		$(".modal-title").html(reply_num);
		$("#reply").val(reply_content);

		$("#modDiv").show(400);
		
		modalArea = true; // 모달 열려있음
		if(modalArea){
			$('html').click(function(e) {
				if(!$(e.target).hasClass("modalArea")) {
					closeModal();
					}
				});		 
		 }
		
		// select 에 저장 //////////////////////
		select = $(this).siblings(".reply_content");
	 });
	
	 // 모달 닫기
	 function closeModal(){
		 $("#modDiv").hide("400");
		 modalArea = false;
	 };
	 
	 // 삭제
	 $("#replyDelBtn").on("click", function(){
		let reply_num = $(".modal-title").html();
		$.ajax({
			type : 'DELETE',
			url : '/gallreplies/' + gall_name + "/" + reply_num + "/" + board_num,
			header : {
				"X-HTTP-Method-Override" : "DELETE"
			},
			
			dataType : 'text',
			beforeSend: function(xhr){
                xhr.setRequestHeader(_csrf_header, _csrf);
            },
			success : function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다.");
					$("#replyCount").html(parseInt($("#replyCount").html())-1);
					$(this).hide("slow");
					console.log(select.parent());
					select.parent().hide();
					$("#modDiv").hide("slow");
					 /* getAllList();  */
				}
			}
		});
	 });
	 
	 // 수정버튼
	 $("#btn").click(function(){
			closeModal();
			$(".modalBtn").toggleClass("modalBtn");
			let replyText = select.html();
			let input = "<input type='text' class='reply' value='"+ replyText +"'>"
			
			let modify = "<button type='button' onclick='replyMod()'>저장</button>";

			select.html(input + modify);
		})
		
	 // 수정사항 저장 버튼
	 function replyMod(){
		 
		$(".memu").toggleClass("modalBtn");
		let reply_num = $(".modal-title").html();
		let reply_content = $(".reply").val();
		$.ajax({
			type : 'patch', 
			url : '/gallreplies/'+ gall_name + "/" + reply_num,
			header : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PATCH" 
			},	
			beforeSend: function(xhr){
                xhr.setRequestHeader(_csrf_header, _csrf);
            },
			contentType:"application/json", // json 자료를 추가로 입력받기 때문에
			data: JSON.stringify({reply_content:reply_content}),
			dataType : 'text',
			success : function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("수정되었습니다.");
					select.html(reply_content);
					$(".menu").addClass("modalBtn");
					modalarea = false;
					/* getAllList(); */ //수정된 댓글 반영한 새 댓글목록 갱신 
				}
			}
		});
		};            
         // 좋아요 유무 확인	
       	 function isLike(board_num){
   		 	let login_id = '${login_id}';
       
       		 $.ajax({
       				type : 'post',
       				url : '/gall/islike',
       				headers : {
       					"Content-Type" : "application/json",
       					"X-HTTP-Method-Override" : "POST"
       				},
       				dataType : 'text',
       				beforeSend: function(xhr){
       	                xhr.setRequestHeader(_csrf_header, _csrf);
       	            },
       				data : JSON.stringify({
       					board_num : board_num,
       					user_id : login_id
       				}),
       				success : function(result){
       					if(result != ""){
        					$("#boardLike").addClass("board-liked");
       						$("#boardLike").removeClass("board-like");
       						$("#boardLike").addClass("btn-danger");
       						$("#boardLike").removeClass("btn-outline-danger");
       					} else{
       						$("#boardLike").addClass("board-like");
       						$("#boardLike").removeClass("board-liked");
       						$("#boardLike").addClass("btn-outline-danger");
       						$("#boardLike").removeClass("btn-danger");
       					}
       					
       				}
       				/* error도 설정 가능 */
       			});
       	 } isLike();

       	// 좋아요 버튼 클릭 시 
       	 $("#boardLike").on("click", function(){
       	    	
       			let likeCount = $("#likeCount").text();
       			console.log(gall_name);
       			console.log(login_id);
       			if($("#boardLike").hasClass("board-like")){
       				$("#likeCount").html(parseInt(likeCount)+1);
       			} else{
       				$("#likeCount").html(parseInt(likeCount)-1);
       			}
       			
       			$.ajax({
       				type : 'post',
       				url : '/gall/'+gall_name+'/like',
       				headers : {
       					"Content-Type" : "application/json",
       					"X-HTTP-Method-Override" : "POST"
       				},
       				dataType : 'text',
       				beforeSend: function(xhr){
       	                xhr.setRequestHeader(_csrf_header, _csrf);
       	            },
       				data : JSON.stringify({
       					board_num : board_num,
       					user_id : login_id
       				}),
       				success : function(result){
       					if(result == 'OK'){
       						console.log(result)
       						isLike();
       					}
       				}
       			});
       		});	 
	 </script>	
</body>
</html>