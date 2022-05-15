<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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


	<div class="container" >
		
		${replyvo }
	
		<h1>${reply.report_reply_num }번 댓글 신고내역</h1>
		<div class="row">
			<div class="col-md-3">
				<input type="text" class="form-control" value="신고자: ${reply.report_id }" readonly/>
			</div>
		</div>	
		<textarea readonly rows="10" class="form-control">사유 : ${reply.report_reason }</textarea>
				
			<a href="/report/reportReplyDelete/${reply.report_rnum }" class="btn btn-danger">삭제하기</a>	
			<a href="/report/reportReplyList" class="btn btn-dark">댓글 신고목록</a>	
	</div><hr/>
	
	<div id="replies"></div>
	
	<!-- 모달창 -->
	<div id="modDiv" style="display:inline;">
		<div class ="modal-title">
		</div>
		
		<div class="btn_content">
			<button type="button" id="replyDelBtn">해당 댓글 삭제</button>
			<button type="button" id="closeBtn">닫기</button>				
		</div>
	</div>
	
	
	
	<!-- jquery cdn 코드 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>		
	<script type="text/javascript">
	// 선택한 댓글 외부에서 사용 ///////////////////
	 	let select = "";
		var _csrf = '${_csrf.token}';
		var _csrf_header = '${_csrf.headerName}';	 	
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
			beforeSend: function(xhr){
	               xhr.setRequestHeader(_csrf_header, _csrf);
	           },
			success : function(result){
				console.log("result: " + result);
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