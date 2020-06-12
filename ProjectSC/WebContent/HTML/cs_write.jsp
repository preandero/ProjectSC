<%@page import="cs_board.beans.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%CS_WriteDTO[] arr = (CS_WriteDTO[]) request.getAttribute("list");
String mem_id=(String)session.getAttribute("mem_id");

%>
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/cs_write.css" rel="stylesheet" type="text/css">

<title>글작성</title>
<!-- 부트스트랩과 제이쿼리 라이브러리를 사용하기 위한 선언 -->  
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!--summernote의 스타일시트와 자바스크립트을 사용하기 위한 선언 -->  
	<link href="./dist/summernote.css" rel="stylesheet">
	<script src="./dist/summernote.js"></script>



<script type="text/javascript">
        /* summernote에서 이미지 업로드시 실행할 함수 */
	 	function sendFile(file, editor) {
            // 파일 전송을 위한 폼생성
	 		data = new FormData();
	 	    data.append("uploadFile", file);
	 	    $.ajax({ // ajax를 통해 파일 업로드 처리
	 	        data : data,
	 	        type : "POST",
	 	        url : "./summernote_imageUpload.jsp",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
	 	        	$(editor).summernote('editor.insertImage', data.url);
	 	        }
	 	    });
	 	}
	</script>
</head>



<script>

function writeChk(){
   
   frm = document.forms["formwrite"];
   var name = frm["name"].value;
   //alert(id);
   var subject = frm["subject"].value;
   //alert(pw);
   var nameChk = document.getElementById("name-format-txt");
   var subjectChk = document.getElementById("subject-format-txt");
   
   if(name == null || name == ""){
      nameChk.style.display = "inline";
      frm["name"].focus();
      return false;
   }
   if(subject == null || subject == ""){
      subjectChk.style.display = "inline";
      frm["subject"].focus();
      return false;
   }
   
   frm.submit();
   
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
      <form action="cs_writeOk.do" id="formwrite" method="POST" onsubmit="return writeChk();">
        <h1>Customer Service</h1>
       <br>
        <label class="label" for="name" id="txt">작성자</label>
        <span id="name-format-txt">Incorrect Name format</span>
        <input type="text" placeholder="" id="name" name="name" value="<%= mem_id%>" readonly/>
        <label class="label" for="name" id="txt">제목</label>
        <span id="subject-format-txt">Incorrect subject format</span>
        <input type="text" placeholder="" id="subject" name="subject" />
        <label class="label" for="content" id="txt">내용</label>
        <textarea name="content" id="summernote"></textarea>
        <script>
        $(document).ready(function() {
            $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                height: 300,
				callbacks: { // 콜백을 사용
                    // 이미지를 업로드할 경우 이벤트를 발생
				    onImageUpload: function(files, editor, welEditable) {
					    sendFile(files[0], this);
					}
				}
			});
		});



        // set focus to editable area after initializing summernote
         
        /* $("#summernote").on("summernote.enter", function(we, e){
        	$(this).summernote("pasteHTML", "<t><t>");
        	e.preventDefault();
        }); */
        
        
</script>
       <div id="btn">
        <button type="submit" class="ghost" id="signUp" onclick="writeChk();">등록</button>
        <button type="button" onclick="location.href='cs_list.do'" id="btn">목록</button>
        </div>
      </form>
 
    </div>
  </div>
</body>
</html>