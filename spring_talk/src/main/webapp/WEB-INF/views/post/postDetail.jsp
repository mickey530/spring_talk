<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	<hr/>

	
	
	<!-- 모달창 -->
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
					str += "<p data-reply_num='" + this.reply_num + "' class='replyLi'>"
						+ this.reply_id + " : " + this.reply_content
						+ "</p>";
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
	 </script>

</body>
</html>