<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
	<%-- <c:choose>
	<c:when test="${ empty list || fn:length(list) == 0 }">
		<script type="text/javascript">
			alert("해당 정보가 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise> --%>
	
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../CSS/login.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <title>login</title>
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
		<form action="loginOk.do" id="formsignup" method="POST">
			<h1>Login</h1>
            <span>Please fill in this registration form</span>
            <label class="label" for="name">ID</label>
            <input type="text" placeholder="ID" id="Id" name="Id"/>
            <label class="label" for="name">Password</label>
            <input type="password" placeholder="Password" id="Password" name="Password" />
            <button class="ghost" id="signUp">login</button>
        </form>
        
    </div>

<div class="overlay-container">
    <div class="overlay">
        
	</div>
</div>

<%-- 
	</c:otherwise>
</c:choose> --%>

</body>

<script src="../JS/" type="text/javascript" ></script>

</html>
