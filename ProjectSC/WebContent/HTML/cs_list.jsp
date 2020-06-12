<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cs_board.beans.*"%>
<%@ page import="pos.beans.*"%>

<%
	// Controller 로부터 결과 데이터 받음.
// 	CS_WriteDTO[] arr = (CS_WriteDTO[]) request.getAttribute("list");
	CS_WriteDTO[] arrlist = (CS_WriteDTO[]) request.getAttribute("testlist");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/cs_list.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>글 목록</title>
</head>
<script src="../JS/board.js"></script>
<body>
<!-- 		테스트 -->
		<div id="hiddenDiv" style="visibility:hidden; z-index:5; position:absolute; top:0; left:0; width:100%; height:50%">
			<div id="progg"><img style="width:100%;" src="../images/01_progress.gif"/></div>
		</div>
		<script>
			$(document).ready(function(){
				var hiddenDiv = document.all.hiddenDiv;
				hiddenDiv.style.visibility = "visible";
				
				$(document).ajaxStart(function(){
					$('#progg').show();
					$('#hiddenDiv').show().css({
						bottom:'0px',
						left:'0px'
					});
				}).ajaxStop(function(){
					$('#progg').hide();
					$('#hiddenDiv').hide();
				});
			});
		</script>
<!-- 		테스트 -->

	<header>
		<div class="logo">
			<img src="../images/logo.png" id="logoimg"> <span id="slogo" onclick="location.href='index.jsp'"><b>Asangbinsi</b></span>
		</div>
	</header>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<div class="container" id="container">
		<div class="form-container sign-in-container">
			<div id="formsignup">

				<div id="list">

					<h2>Customer Service</h2>

					<table>
						<tr id="gray">

							<th>No.</th>
							<th>Title</th>
							<th>ID</th>
							<th>regdate</th>
						</tr>
						<tbody id="tesst">
						<%
							//if (arrlist != null) {
								//for (int i = 0; i < arrlist.length; i++) {
						%>
<!-- 						아래 tr 진짜구간 -->
<!-- 						<tr> -->
<%-- 							<td><%=arrlist[i].getUid()%></td> --%>
<%-- 							<td><a href="cs_view.do?uid=<%=arrlist[i].getUid()%>"><%=arrlist[i].getSubject()%></a></td> --%>
<%-- 							<td><%=arrlist[i].getMem_id()%></td> --%>
<%-- 							<td><%= arr[i].getViewCnt() %></td> --%>
<%-- 							<td><%=arrlist[i].getRegDate()%></td> --%>
<!-- 						</tr> -->
<!-- 							위에 tr 진짜 구간 -->
						<%
						//	} // end for
						//	} // end if
						%>
						</tbody>
					</table>
					<br>
					<div id="btn">
						<!--btn 눌렀을시 cs_write.do 로 이동안함-->
						<button onclick="location.href='cs_write.do'">신규등록</button>
					</div>
					<div class="center">
						<ul class="pagination"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>