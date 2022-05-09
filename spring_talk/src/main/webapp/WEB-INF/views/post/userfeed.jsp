<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style>
.title-padding{
    padding:10px;
}
.cardHeader {
    display: inline-block;
}

.card-menu {
    margin-left: 2px;
}
.card-body {
    padding: 0px;
}
details > summary {
    list-style: none;
    text-align: start;
}
  
details > summary::-webkit-details-marker {
    display: none;
}
summary > p {
    text-align: start;
}
.card {
    font-size: 12px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<%-- 
<div class="row justify-content-center">
<c:forEach var="post" items="${postList }">
	<div class="card" style="width: 100%;">
	  <div class="card-title">${post.post_num } | ${post.writer } </div>
	
	  <!-- <img src="#" class="" alt="사진 들어갈 자리"> -->
	  <div class="card-body">
	  	<details>
	    <summary class="card-title">${post.title }</summary>
	    <p class="card-text">${post.content }</p>
	  	</details>
	  </div>
	</div>
</c:forEach>
</div>
 --%>

<div class="post">
${writer }
</div>

<button id="more" onclick="more()">more</button>
 
 
 </div>
<!-- jquery cdn 코드 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	

	<script type="text/javascript">
	
	/* 게시글 불러오는 로직 */
	let page_num = 0;
	let writer = '${writer}';
	var post = "";

	 function more(){
		page_num += 1;
		$.getJSON("/post/userfeed/" + writer + "?page_num=" + page_num, function(data){

			console.log(data);
			
			$(data).each(
				function() {
					post += "<p data-post_num='" + this.post_num + "' class='post'>"
						+ "<a href='/post/detail/" + this.post_num + "'> "+ this.post_num +"</a> | " + this.writer + " <br/> " + this.title + " <br/> " + this.content
						+ "</p>";

				});
			$(".post").html(post);			
		});
	 }
	 more();
	 
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