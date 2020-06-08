<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/cs_write.css" rel="stylesheet" type="text/css">

<title>글작성</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
      <span id="slogo"><b>Asangbinsi</b></span>
    </div>
  </header>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <div class="container" id="container">

    <div class="form-container sign-in-container">
      <form action="cs_writeOk.do" id="formwrite" method="POST" onsubmit="return writeChk();">
        <h1>글작성</h1>
       <br>
        <label class="label" for="name" id="txt">작성자</label>
        <span id="name-format-txt">Incorrect Name format</span>
        <input type="text" placeholder="" id="name" name="name" />
        <label class="label" for="name" id="txt">제목</label>
        <span id="subject-format-txt">Incorrect subject format</span>
        <input type="text" placeholder="" id="subject" name="subject" />
        <label class="label" for="content" id="txt">내용</label>
        <textarea name="content" id="summernote"></textarea>
        <script>
        $('#summernote').summernote({
            tabsize: 2,
            height: 200
          });            // set focus to editable area after initializing summernote
           
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