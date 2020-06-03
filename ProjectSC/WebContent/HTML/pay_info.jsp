<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="../CSS/pay_info.css" rel="stylesheet" type="text/css">
  <meta charset="UTF-8">
  <title>pay info</title>
</head>

<body>
  <div class="container" id="container">
    <div class="form-container sign-in-container">
      <form action="kakaopay.jsp" method="post">
        <h1>PAY INFO</h1>
        <span>Please fill in this registration form</span>
        <label class="label" for="name">이용권</label>

        <div class="controls">
          <i class="fa fa-sort"></i>
          <select class="floatLabel" name="period">
            <option value="select">Select option</option>
            <option value="30">30 days ￦20,000</option>
            <option value="180">6 month ￦70,000</option>
            <option value="365">1 year ￦120,000</option>
            <option value="0">30days FREE</option>

          </select>

        </div>
        <label class="label" for="name">가격</label>
        <input type="text" placeholder="" id="price" name="price" />
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
      <div class="sub-cont">
        <div class="img">
          <div class="img__text m--up">
            <h2>New here?</h2>
            <p>Sign up and discover great amount of new opportunities!</p>
          </div>
        </div>
      </div>

    </div>
  </div>
  <script src="./script.js"></script>
</body>

</html>