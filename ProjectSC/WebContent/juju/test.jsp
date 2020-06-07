<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글작성</title>
<style>
* {
	box-sizing: border-box;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	height: 100vh;
    margin: -20px 0 50px;
	animation: tuv 2s ;
}

h1 {
	font-weight: bold;
	margin: 0;
}

span {
    font-size: 12px;
    margin: 20px 0px;
}

a {
	color: #333;
	font-size: 14px;
	text-decoration: none;
	margin: 15px 0;
}

.label{
    margin-top: 10px;
    font-size: 13px;
    text-align: left;
}

button {
	border-radius: 20px;
	border: 1px solid aliceblue;
	background-color: black;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button.ghost {
	border-style: none;
	border-color: #FFFFFF;
	color: white;
    margin-top: 40px;	
}

button:hover{
    border-style: none;
    border-color: #FFFFFF;
	transition: ease-in-out 0.7s;
	transform : scale(1.2);
	opacity: 1;

}

form {
    opacity: 0.85;
    z-index: 3;
	background-color: #FFFFFF;
	display: flex;
	justify-content: center;
	flex-direction: column;
	padding: 0px 50px;
	height: 100%;
}

form label{
    font-size: 11px;
}

#id-format-txt, #pw-format-txt, #id-pw-backChk {
	display: none;
}

input {
	background-color: #eee;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	
    margin-top: 100px;
	background-color: #fff;
	border-radius: 10px;
  	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(8, 8, 8, 0.22);
	position: relative;
	overflow: hidden;
    width: 908px;
    height: 600px;
    
	max-width: 100%;
	min-height: 480px;
}

.form-container {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	z-index: 1;
}

.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
}

.container.right-panel-active .overlay-container{
	transform: translateX(-100%);
}

.overlay {
    opacity: 0.64;
	background: rgb(22, 26, 51);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
  	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}


/* logo */
header{
	
	position: absolute;
	top: 0;
    width: 100%;
    height: 70px;
    background-color: rgb(26, 26, 26);
    opacity: 0.7;
}

#logoimg{
    padding-top: 10px;
    padding-left: 15px;
    height: 55px;
    width: 60px;
    text-align: left;
}
#slogo{
   font-size: 30px;
   color: white;
}
b{
	font-family: "Avenir Next", "Century Gothic", "Franklin Gothic Medium", "Helvetica Neue", Helvetica, Arial, sans-serif, 'Nanum Gothic Coding', monospace;
	color: white;
	position: absolute;
	top: 7px;
	margin: 6px 10px;
	font-weight: bold;
	letter-spacing: 1px;
}

  .form-elegant .font-small {
            font-size: 0.8rem;
        }

        .form-elegant .z-depth-1a {
            -webkit-box-shadow: 0 2px 5px 0 rgba(55, 161, 255, 0.26), 0 4px 12px 0 rgba(121, 155, 254, 0.25);
            box-shadow: 0 2px 5px 0 rgba(55, 161, 255, 0.26), 0 4px 12px 0 rgba(121, 155, 254, 0.25);
        }

        .form-elegant .z-depth-1-half,
        .form-elegant .btn:hover {
            -webkit-box-shadow: 0 5px 11px 0 rgba(85, 182, 255, 0.28), 0 4px 15px 0 rgba(36, 133, 255, 0.15);
            box-shadow: 0 5px 11px 0 rgba(85, 182, 255, 0.28), 0 4px 15px 0 rgba(36, 133, 255, 0.15);
        }

        .form-elegant .modal-header {
            border-bottom: none;
        }

        .modal-dialog .form-elegant .btn .fab {
            color: #2196f3 !important;
        }

        .form-elegant .modal-body,
        .form-elegant .modal-footer {
            font-weight: 400;
        }
</style>
</head>
<script>
function writeChk(){
	
	frm = document.forms["formwrite"];
	var id = frm["Id"].value;
	//alert(id);
	var pw = frm["Password"].value;
	//alert(pw);
	var idChk = document.getElementById("id-format-txt");
	var pwChk = document.getElementById("pw-format-txt");
	
	if(id == null || id == ""){
		idChk.style.display = "inline";
		frm["Id"].focus();
		return false;
	}
	if(pw == null || pw == ""){
		pwChk.style.display = "inline";
		frm["Password"].focus();
		return false;
	}
	
	frm.submit();
	
}

</script>
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
      <form action="writeOk.do" id="formwrite" method="POST" onsubmit="return writeChk();">
        <h1>글작성</h1>
        <span>Please fill in login form</span>
        <label class="label" for="name">작성자</label>
        <span id="id-format-txt">Incorrect ID format</span>
        <input type="text" placeholder="ID" id="Id" name="Id" />
        <label class="label" for="name">제목</label>
        <span id="pw-format-txt">Incorrect Password format</span>
        <input type="password" placeholder="Password" id="Password" name="Password" />
        <span id="id-pw-backChk">Incorrect ID or Password</span>
        <label class="label" for="content">내용</label>
        <textarea name="content"></textarea>
        <button type="submit" class="ghost" id="signUp" onclick="writeChk();">등록</button>
        <button type="button" onclick="location.href='list.do'">목록으로</button>
      </form>

    </div>
  </div>
</body>
</html>














