<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 아임포트 모튤 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 제이쿼리 임포트 (제이쿼리가 입력되어야 위의 모튤이 작동합니다.) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta charset="UTF-8">
<title>Insert title here</title>
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
  h3, h2, .title {
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
  .itemSection {
  	max-width: 390px;
    position: absolute;
    width: 100%;
	padding: 10px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
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

</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.user_id" var="login_id"/>
</sec:authorize>

<div id="wrapper">
<header class="sticky-top p-3 text-black border-bottom row" style="margin:0px;">
<h3 class="col-12 px-0">IN n OUT</h3>
</header>
<div class="container">

	
	<div class="itemSection d-flex justify-content-center">
		<div class="itemCard">
			<div class="itemTitle">
				<h2>인앤아웃 프리미엄</h2>		
			</div><br/>
			<div class="itemContent">
				<h4>월 4만원에 <br/> 광고 없는 인앤아웃을 즐겨보세요!</h4>
			</div>
			<div class="itemPrice">
				<p data-price="40000" class="justify-content-end"></p>
			</div>
			<div class="itemButton d-flex justify-content-end">
				<div class="btn">40,000원</div><button class="orderBtn btn btn-primary">결제하기</button>
			</div>
		</div>
	</div>
</div> <!-- container -->
 
 
</div> <!-- wrapper -->	
<footer class="mx-0 py-2 w-100 border-top row justify-content-between">
     <a href="/user/follow" class="col-2">팔로우</a>
     <a href="/chatting/chat" class="col-2">채팅</a>
     <a href="/post/newsfeed" class="col-2">피드</a>
     <a href="/gall/gallList" class="col-2">커뮤</a>
     <a href="/user/room/${login_id }" class="col-2">마이룸</a>
</footer>	
	<script>
	// 미리 받아와야할 정보들 변수를 전역변수처럼 쓰기위해 선언해두기
	var itemPrice = 0; // 가격
	var itemTitle = ""; // 물건이름
	var merchant_uid = ""; // 주문번호
	// 위임처리로 어떤 상품을 클릭했을때 그 상품에 대한
	$(".itemSection").on("click", ".orderBtn", function(){
		itemPrice = $(this).parent().siblings(".itemPrice").children().attr("data-price");
		itemTitle = $(this).parent().siblings(".itemTitle").children().text();
		d = new Date(); // 현 시간
		merchant_uid = "order" + d.getTime(); // 현시간을 유닉스시간으로 변경해 order에 붙임
		// 입력정보를 가져오고 나서 함수 호출
		iamport();
	});
	
	function iamport(){
		IMP.init('imp63893974'); //가맹점 번호
		IMP.request_pay({
			pg : 'html5_inicis', //kg이니시스
			pay_method : 'card', // 결제수단
			merchant_uid: merchant_uid, // 주문번호는 order+유닉스시간으로 처리해 겹치지 않게
			name : itemTitle, // 결제창에 뜰 상품명
			amount : itemPrice, // 금액
			// 신상정보는 나중에 로그인한 사용자정보로 대체
			buyer_email : 'iamport@siot.do', // 구매자 이메일
			buyer_name : '김화원', //구매자 이름
			buyer_tel : '010-5692-4406', // 구매자 번호
			buyer_addr : '서울특별시 강남구 삼성동', // 구매자 주소
			buyer_postcode : '123-456', //구매자 우편번호
		}, function(rsp){
			console.log(rsp);
			if (rsp.success) { // 결제 성공시 ajax로 db에 데이터를 전송해 입력
				$.ajax({
					type: 'post',
					url: '/order',
					headers:{
						"Content-Type":"application/json",
						"X_HTTP-Method-Override":"POST"
					},
					dataType:"text",
					data: JSON.stringify({
						itemname : itemTitle,
						amount:itemPrice,
						merchant_uid:merchant_uid
					}),
					success: function(){
						alert(itemTitle + "결제완료!");
					}
					});
				}else{ // 결제 실패시 처리할 내역
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
		});
	}
	</script>
</body>
</html>