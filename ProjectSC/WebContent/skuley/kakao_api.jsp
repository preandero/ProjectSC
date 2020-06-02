<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<button id="btn_pay">전송</button>
	<script>
		$(document).ready(function() {
			Kakao.API.request({
				curl -v -X POST : 'https://kapi.kakao.com/v1/payment/ready',
				Authorization : 'KakaoAK 82373d8cab7a2a4013fd85bfacd19dc6',
				cid : "TC0ONETIME",
				partner_order_id : 'partner_order_id',
				partner_user_id : 'partner_user_id',
				item_name : '라이언빵',
				quantity : '1',
				total_amount : 1000,
				vat_amount : 200,
				tax_free_amount : '0',
				approval_url : 'https://developers.kakao.com/success',
				fail_url : 'https://developers.kakao.com/fail',
				cancel_url : 'https://developers.kakao.com/cancel'
			});
		});
	</script>
</body>
</html>