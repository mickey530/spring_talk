<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 번들 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- http://localhost:8181/post/detail/test/2 -->
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

    
</style>
</head>
<body>
<div class="container">
<div>
	<h2>게시글</h2>
	작성자 : ${post.writer }<br/>
	제목 : ${post.title }<br/>
	내용 : ${post.content }<br/>
</div>

<hr/>
<h2>댓글</h2>
	
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
		<button id="replyAddBtn" class="replyAddBtn">ADD REPLY</button>
	</div>
	<hr/>

 <!-- 대댓글 작성하는 -->
	<!-- <div class='reply_area' style="display:none;">
		<div>REPLYER <input type="text" name="reReplyWriter" id="reReplyWriter" ></div>
		<div>REPLY TEXT <input type="text" id="reReplyText"></div>
		<button id="reReplyBtn">ADD REPLY</button>
	</div>
	 -->
	<!-- 모달창 -->
	<div id="modDiv" style="display:none;">
		<div class ="modal-title"></div>
		
		<div class="btn_content">
			<button type="button" class="reReplyBtn">답글달기</button>
			<button type="button" class="btn">수정</button>
			<button type="button" class="replyDelBtn">삭제</button>
			<button type="button" class="replyModBtn">저장</button>
			<button type="button" class="closeBtn">닫기</button>	
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
					let depth = this.reply_level; 
					let depth_level = "";
					
					let formattedTime = " 게시일 : " + date.getFullYear()
										+ "/" + (date.getMonth()+1)
										+ "/" + date.getDate()
										+ "-" + date.getHours()
										+":" + date.getMinutes()
										+":" + date.getSeconds()
					
										
						// 댓글 깊이
					for(var i=0; i < depth; i++) {
						console.log(i)
						depth_level += "&nbsp;&nbsp;&nbsp;"
						}				
										
										
					str += "<div class='replyLi' data-reply_num='" + this.reply_num + "'>"
						+ depth_level
						+ "<strong>@"
						+ this.reply_id + "</strong> - " + formattedTime + "<br>"
						+ "<div class='reply_content'>" + this.reply_content + "</div>"
						+ "<button type='button' class='btn btn-info'>수정/삭제</button><br/><br/>"
						+ "</div>"
						+"<div class='reply_area' style='display:none';>"
						+"<div>REPLYER <input type='text' name='reReplyWriter' id='reReplyWriter' ></div>"
						+"<div>REPLY TEXT <input type='text' id='reReplyText'></div>"
						
					+"</div>";
						
					 

				
						
				});
		
			$("#replies").html(str);			
		});
	 }
	 getAllList();
	 
	 $(".reReplyBtn").click(function(){
		 $(".reply_area").show()
		 
	 });
	 
	 
	  // 대댓글
	 $(".reReplyBtn").click(function(){
		 

		 
		 var parent_num = $("#modDiv .modal-title").html()
		 var reReplyWriter = $("#reReplyWriter").val()
		 var reReplyText = $("#reReplyText").val()
		 
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
				parent_num : parent_num,
				reply_id : reReplyWriter,
				reply_content : reReplyText,
				reply_level:1
			}),
			success : function(result){
				if(result == 'OK'){
					alert("등록되었습니다.");
					getAllList();
					refresh();
				}
			}
		 });
	 }); 

	 /* 댓글 작성 후 댓글작성란 비우는 로직 */
	 function refresh(){
		 $("#newReplyWriter").val("");
		 $("#newReplyText").val("");	 
	 }
	 
	 // 기본댓글
	 $(".replyAddBtn").on("click", function(){
		 	var parent_num = $("#modDiv .modal-title").html();
			var reply_id = $("#newReplyWriter").val();
			var reply_content = $("#newReplyText").val();
			console.log('buttonclicked');
			$.ajax({
				type : 'post',
				url : '/replies',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				
				data : JSON.stringify({
					post_num : post_num,
					parent_num : parent_num,
					reply_id : reply_id,
					reply_content : reply_content,
					reply_level:0
				}),
				success : function(result){
					if(result == 'OK'){
						alert("등록되었습니다.");
						getAllList();
						refresh();
					}
				},
				error: function(){
					alert("error")
				}
				/* error도 설정 가능 */
			});
			
		});
	 
	// 선택한 댓글 외부에서 사용 ///////////////////
	 	let select = "";
	 	
	// 이벤트 위임
	 $("#replies").on("click", " button", function(){
		let replytag=$(this).parent();
	 	console.log(replytag);
		
		let reply_num = replytag.attr("data-reply_num");
		console.log(reply_num);
		
		let reply_content = $(this).siblings(".reply_content").text();
		console.log(reply_content);
		
		$(".modal-title").html(reply_num);
		$("#reply").val(reply_content);
		$("#modDiv").show("slow");
		
		// select 에 저장 //////////////////////
		select = $(this).siblings(".reply_content");
	 });
	
	 // 닫기
	 $(".closeBtn").on("click", function(){
		 $("#modDiv").hide("slow");
	 });
	 
	 // 삭제
	 $(".replyDelBtn").on("click", function(){
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
	 $(".btn").click(function(){
			let input = "<input type='text' class='reply' value='"+ select.html() +"'>"
			select.html(input);
		})
		
	 // 수정사항 저장 버튼
	 $(".replyModBtn").on("click", function(){
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
					$("#modDiv").hide("slow");
					getAllList(); //수정된 댓글 반영한 새 댓글목록 갱신
				}
			}
		});
	 });
	 
	 
	 </script>

</body>
</html>