<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<%  int cnt = (Integer) request.getAttribute("update");%>
<%
	if (cnt == 0) {
%>
<script>
$(document).ready(function () {
    swal({
        title: '....ㅠㅠ',
        text: '안됬다리',
        icon: 'warning',
        button:{
        		text : '돌아간다리..',
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
	} else {
%>
<script>
$(document).ready(function () {
    swal({
        title: '기모기모찌',
        text: '수정됬다리',
        icon: 'success',
        button:{
        		text : 'list출력한다리',
        		value : true,
        }
    }).then((result) => {
    	if(result){
    		location.href='./pos_mgmt_list.do';
    	}
    });
});
</script>
<%
	}
%>