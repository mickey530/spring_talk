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
    if (!('url' in window) && ('webkitURL' in window)) {
        window.URL = window.webkitURL;
    }

    $('#camera').change(function(e){
        $('#pic').attr('src', URL.createObjectURL(e.target.files[0]));
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
		<input type="submit" value="글쓰기">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	</form>
	
    <input type="file" id="camera" name="camera" capture="camera" accept="image/*" />
    <br />

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