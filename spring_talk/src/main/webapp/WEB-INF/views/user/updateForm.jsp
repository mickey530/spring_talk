<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>


	<sec:authorize access="isAnonymous()">	
			
			<script>
				alert("로그인이 필요한 서비스입니다.")
				location.href="/user/login";
			</script>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
	
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.user" var="user"/>
		</sec:authorize>
		
		<div class="card align-middle" style="width:20rem; border-radius:20px; margin:auto">
		
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">로그인 폼</h2>
		</div>
		<div class="card-body">
		      <form action="/user/updateUser" class="form-signin" method="POST" enctype="multipart/form-data">
		      
					<div style="text-align:center;">
				
						<img alt="프로필 사진" style=" margin-bottom:10px; width:200px; height:200px" id="user_img" class="user_img" src="/resources/file.png">
						<div class="mb-3">
						  <input id="file" name="file" class="form-control file_control" type="file" accept=".png">
						</div>
					</div>
		        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
		        <label for="inputEmail" class="sr-only">Your ID</label>
		        <p class="form-control">${user.user_id }</p><BR>
		       	<input type="hidden" id="user_num" name="user_num" value="${user.user_num }">
		       	<input type="hidden" id="user_id" name="user_id" value="${user.user_id }">
		       
		        <label for="inputPassword" class="sr-only">Password</label>
		        <input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="Password" required autofocus><br>
		        
		        <label for="inputEmail" class="sr-only">이름</label>
		        <input type="text"  name="user_name" class="form-control" value="${user.user_name }"  placeholder="Your Name" required ><br>
		       
		        <label for="inputEmail" class="sr-only">성</label>
		        <input type="text" name="last_name" class="form-control" value="${user.last_name }"  placeholder="Last Name" required><br>
		       
		        <label for="inputEmail" class="sr-only">전화번호</label>
		        <input type="text" name="phone_num" class="form-control" value="${user.phone_num }"  placeholder="Phone Number" required><br>
		       
		        <label for="inputEmail" class="sr-only">나이</label>
		        <input type="text" name="user_age" class="form-control" value="${user.user_age }" placeholder="Age" required><br>
		       
		        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">정보 수정</button>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		      </form>
	      </div>
      </div>
      
	</sec:authorize>
</body>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	

<script>

var csrfHeaderName = "${_csrf.headerName}"
var csrfTokenValue="${_csrf.token}"

function setImage(data){
    const previewImage = document.getElementById("user_img")
    previewImage.src = data
}

function load_blob_img() {

	console.log("byte")
	
	
		$.ajax({
			url: '/user/getByte/${user.user_id}',
			processData: false,
			contentType: false,
			type:"get",
			beforeSend : function(xhr) {
			 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(result){
				console.log(result);
				
				alert("Uploaded");
			},
			
		}).fail(function(data, textStatus, errorThrown){
			console.log("data")
			console.log(data.responseText)
			setImage(data.responseText)
		}).done(function(data, textStatus, errorThrown){

			alert("done");
		}); // ajax
		
/* 		$.getJSON("/user/getByte/${user.user_id}" , function(data){
			console.log("byte");
			console.log(data);
		}); */
	/* 
	byte[] imgByte = '${user.user_img}';
	byte[] byteEnc64 = Base64.encodeBase64(imgByte);
	console.log("byteEnc64");
	console.log(byteEnc64);
	String imgStr = new String(byteEnc64 , "UTF-8");
	console.log("imgStr");
	console.log(imgStr); */
};
load_blob_img();
</script>

<script type="text/javascript">

	function readImage(input){
	    // 인풋 태그에 파일이 있는 경우
	    
		var formData = new FormData();
		
		var inputFile = input;
		console.log(inputFile);
		
		var files = inputFile;

		console.log("input.files[0]");
		console.log(input.files[0]);
		
		// 파일 데이터를 폼에 집어넣기

		formData.append("file", input.files[0]);
			
	    
	        	console.log("input")
	        	console.log(input)
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	        	console.log("e")
	        	console.log(e)
	            const previewImage = document.getElementById("user_img")
	            previewImage.src = e.target.result
	        	console.log("e.target")
	        	console.log(e.target)
	            const blob = new Blob([e.target.result])
	        	console.log("blob")
	        	console.log(blob)
	            const url = URL.createObjectURL(blob, {type: "image/png"});
	        	console.log("url")
	        	console.log(url)
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
        	console.log("input.files[0]")
        	console.log(input.files[0])
	    }
	};
	
	const inputImage = document.getElementById("file")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	});
	
</script>
</html>