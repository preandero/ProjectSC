<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
   integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
   crossorigin="anonymous"></script>
<%  // Controller 로부터 결과 데이터 받음
   int cnt = (Integer)request.getAttribute("updateOk");
   int uid = Integer.parseInt(request.getParameter("uid"));
%>  
1234
<% if(cnt == 0){ %>
   <script>
    $(document).ready(function () {
         swal({
             title: 'Fail',
             text: 'please try again',
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
<% } else { %>
   <script>
    $(document).ready(function () {
         swal({
             title: 'Great',
             text: 'change Sucessfully',
             icon: 'success',
             button:{
                   text : 'go to list',
                   value : true,
             }
         }).then((result) => {
            if(result){
               location.href="cs_view.do?uid=<%= uid%>";
            }
         });
   });
      
   </script>
<% } %>

