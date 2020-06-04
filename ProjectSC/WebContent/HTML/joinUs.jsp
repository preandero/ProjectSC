<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/join_us.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<title>Join Us</title>
</head>

<body>
	<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<div class="container" id="container">
		<form action="joinUs.do" id="formstore" method="POST">
			<div class="form-container sign-up-container">

				<!-- <h1>Your Store Information</h1> -->

				<!-- <span>Please fill in this registration form</span> -->
				<label class="label" for="name">Store Name</label> 
				<input type="text" placeholder="Store Name" id="StoreName" name="StoreName" /> 
				<label class="label" for="name">Address</label>
				<div class="sample4">
					<input type="text" id="sample4_post" placeholder="우편번호" disabled>
					<input type="button" onclick="juso()" value="우편번호 찾기"	id="sample4_btn">
				</div>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="StreetAddr" readonly> 
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="ZipCode" readonly>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="DetailAddr"> 
				<input type="text" id="sample4_extraAddress" placeholder="참고항목" name="ExtraAddr" readonly> 
				<label class="label" for="name">StoreNumber</label>
				<input type="tel" placeholder="StoreNumber" id="StoreNumber" name="StoreNumber" /> <br>
				<button type="submit" id="signUpBtn">POS 이용하러 가기</button>
			</div>
			
			<div class="form-container sign-in-container">
				<h1>JOIN US</h1>
				<span>Please fill in this registration form</span> 
				<label class="label" for="name">ID</label> 
				<input type="text" placeholder="ID" id="Id" name="Id" /> 
				<label class="label" for="name">Password</label> 
				<input type="password" placeholder="Password" id="Password" name="Password" /> 
				<label class="label" for="name">Confirm Password</label> 
				<input type="password" placeholder="confirm pw" id="ConfirmPw" name="ConfirmPw" /> 
				<label class="label" for="name">PhoneNumber</label>
				<input type="tel" placeholder="PhoneNumber" id="PhoneNumber" name="PhoneNumber" /> 
				<label class="label" for="name">E-mail</label>
				<input type="email" placeholder="E-mail" id="Email" name="Email" />

			</div>
		</form>
		
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>매장등록</h1>
					<p>To keep connected with us please fill out your store info</p>
					<button class="ghost" id="signIn">Back to Join Us</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>회원가입</h1>
					<br>
					<button class="ghost" id="signUp">매장 정보 입력하러 가기</button>

				</div>
			</div>
		</div>
	</div>

</body>

<script src="../JS/join_us.js" type="text/javascript"></script>



</html>