<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<meta name="viewport" content="width=device-width, initial-scale=1">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="justify-content-center">
	${user.user_id}<br/>
	${user.user_name}' Room
	</header>
	<hr/>
	
	<div class="container">
		<div class="post row">

		</div>
	</div>
	
	<button id="more" onclick="more()">more</button>
 
 
 </div>
<!-- jquery cdn 코드 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	

	<script type="text/javascript">
	
	/* 게시글 불러오는 로직 */
	let page_num = 0;
	let user_id = '${user.user_id}';
	var post = "";

	 function more(){
		page_num += 1;
		$.getJSON("/post/userfeed/" + user_id + "?page_num=" + page_num, function(data){

			console.log(data);
			
			$(data).each(
				function() {
					post += "<div class='col-4'><p data-post_num='" + this.post_num + "' class='post'>"
						+ "<a href='/post/detail/" + this.post_num + "'> "+ this.post_num +"</a> | " + this.writer + " <br/> " + this.title + " <br/> " + this.content
						+ "</p></div>";

				});
			$(".post").html(post);			
		});
	 }
	 more();
	 
	 </script>
	
	

</body>
</html>