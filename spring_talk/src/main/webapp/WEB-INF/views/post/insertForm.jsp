<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  html, body {height:100%;}
  body {
    background-color: white;
    color: black;
  }
  #wrapper{
      height: auto;
      min-height: 100%;
      padding-bottom: 50px;
  }
  a{text-decoration:none; text-align:center;}
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
<script>
$(document).ready(function(){

	var csrfHeaderName = "${_csrf.headerName}"
	var csrfTokenValue="${_csrf.token}"
	
    if (!('url' in window) && ('webkitURL' in window)) {
        window.URL = window.webkitURL;
    }

    $('#camera').change(function(e){
        $('#pic').attr('src', URL.createObjectURL(e.target.files[0]));
    });
    
    var regex= new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; // 5mb
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	// 첨부가 안 된 상태의 .uploadDiv를 깊은복사해서
	// 첨부 완료 후에 안 된 시점의 .uploadDiv로 덮어씌우기
	var cloneObj = $(".uploadDiv").clone();
	
	
	$('#uploadBtn').on("click", function(e){
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		// 파일 데이터를 폼에 집어넣기
		for(var i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}

			formData.append("uploadFile", files[i]);
			
		}

		
		$.ajax({
			url: '/post/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type:"POST",
			beforeSend : function(xhr) {
			 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType:"json",
			success: function(result){
				console.log(result);
				
				showUploadedFile(result);
				
				// 업로드 성공시 미리 복사해둔 .uploadDiv 로 덮어씌워서 첨부파일이 없는 상태로 되돌려놓기
				$(".uploadDiv").html(cloneObj.html());
				alert("Uploaded");
			}
		}); // ajax
		
	});// onclick uploadBtn
	
	var uploadResult = $(".uploadResult ul");
	
	function showUploadedFile(uploadResultArr){
		var str = "";
		
		$(uploadResultArr).each(function(i, obj){

			console.log("i");
			console.log(i);
			console.log("obj");
			console.log(obj);
			// BoardAttachVO내부에서 이미지여부를 fileType변수에 저장하므로 obj.image -> obj.fileType
				var fileCallPath = encodeURIComponent(obj.upload_path + "/" + obj.uuid + "_" + obj.file_name);
				console.log("img");
				console.log(fileCallPath);
				str += "<li "
					+ "data-path='" + obj.upload_path + "' data-uuid='" + obj.uuid
					+ "' data-filename='" + obj.file_name + "'>"
					+ "<a href='/download?file_name=" + fileCallPath
					+ "'>" + "<img src='/resources/file.png' style='width: 50px;'>"
					+ obj.file_name + "</a>"
					+ "<span data-file=\'" + fileCallPath + "\' data-type='img'> X </span>"
					+ "</li>";
				
		});
		uploadResult.append(str);
	}// showUploadedfile
	
	$(".uploadResult").on("click", "span", function(e){
		var targetFile = $(this).data("file");
		
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: '/post/deleteFile',
			beforeSend : function(xhr) {
			 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data: {fileName: targetFile},
			dataType : 'text',
			type: 'POST',
			success : function(result){
				alert(result);
				targetLi.remove();
			}
		});// ajax
	});	// click span
	
	$("#submitBtn").on("click", function(e){
		e.preventDefault();
		
		var formObj = $("form");
		
		var str = "";
		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			console.log(jobj);
			str += "<input type='hidden' name='ifVOs[" + i + "].file_name'"
				+ " value='" + jobj.data("filename") + "'>"
				+ "<input type='hidden' name='ifVOs[" + i + "].uuid'"
				+ " value='" + jobj.data("uuid") + "'>"
				+ "<input type='hidden' name='ifVOs[" + i + "].upload_path'"
				+ " value='" + jobj.data("path") + "'>"
				+ "<input type='hidden' name='ifVOs[" + i + "].file_type'"
				+ " value='" + jobj.data("type") + "'>";
		});
		//폼태그에 위의 str내부 태그를 추가해주는 명령어, .submit() 을 추가로 넣으면 제출 완료
		formObj.append(str).submit();
	});
});
</script>

</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.user_id" var="login_id"/>
</sec:authorize>

<!-- 대충 헤더임 -->

<div id="wrapper">
<header class="sticky-top p-3 bg-primary text-white border-bottom row" style="margin:0px;">
<span class="col-11">posting</span>
<a href="/post/insert" class="col-1 text-left text-white">+</a>
</header>
<div class="container">

	<form action="/post/insert" method="post">
		<input type="hidden" name="writer" value="${login_id }" placeholder="작성자">
		<br/>
  		<input type="text" name="title" class="form-control" id="exampleFormControlInput1" placeholder="제목 !">
		<br/>
  		<textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="3"></textarea>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" id="submitBtn" value="글쓰기">
	</form>
	
    <br />
	
	<div class="uploadDiv">
		<input type="file" name="uploadFile" accept="image/*" multiple><span><button id="uploadBtn">Upload</button></span>
	
	</div>
	
	<div class="uploadResult">
		<ul>
			<!-- 업로드된 파일이 들어갈 자리 -->
			
		</ul>
	</div>
    

    <img id="pic" style="width:100%;" />
    
<div class="mb-3">
  
</div>
	
</div> <!-- container -->
	
</div> <!-- wrapper -->

<footer class="mx-0 py-2 w-100 border-top row justify-content-between">
      <a href="/user/follow" class="col-2">팔로우</a>
      <a href="#" class="col-2">채팅</a>
      <a href="/post/newsfeed" class="col-2">피드</a>
      <a href="#" class="col-2">커뮤</a>
      <a href="/user/room/${login_id }" class="col-2">마이룸</a>
</footer>	
	
	
	
</body>
</html>