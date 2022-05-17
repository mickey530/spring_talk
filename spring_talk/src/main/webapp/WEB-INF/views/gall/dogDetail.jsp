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
 	}

#modDiv, #modDiv2{
position:fixed;
z-index:100;
bottom:0 ; left:0;
width: 100%;
margin: 0 auto;
padding:10px;
box-sizing: border-box;
background-color:#fff;}
	     

.btn_content{width: 100%;
border-radius: 5px;
background-color: #fff;;}

.btn_content button{
display: block;	
width: 100%;
background-color: blueviolet;
border: 0;
padding: 10px;
border-bottom: 1px solid #ddd;
background-color: transparent;}

.btn_content button:last-child{border-bottom: 0;}


.btn_content button:hover{background-color: #484848; color: #fff;}

.button{
border:0;
outline: none;
background-color:#ffffff;
}

    
</style>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.user_id" var="login_id"/> 	
</sec:authorize>

	<div class="container" >

	<div>
		<h2>${dog.board_num  }번 게시글</h2>
		<p>작성자 : ${dog.writer }</p>
		<p>제목 : ${dog.board_title }</p>
		<p id="content">내용 : ${dog.board_content }</p>
	<div>		
		<c:if test="${login_id eq dog.writer}">
			<a href="/galldog/updateForm/${dog.board_num}" class="btn btn-dark">수정</a>
			<a href="/galldog/delete/${dog.board_num}" class="btn btn-danger">삭제</a>
		</c:if>
		<!-- <a href="/report/post/${post.post_num}" class="btn btn-outline-dark">신고🚨</a>  -->		
	</div>
	</div>

<hr/>
<h3>댓글 <span id="replyCount">${dog.replycount }</span>개</h3>

	
	<hr/>

	<div id="replies"></div>
	
	<!-- 댓글 작성란 -->
	<br/>
	 <sec:authorize access="isAuthenticated()">
		<div>			
			<div>
				REPLY TEXT <input type="text" id="newReplyText">
				<button id="replyAddBtn">ADD REPLY</button>
			</div>
		</div>
	</sec:authorize>
	
	<sec:authorize access="isAnonymous()">
		<a href="http://localhost:8181/user/login">로그인</a>
	</sec:authorize>
	
	<hr/>

	<!-- 모달창 -->
	<div id="modDiv" style="display:none;">
		<div class="modal-title modalArea">
		</div>
		<div class="btn_content modalArea">
				<button type="button" id="reReplyBtn" class="modalArea">답글달기</button>	
				<button type="button" onclick="closeModal()" class="modalArea">닫기</button>
				<button type="button" id="btn" class="modalArea auth visually-hidden">수정</button>
				<button type="button" id="replyDelBtn" class="modalArea auth visually-hidden">삭제</button>
		</div>
	</div>

</div> <!-- container -->

	<!-- jquery cdn 코드 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>		
	<script type="text/javascript">
	
	let _csrf = '${_csrf.token}';
    let _csrf_header = '${_csrf.headerName}';
    let login_id = '${login_id}';

    
	/* 댓글 불러오는 로직 */
	let board_num = ${dog.board_num};

	 function getAllList(){
		$.getJSON("/gellreplies/all/" + board_num, function(data){

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
										
										
										formattedTime += '&nbsp;';
									//	+"<button class='btn btn-outline-danger' id='postLike'>좋아요</button>"
										
					str += "<div class='replyLi' data-reply_num='" + this.reply_num + "'><strong class='reply_id'>@"
						+ this.writer + "</strong> - " + formattedTime + "<br>"
						+ "<div class='reply_content'>" + this.reply_content 
						+ "</div>"
						+ "<button type='button' class='btn modalBtn modalArea'>메뉴</button>"
						+"<button class='btn btn-outline-danger' id='boardLike'>좋아요</button>"
						
						+ "</div>";												
				});
		
			$("#replies").html(str);			
		});
	 }
	 getAllList();
	 
	 /* 댓글 작성 후 댓글작성란 비우는 로직 */
	 function refresh(){
		 $("#newReplyText").val("");	 
	 }
	 
	 // 기본댓글 작성하는곳
	 $("#replyAddBtn").on("click", function(){
			var reply_content = $("#newReplyText").val();
			
			$.ajax({
				type : 'post',
				url : '/gellreplies',
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
					reply_content : reply_content
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("등록되었습니다.");
						$("#replyCount").html(parseInt($("#replyCount").html())+1); // 댓글 개수 반영 로직
						getAllList();
						refresh();
					}
					
				},
				/* error도 설정 가능 */
				error: function(){
					alert("error")
				}
				
			});
		});
	 
	// 선택한 댓글 외부에서 사용 ///////////////////
	 	let select = "";
	 	
	// 모달 이벤트 위임
	 let modalArea = false; // 모달 열려있는지 확인

	 $("#replies").on("click", ".modalBtn", function(){

		 let reply_id = $(this).siblings(".reply_id").html();
	     
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

		$("#modDiv").show("slow");
		
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
		 $("#modDiv").hide("slow");
		 modalArea = false;
	 };
	 
	 // 삭제
	 $("#replyDelBtn").on("click", function(){
		let reply_num = $(".modal-title").html();
		$.ajax({
			type : 'delete',
			url : '/gellreplies/' + reply_num,
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
					$("#modDiv").hide("slow");
					getAllList();
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
		 
		$(".modalBtn").toggleClass("modalBtn");
		let reply_num = $(".modal-title").html();
		let reply_content = $(".reply").val();
		$.ajax({
			type : 'patch', 
			url : '/gellreplies/' + reply_num,
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
					getAllList(); //수정된 댓글 반영한 새 댓글목록 갱신
				}
			}
		});
		}
            
            
         // 좋아요 유무 확인	
       	 function isLike(){
       		 $.ajax({
       				type : 'post',
       				url : '/galldog/islike',
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
       	 }
       	

       	// 좋아요 버튼 클릭 시 
       	 $("#boardLike").on("click", function(){
       			let likeCount = $("#boardLike").children().html();
       			console.log(parseInt(likeCount));
       			if($("#boardLike").hasClass("board-like")){
       				$("#boardLike").children().html(parseInt(likeCount)+1);
       			} else{
       				$("#boardLike").children().html(parseInt(likeCount)-1);
       			}
       			
       			$.ajax({
       				type : 'post',
       				url : '/galldog/like',
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