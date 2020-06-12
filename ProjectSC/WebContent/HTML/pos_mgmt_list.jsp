<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="pos_mgmt.beans.*"%>
<%
	//controller 로 부터 결과 데이터를 받는다.
	WriteDTO[] arr = (WriteDTO[]) request.getAttribute("pos_mgmt_list");
%>
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
	crossorigin="anonymous"></script>
<script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<link href="../CSS/pos_mgmt.css" rel="stylesheet" type="text/css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
				<li class="nav-item"><a class="nav-link h3 px-4" href="pos_rev.do">SALES</a></li>
				<li class="nav-item"><a class="nav-link bg-white text-dark h3 px-4">MENU CUSTOM</a></li>
			</ul>

		<div class="btn-group">
			<a class="nav-link h3 mr-2 text-white" href="#"><i class="fas fa-home"></i></a>
				<button type="button"
					class="btn btn-secondary dropdown-toggle bg-dark border-dark"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Side Menu
				</button>
			<div class="dropdown-menu dropdown-menu-right ">
				<button class="dropdown-item" type="button" onclick="location.href='my_page.html'">My page</button>
				<button class="dropdown-item" type="button" onclick="location.href='cs_list.do'">CS Board</button>
				<div class="dropdown-divider"></div>
				<button class="dropdown-item" type="button" onclick="location.href='logout.jsp'">LogOut</button>
			</div>
		</div>
		</div>
	</nav>
	<!-- 포스 메뉴 화면 틀 끝-->
	
	
	
	
	<div class="left">
		<div class="product">
			<!--더미용 -->
			<!--<button type="button" class="btn btn-outline-secondary btn-lg mi" data-toggle="button" aria-pressed="false"> -->
			<!--<br><span>Water</span><br><br><hr>2000</button> -->
		<form id="menuInfo" action="pos_mgmt_deleteOk.do" method="post">
		<%
			if(arr != null){
				for (int i =0; i<arr.length; i++){
		%>

				<button type="button" class="btn btn-outline-secondary btn-lg mi pressed product-image" data-toggle="button" aria-pressed="false">
				
				<span class="onsale-section"><span class="onsale">drink</span></span>
				<br><input type="hidden" name="uid" value="<%=arr[i].getUid() %>">
				<span><%= arr[i].getMenu_name() %></span><br><br><hr><%= arr[i].getMenu_price() %>
				
	
		<% }//end for 
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
			<!--<script src="JS/chkSubmit"></script> -->
            <form action="pos_mgmt_writeOk.do" id="formsignup" method="post" onsubmit="return chkSubmit2()">
               <label class="label" for="name">NAME</label>
               <input type="text" placeholder="이름을 입력하세요" name="menu_name"/>
               <label class="label" for="name">PRICE</label>
               <input type="number" placeholder="가격을 입력하세요" name="menu_price"/>
	            <div class="modal-footer">
	              <button type="submit" class="btn btn-primary ">Add</button>
	              <button type="button" class="btn btn-secondary " data-dismiss="modal">Close</button>
	            </div>
            </form><!-- 폼 끝 -->            
           </div>
          </div>
        </div>
      </div><!-- 모달을 띄울 공간 끝 -->
		<button type="button" class="btn btn-outline-primary btn-lg mim" data-toggle="modal" data-target="#addmenu">Add</button>
		<button type="button" class="btn btn-outline-primary btn-lg mim" id="deleteTrigger">Delete</button>
	</div>
	
	
	
	<!-- 수정을 위해 더블클릭하면 나오는 모달 -->
	<div class="modal fade" id="updatemenu" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog .modal-lg modal-right"> 
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="exampleModalLabel">Update menu</h3>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
           <div class="form-container sign-in-container">
				<!-- 폼 시작 -->
<!-- 				<script src="JS/chkSubmit"></script> -->
            <form action="pos_mgmt_updateOk.do" id="formUpdate" method="post" onsubmit="return chkSubmit()">
               <label class="label" for="name">Menu_NAME</label>
               <input type="text" placeholder="수정할 메뉴이름을 입력하세요" name="menu_update_name" id="menu_update_name"/>
               <label class="label" for="name">Menu_PRICE</label>
               <input text="number" placeholder="수정할 가격을 입력하세요" name="menu_update_price"/>
	            <div class="modal-footer">
	              <button id="updateTrigger" type="submit" class="btn btn-primary ">Update</button>
	              <button type="button" class="btn btn-secondary " data-dismiss="modal">Close</button>
	            </div>
            </form><!-- 폼 끝 -->            
         </div>
          </div>
        </div>
      </div>
     <!-- 수정을 위해 더블클릭하면 나오는 모달 끝 -->
	
	
	
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script>
function chkSubmit(){
	frm = document.forms["formUpdate"];	   //form 객체 가져오기
	
	var menu_update_name = frm.menu_update_name.value.trim();  			//작성자
	var menu_update_price = frm.menu_update_price.value.trim();		//제목
	
	if(menu_update_name == ""){
		$(document).ready(function () {
            swal({
                title: 'Failed',
                text: 'required please fill out Menu Name.',
                icon: 'warning',
                button:{
                		text : 'back',
                		value : true,
                }
            })
      });
		frm.menu_update_name.focus();
		return false;
	}
	
	if(menu_update_price == ""){
		$(document).ready(function () {
            swal({
                title: 'Failed',
                text: 'required please fill out Price.',
                icon: 'warning',
                button:{
                		text : 'back',
                		value : true,
                }
            })
      });
		frm.menu_update_price.focus();
		return false;
	}
	
}
</script>
<script>
function chkSubmit2(){
	frm = document.forms["formsignup"];	   //form 객체 가져오기
	
	var menu_name = frm.menu_name.value.trim(); //작성자
	var menu_price = frm.menu_price.value.trim(); //제목
	
	if(menu_name == ""){
		$(document).ready(function () {
            swal({
                title: 'Failed',
                text: 'required please fill out Menu Name.',
                icon: 'warning',
                button:{
                		text : 'back',
                		value : true,
                }
            })
      });
		frm.menu_name.focus();
		return false;
	}
	
	if(menu_price == ""){
		$(document).ready(function () {
            swal({
                title: 'Failed',
                text: 'required please fill out Price.',
                icon: 'warning',
                button:{
                		text : 'back',
                		value : true,
                }
            })
      });
		frm.menu_price.focus();
		return false;
	}
	
}
</script>
<script>
$('#deleteTrigger').click(function(){
//    var formData = $('#menuInfo').serialize();
   var formData2 = $('button.mi[aria-pressed="true"]').find('input[type="hidden"]').val();
   console.log(formData2); // uid 값이 찍힘
   var formData3 = "uid="+formData2;
   console.log(formData3);
   $.ajax({
      type : "POST",
      url : "pos_mgmt_deleteOk.do",
      cache : false,
      data : formData3,
      success : onDeleteSuccess,
      error : onDeleteError
   })   
})


function onDeleteSuccess(json, status){
//  alert($.trim(json));
// alert("삭제 성공!");

 //location.href="pos_mgmt_list.do";
	 $(document).ready(function () {
         swal({
             title: 'Success',
             text: 'Success Delete Menu',
             icon: 'success',
             button:{
             		text : 'Go to List',
             		value : true,
             }
         }).then((result) => {
         	if(result){
         		location.href='./pos_mgmt_list.do';
         	}
         });
   });
}
function onDeleteError(data, status){ 
	swal({
		title: 'Inappropriate action',
     	text: 'Please check out menu first',
     	icon: 'warning',
     	button:{
	      text : 'back',
	      value : true,
     }
    })
}
</script>


<!-- 더블 클릭 -->
<script>
$('button.mi').dblclick(function(){
// 	$(this).attr("data-target","#updatemenu");
// 	$('#updatemenu').show();
// 	var passdata = $(this).siblings('input').val();
	var passdata = $(this).find('input[type="hidden"]').val();
	console.log(passdata);
	$('#formUpdate').prepend("<input type='hidden' name='uid' value='"+passdata+"'>");
// 	$('#formUpdate').append("<input type='hidden' name='uid' value='"+passdata+"'>"); 이거 쓰면 안돼여
	$('#updatemenu').modal('show');	
})
</script>
<!-- 더블 클릭 끝 -->
<script>
// $('#updateTrigger').click(function(){
// 	var updateData = $('formUpdate').serialize();
// 	$.ajax({
// 		type : "POST",
// 		url : "pos_mgmt_updateOk.do",
// 		cache : false,
// 		data : updateData,
// 		success : onUpdateSuccess,
// 		error : onUpdateError
// 	})	
// })
// function onUpdateSuccess(json, status){

//  location.href="pos_mgmt_list.do";
// }
// function onUpdateError(data, status){ 
//  alert("error");
// }
</script>
</html>



