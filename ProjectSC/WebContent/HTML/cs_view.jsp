<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
   integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
   crossorigin="anonymous"></script>
<%@ page import="cs_board.beans.*" %>

<% // Controller 로부터 결과 데이터 받음
   CS_WriteDTO [] arr = (CS_WriteDTO [])request.getAttribute("view");

	String mem_id=(String)session.getAttribute("mem_id");
%>

<%
   if(arr == null || arr.length == 0){ 
%>
         <script>
          $(document).ready(function () {
                  swal({
                      title: '....ㅠㅠ',
                      text: '이제 없다리',
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
      return;   // 더이상 JSP 프로세싱 하지 않고 종료
   } // end if
%>
<%
   int uid = Integer.parseInt(request.getParameter("uid"));
 
   String subject = arr[0].getSubject();
   String content = arr[0].getContent();
   String regDate = arr[0].getRegDate();
   /*int viewCnt = arr[0].getViewCnt();*/
%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>읽기 <%= subject %></title> <!-- title에 글제목 넣기 -->
<link href="../CSS/cs_view.css" rel="stylesheet" type="text/css">
</head>
<script>
function chkDelete(uid){
   // 삭제 여부, 다시 확인 하고 진행하기
   swal({
        title: "진짜 지울꺼냐리?",
        text: "한번 지우면 복구 못한다리",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
           location.href = 'cs_deleteOk.do?uid=' + uid;
        } else {
          
        }
      });
//    if(r){
//       location.href = 'deleteOk.do?uid=' + uid;
//    }
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
      <div  id="formwrite" method="POST">
      
<h2><%= subject %></h2>
<br>
작성자 : <%= mem_id %><br>
제목 : <%= subject %><br>
등록일 : <%= regDate %><br>
내용: <br>
<div>
<%= content %>
</div>

<br>
<button onclick="location.href='cs_update.do?uid=<%= uid%>'">수정</button>
<button onclick="location.href = 'cs_list.do'">목록</button>
<button onclick="chkDelete(<%= uid %>)">삭제</button>
<button onclick="location.href = 'cs_write.do'">신규</button>

</div>

    </div>
  </div>
</body>
</html>