<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cs_board.beans.*" %>
<script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
   integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
   crossorigin="anonymous"></script>

<% // Controller 로부터 결과 데이터 받음
   CS_WriteDTO [] arr = (CS_WriteDTO [])request.getAttribute("list");
   int uid = Integer.parseInt(request.getParameter("uid"));

%>

<%
   if(arr == null || arr.length == 0){ 
%>
         <script>
          $(document).ready(function () {
               swal({
                   title: '....ㅠㅠ',
                   text: '이미삭제되었따리',
                   icon: 'warning',
                   button:{
                         text : '돌아간다리..',
                         value : true,
                   }
               }).then((result) => {
                  if(result){
                     history.back();
                  }
               });
         });
         </script>
<%

   int m_uid = arr[0].getM_uid();
   String subject = arr[0].getSubject();
   String content = arr[0].getContent();
   String regDate = arr[0].getRegDate();

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수정 <%= subject %></title>
<link href="../CSS/cs_update.css" rel="stylesheet" type="text/css">
</head>
<script>
function chkSubmit(){
   frm = document.forms['frm'];
   var subject = frm['subject'].value.trim();
   
   if(subject == ""){
      alert("제목은 반드시 작성해야 합니다");
      frm['subject'].focus();
      return false;
   }
   return true;
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

<form name="frm" action="updateOk.do" method="post" onsubmit="return chkSubmit()">
<h1>수정</h1>
<input type="hidden" name="uid" value="<%= uid %>"/>
작성자 : <%= m_uid %><br> <%-- 작성자 이름 변경 불가 --%>
제목 : 
<input type="text" name="subject" value="<%= subject %>"/><br>
내용: <br>
<textarea name="content"><%= content %></textarea>
<br>
<input type="submit" value="수정하기" id="btn"/>
<button onclick="history.back()">이전으로</button>
<button onclick="location.href='cs_list.do'">목록보기</button>
</form>
</div>
  </div>
</body>
</html>