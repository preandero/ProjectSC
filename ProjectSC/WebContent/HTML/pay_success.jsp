<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="../CSS/pay_success.css" rel="stylesheet" type="text/css">
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <title>pay_success</title>

</head>

<body>
   <header>
        <div class="logo">
            <img src="../images/logo.png" id="logoimg">
            <span id="slogo"><b>Asangbinsi</b></span>
        </div>
    </header>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <div class="container" id="container">
    <div class="form-container sign-in-container">
      <form action="#" id="formsignup">
        <h1>Thank you! Let's get Started!</h1>
        <hr>
        <i class="far fa-check-circle"></i>
        <span>이제 AHSANGBINSSI 의 POS 최고의 서비스를 경험해보세요</span>      
        <div id="signUpBtn">
<!--         위에께 원래꺼 -->
<!--           <button type="button" onclick="location.href='pos_index.jsp'">Start Service</button> -->
        		<button type="button" onclick="location.href='pos_mgmt_list.do'">Start Service</button>
        </div>
      </form>
    </div>



  </div>

</body>

<script src="../JS/mypage.js" type="text/javascript"></script>


</html>