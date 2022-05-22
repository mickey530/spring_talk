<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 아임포트 모튤 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 제이쿼리 임포트 (제이쿼리가 입력되어야 위의 모튤이 작동합니다.) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>품질좋은 상품목록</h1>
	
	<div class="itemSection">
		<div class="itemCard">
			<div class="itemTitle">
				<h2>인스타 광고</h2>			
			</div>
			<div class="itemContent">
				<h2>광고1</h2>
			</div>
			<div class="itemPrice">
				<p data-price="40000">40000원</p>
			</div>
			<div class="itemButton">
				<button class="orderBtn">주문하기</button>
			</div>
		</div>
		
		<div class="itemCard">
			<div class="itemTitle">
				<h2>인스타광고2</h2>			
			</div>		
			<div class="itemContent">
				<h2>광고2</h2>			
			</div>
			<div class="itemPrice">
				<p data-price="6000">6000원</p>
			</div>
			<div class="itemButton">
				<button class="orderBtn">주문하기</button>
			</div>
		</div>
	</div>
	
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