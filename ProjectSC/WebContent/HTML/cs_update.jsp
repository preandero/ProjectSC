<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cs_board.beans.*" %>


<% // Controller 로부터 결과 데이터 받음
   CS_WriteDTO [] arr = (CS_WriteDTO [])request.getAttribute("update");
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
   }


   int mem_uid = arr[0].getMem_uid();
	String mem_id= arr[0].getMem_id();
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
<script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
   integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
   crossorigin="anonymous"></script>
  <!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
   <!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
   
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
      <span id="slogo" onclick="location.href='index.jsp'"><b>Asangbinsi</b></span>
    </div>
  </header>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <div class="container" id="container">
    <div class="form-container sign-in-container">

<form name="frm" action="cs_updateOk.do?uid=<%= uid %>" method="post" onsubmit="return chkSubmit()">
<h1>Customer Service</h1>
<input type="hidden" name="uid" value="<%= uid %>"/>
작성자 : <%= mem_id %><br> <%-- 작성자 이름 변경 불가 --%>
제목 : 
<input type="text" name="subject" value="<%= subject %>"/><br>
내용: <br>
<textarea name="content" id="summernote"><%=content %></textarea>
<script>
        $('#summernote').summernote({
            tabsize: 2,
            height: 300
          });            // set focus to editable area after initializing summernote
           
          /* $("p").each(function(){
        	 if(!$(this).text().trim().length){
        		 $(this).remove();
        	 } 
          }); */
          
          /* $("summernote").summernote('editor.insertText', '<text>'); */
</script>
<br>
<input type="submit" value="수정하기" id="btn"/>
<button id="btn" onclick="history.back()">이전으로</button>
<button id="btn" onclick="location.href='cs_list.do'">목록보기</button>
</form>
</div>
  </div>
</body>
</html>