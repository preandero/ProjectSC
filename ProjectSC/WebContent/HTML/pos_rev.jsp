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



<link href="../CSS/pos_rev.css" rel="stylesheet" type="text/css">
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
				<li class="nav-item"><a class="nav-link h3 px-4" href="#">SALES</a></li>
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
	
	</body>
</html>



