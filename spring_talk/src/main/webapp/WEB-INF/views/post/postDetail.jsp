<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<!--http://localhost:8181/post/detail/102  -->
<style>
*{margin: 0;padding: 0;list-style: none;;}

#modDiv{
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
<div class="container">
<div>
	<h2>게시글</h2>
	<p>작성자 : ${post.writer }</p>
	<p>제목 : ${post.title }</p>
	<p id="content">내용 : ${post.content }</p>
	<div>
		<c:if test="${sessionScope.user_id ne null}">
			<button class="btn btn-outline-danger" id="postLike">좋아요</button>
		</c:if>
		<c:if test="${sessionScope.user_id eq post.writer}">
			<a href="/post/updateForm/${post.post_num}" class="btn">수정</a>
			<a href="/post/delete/${post.post_num}" class="btn">삭제</a>
		</c:if>
		<a href="/report/post/${post.post_num}" class="btn btn-outline-dark">신고🚨</a>
		
	</div>
</div>

<hr/>
세션 : <button onclick="isLike"()">${sessionScope.user_id }</button><h2>댓글</h2>
	
	<hr/>

	<div id="replies"></div>
	
	<!-- 댓글 작성란 -->
	<div>
		<div>
			REPLYER <input type="text" id="newReplyWriter"> 
		</div>
		<div>
			REPLY TEXT <input type="text" id="newReplyText">
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	<hr/>

	
	
	<!-- 모달창 -->
	<div id="modDiv" style="display:none;">
		<div class="modal-title modalArea">
		</div>
		
		<div class="btn_content modalArea">
			<button type="button" id="reReplyBtn" class="modalArea">답글달기</button>
			<button type="button" id="btn" class="modalArea">수정</button>
			<button type="button" id="replyDelBtn" class="modalArea">삭제</button>
			<button type="button" onclick="closeModal()" class="modalArea">닫기</button>	
			
			
		</div>
	</div>
	
	
	
</div>
	
	<!-- jquery cdn 코드 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>		
	<script type="text/javascript">
	
	/* 댓글 불러오는 로직 */
	let post_num = ${post.post_num};

	 function getAllList(){
		$.getJSON("/replies/all/" + post_num, function(data){

			var str = "";
			console.log(data);
			
			$(data).each(
				function() {
					// 시간
					let timestamp = this.update_date;
					let date = new Date(timestamp);
					
					let formattedTime = " 게시일 : " + date.getFullYear()
										+ "/" + (date.getMonth()+1)
										+ "/" + date.getDate()
										+ "-" + date.getHours()
										+":" + date.getMinutes()
										+":" + date.getSeconds()
										
										+ '&nbsp;&nbsp;&nbsp;'
										+"<a type='button'href='/report/reply/${reply.reply_num}' >🚨</a>"
										+ '&nbsp;'
									//	+"<button class='btn btn-outline-danger' id='postLike'>좋아요</button>"
										
					str += "<div class='replyLi' data-reply_num='" + this.reply_num + "'><strong>@"
						+ this.reply_id + "</strong> - " + formattedTime + "<br>"
						+ "<div class='reply_content'>" + this.reply_content 
						+ "</div>"
						+ "<button type='button' class='btn modalBtn modalArea'>메뉴</button>"
						+"<button class='btn btn-outline-danger' id='postLike'>좋아요</button>"
						
						+ "</div>";						
						
						
						
						
						
				});
		
			$("#replies").html(str);			
		});
	 }
	 getAllList();
	 
	 /* 댓글 작성 후 댓글작성란 비우는 로직 */
	 function refresh(){
		 $("#newReplyWriter").val("");
		 $("#newReplyText").val("");	 
	 }
	 
	 // 기본댓글 작성하는곳
	 $("#replyAddBtn").on("click", function(){
			var reply_id = $("#newReplyWriter").val();
			var reply_content = $("#newReplyText").val();
			
			$.ajax({
				type : 'post',
				url : '/replies',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					post_num : post_num,
					reply_id : reply_id,
					reply_content : reply_content
				}),
				success : function(result){
					if(result == 'OK'){
						alert("등록되었습니다.");
						getAllList();
						refresh();
					}
				}
				/* error도 설정 가능 */
			});
			
		});
	 
	// 선택한 댓글 외부에서 사용 ///////////////////
	 	let select = "";
	 	
	// 이벤트 위임
	 let modalArea = false; // 모달 열려있는지 확인

	 $("#replies").on("click", ".modalBtn", function(){
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
		 console.log("근데 이게 자꾸 찍힘;;")
	 };
	 
	 // 삭제
	 $("#replyDelBtn").on("click", function(){
		let reply_num = $(".modal-title").html();
		$.ajax({
			type : 'delete',
			url : '/replies/' + reply_num,
			header : {
				"X-HTTP-Method-Override" : "DELETE"
			},
			
			dataType : 'text',
			success : function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다.");
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
			url : '/replies/' + reply_num,
			header : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PATCH" 
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
	 };
	 

	 

	 

	 // 답글달기

	 
	 </script>
	 
	<script type="text/javascript">
	// 해시태그에 a태그 붙이기
	// html 안에 'content'라는 아이디를 content 라는 변수로 정의한다.
	var content = document.getElementById('content').innerHTML;
	console.log(content)
	var splitedArray = content.split(' '); // 공백을 기준으로 문자열을 자른다.
	var linkedContent = '';
	for(var word in splitedArray)
	{
	  word = splitedArray[word];
	   if(word.indexOf('#') == 0) // # 문자를 찾는다.
	   {
	      word = '<a href=\#>'+word+'</a>'; 
	   }
	   linkedContent += word+' ';
	}
	document.getElementById('content').innerHTML = linkedContent;
		
		
	// 좋아요 유무 확인
 	let user_id = '${sessionScope.user_id}';
	
	 function isLike(){
		 $.ajax({
				type : 'post',
				url : '/post/islike',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					post_num : post_num,
					user_id : user_id
				}),
				success : function(result){
					if(result != ""){
						$("#postLike").addClass("post-liked");
						$("#postLike").removeClass("post-like");
						$("#postLike").addClass("btn-danger");
						$("#postLike").removeClass("btn-outline-danger");
					} else{
						$("#postLike").addClass("post-like");
						$("#postLike").removeClass("post-liked");
						$("#postLike").addClass("btn-outline-danger");
						$("#postLike").removeClass("btn-danger");
					}
					
				}
				/* error도 설정 가능 */
			});
	 } isLike()
	 

	// 좋아요 버튼 클릭 시 
	 $("#postLike").on("click", function(){
			console.log($(".post-like").val());
			$.ajax({
				type : 'post',
				url : '/post/like',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					post_num : post_num,
					user_id : user_id
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