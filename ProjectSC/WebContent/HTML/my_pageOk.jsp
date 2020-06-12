<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
  <script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
   integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
   crossorigin="anonymous"></script>
<% // Controller 로부터 결과 데이터 받음.
   int cnt = (Integer)request.getAttribute("myUpdate");
%>

<% if(cnt == 0){ %>
      <script>
       $(document).ready(function () {
               swal({
                   title: 'Fail',
                   text: 'problem occured',
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
         });   // 브라우저가 기억하는 직전 페이지(입력중 페이지로)
      </script>
<% } else { %>
      <script>
       $(document).ready(function () {
               swal({
                   title: 'Success',
                   text: 'Update successfully',
                   icon: 'success',
                   button:{
                         text : 'Move',
                         value : true,
                   }
               }).then((result) => {
                  if(result){
                     location.href="pos_index.jsp";
                  }
               });
         });
         
      </script>

<% } %>