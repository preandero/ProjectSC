<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../CSS/joinOk.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


        <title>Welcome</title>
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
		<form action="login.jsp" id="formsignup" method="post">
			<h1>Welcome</h1>
			<hr>
			<div id="welcome-txt">
				<span>Welcome to our Page. Let's get started by loggin in!</span>
			</div>
            <button class="ghost" id="signUp">Let's Sign in</button>
        </form>
        
    </div>
    </div>

</body>

<script src="../JS/" type="text/javascript" ></script>




</html>