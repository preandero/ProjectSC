<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="pos.beans.*"%>
<script type="text/javascript"
	src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<%
	int paydate = -5;
	MemberDTO[] arr = (MemberDTO[]) request.getAttribute("list"); //형을 맞춰줘야한다.
	session.removeAttribute("mem_uid");

	if (arr != null) {
		int mem_uid = arr[0].getUid();
		session.setAttribute("mem_uid", mem_uid);
		if (arr[0].getPeriod() != 0) {
			paydate = (Integer) request.getAttribute("compare");

		}
	}
%>

<%
	if (arr == null) {
%>
<script>
		 $(document).ready(function () {
	            swal({
	                title: 'Login',
	                text: 'Incorrect ID or Password.',
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
<%
	} else if (paydate < 0 || paydate == -5) {
%>
<script>
$(document).ready(function () {
       swal({
           title: 'Login',
           text: 'Login Success!',
           icon: 'success',
           button:{
           		text : 'Move',
           		value : true,
           }
       }).then((result) => {
       	if(result){
       		location.href='pay_info.jsp';
       	}
       });
 });
</script>
<%
	} else {
%>
<script>
		 $(document).ready(function () {
	            swal({
	                title: 'Login',
	                text: 'Login Success!',
	                icon: 'success',
	                button:{
	                		text : 'Move',
	                		value : true,
	                }
	            }).then((result) => {
	            	if(result){
	            		location.href='pos_index.jsp';
	            	}
	            });
	      });
		</script>
<%
	}
%>





