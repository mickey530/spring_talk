<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.user_id" var="login_id"/>
</sec:authorize>

	
	<ul id="notes">
	
	</ul>
	
	<!--전송 버튼  -->
	<div>
		<div>
		보내는 내용 <input type="text" name="note_content" id="newNoteContent"> 
		</div>
		<button id="noteAddBtn">전 송</button>
	</div>
	
	<!-- jquery  cdn 가져오기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	
	let _csrf = '${_csrf.token}';
    let _csrf_header = '${_csrf.headerName}';
    let login_id = '${login_id}';
	
	
	<!-- 리스트 가져오기  -->
		//var note_num = ${note_num};
		var note_recipient = '${note_recipient}';
		var note_sender = '${note_sender}';
		
		function getAllList(){
		
		$.getJSON("/user/noteList/" + note_recipient +"/"+ note_sender, function(data){
			var str = "";
			console.log(data.length);
			
			$(data).each(
					function(){
						str += "<li data-note_recipient='" + this.note_recipient + "'class='noteLi'>"
							+ this.note_recipient + ":" + this.note_content
							+ "</li>";
					});
			$("#notes").html(str);
			
		});
		}
		getAllList();
		
		
		// 작성
			$ ("#noteAddBtn").on("click", function(){
				var note_sender = login_id;
				var note_content = $("#newNoteContent").val();
				
				$.ajax({
					type : 'post',
					url : '/user/noteInsert',
					headers : {
						"Content-Type" : "application/json",
				    	"X-Http-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						note_recipient : note_recipient,
						note_sender : note_sender,
						note_content : note_content
					}),
					beforeSend: function(xhr){
		                xhr.setRequestHeader(_csrf_header, _csrf);
		            },
					 success : function(result){
					    	if(result == 'SUCCESS'){
					    		
					    		alert("전송 되었습니다.");
					    		getAllList(); 
					    	}
					 }
				});
			});
	</script>
			

	
	
	
	
	
</body>
</html>