<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<%
	int cnt = (Integer) request.getAttribute("delete");
%>
<%-- 위 트랙잭션이 마무리되면 페이지 보여주기 --%>
<% 
	if(cnt == 0 ){ %>
		<script>
		 $(document).ready(function () {
	            swal({
	                title: 'Failed!',
	                text: 'Failed Delete Menu',
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
<% }else{ %>
		<script>
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
		</script>
<% } %>





