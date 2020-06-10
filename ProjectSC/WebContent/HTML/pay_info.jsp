<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pos.beans.*"%>
<!DOCTYPE html>
<html lang="ko">



<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="../CSS/pay_info.css" rel="stylesheet" type="text/css">
  <meta charset="UTF-8">
  <title>pay info</title>
  <script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>

<body>
 <video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
        <source src="../images/banner.mp4">
  </video>
<header>
        <div class="logo">
            <img src="../images/logo.png" id="logoimg">
            <span id="slogo"><b>Asangbinsi</b></span>
        </div>
    </header>
  <div class="container" id="container">
    <div class="form-container sign-in-container">
      <form action="kakaopay.jsp" method="post">
        <h1>PAY INFO</h1>
        <span id = "please">Please fill in this registration form</span>
        <label class="label" for="name">이용권</label>

        <div class="controls">
          <i class="fa fa-sort"></i>
          <select class="floatLabel" name="period">
            <option value="select">Select option</option>
            <option value="30" id="day">30 days ￦20,000</option>
            <option value="180" id="month">6 month ￦70,000</option>
            <option value="365" id="year">1 year ￦120,000</option>

          </select>

        </div>
        <label class="label" for="name">가격</label>
        <input type="text" placeholder="price" id="price" name="price" value="" readonly/>
        <label class="label" for="name">결제방식</label>

        <div class="controls">
          <i class="fa fa-sort"></i>
          <select class="floatLabel" name="method">
            <option value="select">Payment method</option>
            <option value="kakao">Kakao pay</option>
          </select>

        </div>
        <label class="label" for="name">결제확인 이메일</label>
        <input type="email" placeholder="E-mail" id="Email" name="email" />
        <br>
        <button id="signUpBtn" type="submit">결제하기</button>


      </form>
    </div>

   <div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Store Registration</h1>
					<p>We Require Store Information</p>
					<button class="ghost" id="signIn">Back to Member Registration</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Welcome Asangbinsi POS</h1>
					<br>

				</div>
			</div>
		</div>
  </div>
</body>

<script>
		// var = $("#")
		$(".floatLabel").change(function(){
			
		switch($(".floatLabel").val()){
		
		case '30':
			$("#price").attr('value', '20000');
			break;
			
		case '180':
			$("#price").attr('value', '70000');
			break;
			
		case '365':
			$("#price").attr('value', '120000');
			break;
			
		default :
			$("#price").attr('value', '');
			break;		
		}
		});
	
</script>

</html>