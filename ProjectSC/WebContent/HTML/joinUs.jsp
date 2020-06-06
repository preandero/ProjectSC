<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/join_us.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<title>Join Us</title>
</head>

<body>
	<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<div class="container" id="container">
		<form action="joinUs.do" id="formstore" method="POST" name="frm">
			<div class="form-container sign-up-container">
				<div class="store-container">
				<label class="label" for="name">Store Name</label> 
				<input type="text" placeholder="Store Name" id="StoreName" name="StoreName" /> 
				<label class="label" for="name">Address</label>
				<div class="sample4">
					<input type="text" id="sample4_post" placeholder="Zip Code" name="ZipCode" readonly>
					<input type="button" onclick="juso()" value="Search by Zip Code"	id="sample4_btn">
				</div>
				<input type="text" id="sample4_roadAddress" placeholder="Street Address" name="StreetAddr" readonly> 
				<input type="text" id="sample4_jibunAddress" placeholder="Lot Number Address" name="Jibun" readonly>
				<input type="text" id="sample4_detailAddress" placeholder="Street Address (Line 2)" name="DetailAddr"> 
				<input type="text" id="sample4_extraAddress" placeholder="Detailed Address" name="ExtraAddr" readonly> 
				<label class="label" for="name">StoreNumber</label>
				<input type="tel" placeholder="StoreNumber" id="StoreNumber" name="StoreNumber" /> <br>
				<button type="submit" id="signUpBtn" onclick="formChk();">LET'S GET STARTED!</button>
				</div>
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
					<h1>Store Registration</h1>
					<p>We Require Store Information</p>
					<button class="ghost" id="signIn">Back to Member Registration</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Member Registration</h1>
					<br>
					<button class="ghost" id="signUp">Store Registration</button>

				</div>
			</div>
		</div>
	</div>

</body>

<script src="../JS/join_us.js" type="text/javascript"></script>



</html>