<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("mem_uid");
	session.removeAttribute("mem_id");
// 	session.invalidate();
	
//   
    
%>
<script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

   <script>
   $(document).ready(function () {
        swal({
            title: 'Logout',
            text: 'successfully',
            icon: 'success',
            button:{
                  text : 'go to main',
                  value : true,
            }
        }).then((result) => {
           if(result){
              location.href='index.jsp';
           }
        });
  });
   </script>
