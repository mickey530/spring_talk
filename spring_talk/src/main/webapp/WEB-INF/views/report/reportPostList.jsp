<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#modDiv {
		width:300px;
		height:100px;
		background-color : aqua;
		border : black solid 2px;
		position : absolute;
		top:50%;
		left:50%;
		margin-top:-50px;
		margin-left:-150px;
		padding:10px;
		z-index:1000; 
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div class="container">
			<h1>게시글 신고 목록</h1>
			<table boarder="1" class="table table-hover">
		      <thead>
		        <tr>
		          <th>신고번호</th>
		          <th>신고자</th>
		          <th>신고 사유</th>
		        </tr>
		      </thead>
		      <tbody>
		        <c:forEach var="post" items="${postList }">
		          <tr>
		            <td>${post.report_post_num }</td>
		            <td>${post.report_id }</td>
		            <td>${post.report_reason }</td>						
		          </tr>
		        </c:forEach>
		      </tbody>
		    </table>
		    <a href="/report/post" class="btn btn-warning">게시글 신고하기</a><hr/>

			<div id="modDiv" style="display:none;">
			<div class="modal-title">
			</div>
		</div>
		<div>
			<input type="number" id="popup">
		</div>
		<div>
			<button type="button" id="deleteBtn">삭제</button>
		</div>
	 </div><!-- container -->
	 
	 <!-- jquery cdn 가져오기 -->
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	 
	 	<script> 
		// 모달 창 닫기 이벤트
		$("#closeBtn").on("click", function(){// #closeBtn 클릭시
			$("#modDiv").hide("slow");// #modDiv를 닫습니다
		});
	 
	 
		// 삭제로직
		$("#deleteBtn").on("click", function(){
			let rpn = $(".modal-title").html(rpn);		
			
			$.ajax({
				type : 'delete',
				url : '/report/deletepost/' + rpn,
				header : {
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'number',
				success : function(result) {
					console.log("result : " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						$("#modDiv").hide("slow");
					}
				}
			});
		});
	 	</script> 
</body>
</html>