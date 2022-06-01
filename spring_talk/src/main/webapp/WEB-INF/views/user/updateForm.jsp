<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>

@font-face {
    font-family: 'CookieRunOTF-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
  }
  @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
  }  
  html, body {height:100%;}
  body {
    background-color: white;
    color: black;
    font-family: 'CookieRun-Regular';    
  }
  h3, .title {
      font-family: 'CookieRunOTF-Bold';
      margin: 0px;
  }
  #wrapper{
      height: auto;
      min-height: 100%;
      padding-bottom: 50px;
  }
  .container{
  	height: 100%;
    min-height: 100%;
  }
  a{
	  text-decoration:none;
	  text-align:center;
	  color: black;
  }
  .form-signin{
  	max-width: 390px;
    position: absolute;
    width: 100%;
	padding: 10px;
    left: 50%;
    transform: translate(-50%);
  }

header{
        background-color: white;
}

footer {
        display: flex !important;
        position: fixed;
        bottom: 0px;
        width: 100%;
        height: 50px;
        font-size: 15px;
        align-items: center;
        background-color: white;
        z-index: 2;
}
</style>

<head>
	<title>Home</title>
</head>
<body>

<div id="wrapper">
	<header class="sticky-top p-3 text-black border-bottom row" style="margin:0px;">
		<h3 class="col-12 px-0">Sign up</h3>
	</header>
<div class="container">
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.user_id" var="login_id"/>
</sec:authorize>
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
		
		
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">회원 정보 수정</h2>
		</div>
		
		      <form action="/user/updateUser" class="form-signin" method="POST" enctype="multipart/form-data">
		      
					<div style="text-align:center;">
				
						<img alt="프로필 사진" style=" margin-bottom:10px; width:200px; height:200px" id="user_img" class="user_img rounded" src="/resources/file.png">
						<div class="mb-3">
						  <input id="file" name="file" class="form-control file_control" type="file" accept=".png">
						  <input type="text"  name="user_comment" class="form-control" value="${user.user_comment }"  placeholder="상태 메시지" required ><br>
		       		 
						</div>
					</div>
		  		<input type="hidden" id="user_id" name="user_id" class="form-control" value="${login_id }">
		  		
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
		       
		        <button id="btn-Yes" class="btn btn-lg btn-outline-success w-100" type="submit">정보 수정</button>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		      <br/>
		      <br/>
		      <br/>
		      </form>
      
	</sec:authorize>
	
</div> <!-- container -->
 
 
</div> <!-- wrapper -->	
<footer class="mx-0 py-2 w-100 border-top row justify-content-between">
	<a href="/user/follow" class="col-2">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
          <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
        </svg>	
	</a>
	<a href="/user/chatList/${login_id }" class="col-2">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
          <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
        </svg>	
	</a>
	<a href="/post/newsfeed" class="col-2">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-terminal" viewBox="0 0 16 16">
          <path d="M6 9a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3A.5.5 0 0 1 6 9zM3.854 4.146a.5.5 0 1 0-.708.708L4.793 6.5 3.146 8.146a.5.5 0 1 0 .708.708l2-2a.5.5 0 0 0 0-.708l-2-2z"/>
          <path d="M2 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h12z"/>
        </svg>	
	</a>
	<a href="/gall/gallList" class="col-2">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
          <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
        </svg>	
	</a>
	<a href="/user/room/${login_id }" class="col-2">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
          <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
        </svg>	
	</a>
</footer>
	
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

	console.log('${user}')
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