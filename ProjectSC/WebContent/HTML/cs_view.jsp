<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
   integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
   crossorigin="anonymous"></script>
<%@ page import="cs_board.beans.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<% // Controller 로부터 결과 데이터 받음
	CS_WriteDTO [] arr = (CS_WriteDTO [])request.getAttribute("view");
	String mem_id=arr[0].getMem_id();
	int mem_uid=arr[0].getMem_uid();
	
%>

<%
   if(arr == null || arr.length == 0){ 
%>
         <script>
          $(document).ready(function () {
                  swal({
                      title: 'No posts',
                      text: 'There are no posts',
                      icon: 'warning',
                      button:{
                            text : 'back',
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
   int chk_uid = (int)session.getAttribute("mem_uid");
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
        title: "Are you sure you want to delete?",
        text: "it cannot be recovered",
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
      <span id="slogo" onclick="location.href='index.jsp'"><b>Asangbinsi</b></span>
    </div>
  </header>


  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <div class="container" id="container">

    <div class="form-container sign-in-container">
      <div  id="formwrite">
      
<h1>Customer Service</h1>
<br>
<h4>작성자  <br>
 <input type="text" value="<%= mem_id %>" readonly>  </h4>

<h4>등록일 <br> <input type="text" value="<%= regDate %>" readonly> </h4>
<h4 >제목 <br><input id="subject" type="text"value="<%= subject %>" readonly> </h4>
내용  <br>
<div id ="contentbox">
<input id="contentin" type="text" value="<%= content %>" readonly>
</div>


<input type="hidden" id="mem_uid" name="mem_uid" value="<%= mem_uid %>">
<input type="hidden" id="chk_uid" name="chk_uid" value = "<%= chk_uid %>">

<!-- 절취선 -->
<!-- 첨부파일 및 다운로드 링크 -->
	<c:if test="${fn:length(file) > 0 }">
		<ul>
			<c:forEach var = "element" items="${file }">
				<li><a href="download.do?uid=${element.uid}">${element.source }</a></li>
			</c:forEach>
			<!-- 이미지인 경우 보여주기 -->
			<c:forEach var = "element" items="${file }">
				<c:if test="${element.image == true }">
					<div style="width : 300px">
						<img style="width:100%; height:auto;"
						src="/ProjectSC/upload/${element.file }"/>
					</div>
				</c:if>
			</c:forEach>
		</ul>
	</c:if>
<!-- 절취선 -->
<div id="buttons">
<br>
<button onclick="location.href='cs_update.do?uid=<%= uid%>'" id="udt">수정</button>
<button onclick="chkDelete(<%= uid %>)" id="dlt">삭제</button>
<button onclick="location.href = 'cs_write.do'" id="new">신규</button>
<button onclick="location.href = 'cs_list.do'">목록</button>
</div>



<%if(mem_uid!=chk_uid){%>
<script>	
	$("#udt").hide();
	$("#dlt").hide();
	$("#new").hide();
</script>
<%}%>
    </div>
  </div>
</body>
</html>