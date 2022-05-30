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
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 번들 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--http://localhost:8181/galldog/detail/1 -->
<style>
*{margin: 0;padding: 0;list-style: none;;}
body {width:100%;}
.container{width : 100%}


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

<div id="wrapper">

	<div class="container" >
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
     <a href="/user/follow" class="col-2">팔로우</a>
     <a href="/chatting/chat" class="col-2">채팅</a>
     <a href="/post/newsfeed" class="col-2">피드</a>
     <a href="/gall/gallLis" class="col-2">커뮤</a>
     <a href="/user/room/${login_id }" class="col-2">마이룸</a>
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
	 function getReplyList(){
		 
		$.getJSON("/gallreplies/all/" + gall_name + "/" + board_num, function(data){

			replyList = $("#replies").html();
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
										
										formattedTime += '&nbsp;';
										+ "<button class='btn btn-outline-danger' id='boardLike'>좋아요</button>"
										
										replyList += "<div class='replyLi p-2 row' data-reply_num='" + this.reply_num + "'><div class='col-10'><strong class='reply_id'>"
										+ "<a href='/user/room/" + this.reply_id + "'>@" + this.reply_id + "</a> </strong>" /* + formattedTime */
										+ "<span class='reply_content modalBtn'>" + this.reply_content 
										+ "</span></div><div class='col-2'>"
										/* + "<button type='button' class='btn menu modalBtn modalArea'>메뉴</button>" */
										+ "<button class='btn btn-outline-danger replyLike' id='replyNum_" + this.reply_num + "'>"+this.like_count+"♡</button>"
										
										+ "</div></div>";						
										
										isReplyLike(this.reply_num);
										
				});
			$("#replies").html(str);			
		});
	 }
	 getReplyList();
	 
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
					if(result == 'OK'){
						alert("등록되었습니다.");
						$("#replyCount").html(parseInt($("#replyCount").html())+1); // 댓글 개수 + 반영 로직
						$("#replies").prepend(
								"<div class='replyLi p-2 row' data-reply_num='" + sequence + "'><div class='col-10'><strong class='reply_id'>"
								+ "<a href='/user/room/" + login_id + "'>@" + login_id + "</a></strong> " /* + formattedTime */
								+ "<span class='reply_content modalBtn'>" + reply_content
								+ "</span></div><div class='col-2'>"
								/* + "<button type='button' class='btn menu modalBtn modalArea'>메뉴</button>" */
								+ "<button class='btn btn-outline-danger reply-like replyLike' id='replyNum_" + sequence + "'>"+0+"♡</button>"
								+ "</div></div>"	
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
       					writer : login_id
       				}),	
       				success : function(result){
       					let thisBoard = $("#boardNum_"+ board_num);
   					 	let likeNum = parseInt(thisBoard.html().substr(1, 1));
   						thisBoard.html("♡" + likeNum);
   					 
       					if(result != ""){
       						thisBoard.addClass("board-liked");
       						thisBoard.removeClass("board-like");
       						thisBoard.addClass("btn-danger");
       						thisBoard.removeClass("btn-outline-danger");
       					} else{
       						thisBoard.addClass("board-like");
       						thisBoard.removeClass("board-liked");
       						thisBoard.addClass("btn-outline-danger");
       						thisBoard.removeClass("btn-danger");
       					}
       					
       				}
       				/* error도 설정 가능 */
       			});
       	 }

      // 좋아요 버튼 클릭 시
		 $("#boardLike").on("click", function(){
			 if(login_id == ""){
				 var result = confirm("로그인이 필요한 기능입니다. \n로그인 페이지로 이동하시겠습니까?")
				 if(result){
					 location.replace('/user/login')
				 }
			 } else{
			 let board_num = $(this).attr("data-board_num");
			 let thisBoard = $("#boardNum_"+ board_num);
			 let likeNum = parseInt(thisBoard.html().substr(1, 1));
/* 			 if(thisPost.hasClass("post-liked")){
				 thisPost.html("♡" + (likeNum - 1))
			 } if(thisPost.hasClass("post-like")){
				 thisPost.html("♡" + (likeNum + 1))
			 } */
 			 if($(this).hasClass("board-liked")){
				 $(this).html("♡" + (likeNum - 1))
			 } if($(this).hasClass("board-like")){
				 $(this).html("♡" + (likeNum + 1))
			 }
			 console.log(board_num);
				$.ajax({
					type : 'post',
					url : '/gall/' + gall_name + 'like',
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
						writer : login_id
					}),
					success : function(result){
						if(result == 'OK'){
 							isLike();
       					}
       				}
       			});
       		});	 
	 </script>	
</body>
</html>