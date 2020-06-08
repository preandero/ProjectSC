<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="pos_mgmt.beans.*"%>
<%
	//controller 로 부터 결과 데이터를 받는다.
	WriteDTO[] arr = (WriteDTO[]) request.getAttribute("pos_mgmt_list");
%>

<!-- 	String SQL_INSERT_MENU = "insert into demo_menu_table values (uid_seq.nextval, ?, ?)"; -->
<%
// 	int cnt = (Integer) request.getAttribute("result");
// int mem_uid = (Integer)session.getAttribute("mem_uid");
// int store_uid = (Integer)session.getAttribute("mem_uid");  헤깔리지마세요 세션되어있습니다.
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메뉴 관리창</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
	integrity="sha384-1CmrxMRARb6aLqgBO7yyAxTOQE2AKb9GfXnEo760AUcUmFx3ibVJJAzGytlQcNXd"
	crossorigin="anonymous">
	
</script>
<link href="../CSS/pos_mgmt.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 포스 메뉴 화면 틀 시작-->
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand h2" href="#">POS WEBAPP!</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse " id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link h3 px-4"
					href="#"><i class="fas fa-arrow-circle-left icon-2x"></i></a></li>
				<li class="nav-item"><a class="nav-link h3 px-2" href="pos_sales.do">ORDER</a></li>
				<li class="nav-item"><a class="nav-link h3 px-4" href="#">SALES</a>
				</li>
				<li class="nav-item"><a
					class="nav-link bg-white text-dark h3 px-4">MENU CUSTOM</a></li>
			</ul>

			<div class="btn-group">
				<a class="nav-link h3 mr-2 text-white" href="#"> <i
					class="fas fa-home"></i></a>
				<button type="button"
					class="btn btn-secondary dropdown-toggle bg-dark border-dark"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Side Menu</button>
				<div class="dropdown-menu dropdown-menu-right ">
					<button class="dropdown-item" type="button" onclick="location.href='my_page.html'">My page</button>
					<button class="dropdown-item" type="button" onclick="location.href='cs_list.jsp'">CS Board</button>
					<div class="dropdown-divider"></div>
					<button class="dropdown-item" type="button" onclick="location.href='#'">LogOut</button>
				</div>
			</div>
		</div>
	</nav>
	
	<!-- 포스 메뉴 화면 틀 끝-->
	<div class="left">
		<div class="menu-items">
<!-- 			더미용 -->
<!-- 				<button type="button" class="btn btn-outline-secondary btn-lg mi" data-toggle="button" aria-pressed="false"> -->
<!-- 				<br><span>Water</span><br><br><hr>2000</button> -->
		<form id="menuInfo" action="pos_mgmt_deleteOk.do" method="post">
		<%
			if(arr != null){
				for (int i =0; i<arr.length; i++){
		%>
				<button type="button" class="btn btn-outline-secondary btn-lg mi pressed" data-toggle="button" aria-pressed="false">
				<br><input type="hidden" name="uid" value="<%=arr[i].getUid() %>">
				<span><%= arr[i].getMenu_name() %></span><br><br><hr><%= arr[i].getMenu_price() %></button>
		<% 
				}//end for 
		 } %>
		 </form>
		</div>
	</div>
	<div class="right1">
		<!-- 모달을 띄울 공간 -->
		 <!-- Modal -->
      <div class="modal fade" id="addmenu" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog .modal-lg modal-right"> 
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="exampleModalLabel">Add menu</h3>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
           <div class="form-container sign-in-container">
				<!-- 폼 시작 -->
<!-- 				<script src="JS/chkSubmit"></script> -->
            <form action="pos_mgmt_writeOk.do" id="formsignup" method="post" onsubmit="return chkSubmit()">
               <label class="label" for="name">NAME</label>
               <input type="text" placeholder="이름을 입력하세요" name="menu_name"/>
               <label class="label" for="name">PRICE</label>
               <input placeholder="가격을 입력하세요" name="menu_price"/>
	            <div class="modal-footer">
	              <button type="submit" class="btn btn-primary ">Add</button>
	              <button type="button" class="btn btn-secondary " data-dismiss="modal">Close</button>
	            </div>
            </form>
				<!-- 폼 끝 -->            
         </div>
          </div>
        </div>
      </div>
		<!-- 모달을 띄울 공간 -->
		<button type="button" class="btn btn-outline-primary btn-lg mi" data-toggle="modal" data-target="#addmenu">Add</button>
		<button type="button" class="btn btn-outline-primary btn-lg mi" id="deleteTrigger">Delete</button>
	</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script>
function chkSubmit(){
	frm = document.forms["formsignup"];	   //form 객체 가져오기
	
	var menu_name = frm.menu_name.value.trim();  			//작성자
	var menu_price = frm.menu_price.value.trim();		//제목
	
	if(menu_name == ""){
		alert("작성자 란은 반드시 입력해야 합니다.");
		frm.menu_name.focus();
		return false;
	}
	
	if(menu_price == ""){
		alert("제목은 반드시 작성해야합니다");
		frm.menu_price.focus();
		return false;
	}
	
}
</script>
<script>
$('#deleteTrigger').click(function(){
	var formData = $('#menuInfo').serialize();
	
	console.log(formData );
	$.ajax({
		type : "POST",
		url : "pos_mgmt_deleteOk.do",
		cache : false,
		data : formData,
		success : onSuccess,
		error : onError
	})	
})
function onSuccess(json, status){
//  alert($.trim(json));
// alert("삭제 성공!");

 location.href="pos_mgmt_list.do";
}
function onError(data, status){ 
 alert("error");
}

</script>
</html>
