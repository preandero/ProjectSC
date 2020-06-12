<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="pos.beans.*"%>



<%
	MemberDTO[] memarr = (MemberDTO[]) request.getAttribute("meminfo");
StoreDTO[] strarr = (StoreDTO[]) request.getAttribute("storeinfo");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/my_page.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>My page</title>

</head>

<body>

	<header>
		<div class="logo">
			<img src="../images/logo.png" id="logoimg"> <span id="slogo"
				onclick="location.href='index.jsp'"><b>Asangbinsi</b></span>
		</div>
	</header>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<form action="my_pageOk.do">
		<div class="container" id="container">
			<div class="form-container sign-in-container">
				<div id="formct">
					<h1>USER INFO</h1>
					<hr>
					<!-- <span>Please fill in this registration form</span> -->
					<label class="label" for="name">ID</label> <input type="text"
						placeholder="ID" id="Id" name="Id" value="<%=memarr[0].getId()%>"
						readonly /> <label class="label" for="name">Password</label> <input
						type="password" placeholder="Password" id="Password"
						name="Password" /> <label class="label" for="name">Confirm
						Password</label> <input type="password" placeholder="confirm pw"
						id="ConfirmPw" name="ConfirmPw" /> <label class="label"
						for="name">PhoneNumber</label> <input type="tel"
						placeholder="PhoneNumber" id="PhoneNumber" name="PhoneNumber"
						value="<%=memarr[0].getPhonenum()%>" /> <label class="label"
						for="name">E-mail</label> <input type="email" placeholder="E-mail"
						id="Email" name="Email" value="<%=memarr[0].getEmail()%>" />

				</div>
			</div>

			<div class="form-container sign-up-container">
				<div id="formct">
					<h1>STORE INFO</h1>
					<hr>
					<!-- <h1>Your Store Information</h1> -->
					<!-- <span>Please fill in this registration form</span> -->
					<label class="label" for="name">Store Name</label> <input
						type="text" placeholder="Store Name" id="StoreName"
						name="StoreName" value="<%=strarr[0].getName()%>" /> <label
						class="label" for="name">Address</label>
					<div class="sample4">
						<input type="text" id="sample4_post" placeholder="우편번호" name="ZipCode" readonly>
						<input type="button" onclick="juso()" value="우편번호 찾기"
							id="sample4_btn">
					</div>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소"
						name="StreetAddr" readonly> <input type="text" id="sample4_jibunAddress"
						placeholder="지번주소"  name="Jibun" readonly>
					<!-- <span id="guide" style="color:#999;display:none"></span> -->
					<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="DetailAddr">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목" name="ExtraAddr" 
						readonly> <label class="label" for="name">StoreNumber</label>
					<input type="tel" placeholder="StoreNumber" id="StoreNumber"
						name="StoreNumber" value="<%=strarr[0].getPhonenum()%>" /> <br>

				</div>
			</div>


			<div id="signUpBtn">
				<button>수정완료</button>
			</div>
		</div>
	</form>
</body>

<script src="../JS/mypage.js" type="text/javascript"></script>


</html>