<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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

</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- jquery cdn 코드 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
	

	
	
	<script type="text/javascript">
	
	/* 댓글 불러오는 로직 */
	let bno = ${post.post_num};

	 function getAllList(){
		$.getJSON("/replies/all/" + bno, function(data){

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
			var replyer = $("#newReplyWriter").val();
			var reply = $("#newReplyText").val();
			
			$.ajax({
				type : 'post',
				url : '/replies',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					board_num : bno,
					reply_id : replyer,
					reply_content : reply
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