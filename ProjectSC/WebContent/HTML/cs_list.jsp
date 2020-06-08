<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cs_board.beans.*" %>    

<%  // Controller 로부터 결과 데이터 받음.
   CS_WriteDTO [] arr = (CS_WriteDTO [])request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/cs_list.css" rel="stylesheet" type="text/css">
<title>글 목록</title>
</head>
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
  <form action="#" id="formsignup">
    
    <div id="list">

      <h2>Customer Service</h2>
     
      <table>
        <tr id="gray">

          <th>UID</th>
          <th>Title</th>
          <th>m_uid</th>
          <th>regdate</th>
        </tr>
<%
   if(arr != null){
      for(int i = 0; i < arr.length; i++){
%>
         <tr>
            <td><%= arr[i].getUid() %></td>
            <td><a href="cs_view.do?uid=<%= arr[i].getUid()%>"><%= arr[i].getSubject() %></a></td>
            <td><%=arr[i].getM_uid() %></td>
            <%-- <td><%= arr[i].getViewCnt() %></td> --%>
            <td><%= arr[i].getRegDate() %></td>
         </tr>
<%         
      } // end for
   } // end if
%>
      </table>
      <br>
      <div id="btn">
      <button onclick="location.href='cs_write.do'">신규등록</button>
      </div>
</body>
</html>