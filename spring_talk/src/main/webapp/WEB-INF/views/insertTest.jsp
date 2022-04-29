<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 번들 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{margin: 0;padding: 0;list-style: none;;}

#modDiv{width: 100%;max-width: 600px;
margin: 0 auto;
padding:10px;
box-sizing: border-box;
background-color: blanchedalmond;}

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

    
</style>
</head>
<body>
<!-- jquery  cdn 가져오기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	
	<h2>Ajax 댓글 등록 테스트</h2>
	<!-- 댓글 추가될 공간 -->
	<ul id ="replies">
	
	</ul>
	<!-- 댓글 작성 공간 -->
	<div>
		<div>
			댓글 글쓴이 <input type="text" name="replyer" id="newReplyWriter">
		</div>
		<div>
			댓글 내용 <input type="text" name="reply" id="newReplyText">
		</div>
		<button id="replyAddBtn"> 댓글 추가 </button>
	</div>
	
	<!-- 모달 창 -->
	<div id="modDiv"  style="display:none;">
		<div class ="modal-title">
		</div>
		<div>
			<input type="text" id="reply">
		</div>
		<div class="btn_content">
			<button type="button" id="reReplyBtn">답글달기</button>
			<button type="button" id="replyModBtn">수정</button>
			<button type="button" id="replyDelBtn">삭제</button>
			<button type="button" id="closeBtn">닫기</button>	
		</div>
	</div>
	

	<script>
	let board_num = 1; //1번글
	
	// 댓글 전체 가져오기
	function getAllList(){
		$.getJSON("/replies/all/" + board_num, function(data){
			
			let str ="";
			
			console.log(data);
			
			$(data).each(function(){
				str += "<li data-reply_num='" + this.reply_num + "' class='replyLi'>"
					+ this.reply_num + ":" + this.reply_content
					+ "<button>수정/삭제</button></li>";
			});
			console.log(str);
			$("#replies").html(str);
		});
	}
	getAllList();
	
	 // 댓글 작성
	$("#replyAddBtn").on("click",function(){
		var replyer = $("#newReplyWriter").val();
		var reply = $("#newReplyText").val();
		
		$.ajax({
			type : 'post',
			url : '/replies',
			headers:{
				"Content-Type" : "application/json",
		    	"X-Http-Method-Override" : "POST"
			},
			 dataType : 'text',
			    data : JSON.stringify({
					board_num : board_num,
					reply_id : replyer,
					reply_content : reply
			    }),
			 success : function(result){
			    	if(result == 'SUCCESS'){
			 
			    		alert("등록 되었습니다.");
			    		getAllList(); 
			    		var replyer = $("#newReplyWriter").val("");
			    		var reply = $("#newReplyText").val("");
			    	}
			 }
		});
	});
	 
	 // 이벤트 위임
	 $("replies").on("click", ".replyLi button", function(){
		let replytag=$(this).parent();
		console.log(replytag);
		
		let reply_num = replytag.attr("data-reply_num");
		console.log(reply_num);
		
		let reply_content = replytag.text();
		
		$(".modal-title").html(reply_num);
		$("#reply").val(reply_content);
		$("#modDiv").show("slow");
	 });
	
	 // 닫기
	 $("#closeBtn").on("click", function(){
		 $("#modDiv").hide("slow");
	 });
	 
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
	 $("#replyModBtn").on("click", function(){
		let reply_num = $(".modal-title").html();
		let reply_content = $("#reply").val();
		
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
					$("#modDiv").hide("slow");
					getAllList(); //수정된 댓글 반영한 새 댓글목록 갱신
				}
			}
		});
	 });
	
	
	</script>
	
	

</body>
</html>