<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <% 
	MemberDTO[] arr = (MemberDTO[])request.getAttribute("list");
	int mem_uid = arr[0].getUid();
	session.setAttribute("mem_uid", mem_uid);	

	
%> --%>
	
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
        
        <script type="text/javascript">
        	function loginChk(){
        		
        		frm = document.forms["formsignup"];
        		var id = frm["Id"].value;
        		
        		var pw = frm["Password"].value;
        		
        		var idChk = document.getElementById("id-format-txt");
        		var pwChk = document.getElementById("pw-format-txt");
        		
        		if(id == null || id == ""){
        			idChk.style.display = "inline";
        			frm["Id"].focus();
        			return;
        		}
        		if(pw == null || pw == ""){
        			pwChk.style.display = "inline";
        			frm["Password"].focus();
        			return;
        		}
        		
        		frm.submit();
        		
        	}
        </script>
        
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
		<form action="loginOk.do" id="formsignup" method="POST" onsubmit="return loginChk();">
			<h1>Login</h1>
            <span>Please fill in login form</span>
            <label class="label" for="name">ID</label>
            <span id="id-format-txt">Incorrect ID format</span>
            <input type="text" placeholder="ID" id="Id" name="Id"/>
            <label class="label" for="name">Password</label>
            <span id="pw-format-txt">Incorrect Password format</span>
            <input type="password" placeholder="Password" id="Password" name="Password" />
            <span id="id-pw-backChk">Incorrect ID or Password</span>
            <button type="button" class="ghost" id="signUp" onclick="loginChk();">login</button>
        </form>
        
    </div>

<div class="overlay-container">
    <div class="overlay">
	</div>
</div>
</div>

<%-- 
	</c:otherwise>
</c:choose> --%>

</body>

</html>

