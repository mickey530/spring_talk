<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.18.js"></script>
  
  
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="https://www.myservice.com/subscription/issue-billing", method= "post">
		  <!--예: https://www.myservice.com/subscription/issue-billing-->
		    <div>
		        <label for="card_number">카드 번호 XXXX-XXXX-XXXX-XXXX</label>
		        <input id="card_number" type="text" name="card_number">
		    </div>
		    <div>
		        <label for="expiry">카드 유효기간 YYYY-MM</label>
		        <input id="expiry" type="text" name="expiry">
		    </div>
		    <div>
		        <label for="birth">생년월일 YYMMDD</label>
		        <input id="birth" type="text" name="birth">
		    </div>
		    <div>
		        <label for="pwd_2digit">카드 비밀번호 앞 두자리 XX</label>
		        <input id="pwd_2digit" type="text" name="pwd_2digit">
		    </div>
		    <input hidden type="text" value="gildong_0001_1234" name="customer_uid">
		    <input type="submit" value="결제하기">
		  </form>
		
<script>
		IMP.request_pay({
			pg : "html5_inicis.INIBillTst", // 실제 계약 후에는 실제 상점아이디로 변경
			pay_method : 'card', // 'card'만 지원됩니다.
			merchant_uid: "order_monthly_0001", // 상점에서 관리하는 주문 번호
			name : '최초인증결제',
			amount : 0, // 결제창에 표시될 금액. 실제 승인이 이루어지지는 않습니다. (모바일에서는 가격이 표시되지 않음)
			customer_uid : 'your-customer-unique-id', // 필수 입력.
			buyer_email : 'iamport@siot.do',
			buyer_name : '아임포트',
			buyer_tel : '02-1234-1234',
			m_redirect_url : 'https://www.my-service.com/payments/complete/mobileL' // 예: https://www.my-service.com/payments/complete/mobile
				curl -H "Content-Type: application/json" \   
			     -X POST -d '{"name": "your-service-name", "customer_uid":"your-customer-unique-id", "merchant_uid":"order_id_8237352", "amount":3000}' \
			     https://api.iamport.kr/subscribe/payments/again
		}, function(rsp) {
			if ( rsp.success ) {
				alert('빌링키 발급 성공');
			} else {
				alert('빌링키 발급 실패');
			}
		});
		
		
	
		
	
		
		
 	 </script>
</body>
</html>