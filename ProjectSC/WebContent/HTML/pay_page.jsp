<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="kakaopay.jsp" method="POST">
	<input type="text" name="name" value="홍성용">
	<input type="email" name="email" value="skuley@naver.com">
	<input type="text" name="phone" value="000-222-5555">
	<input type="text" name="address" value="aaaaa-aaaa">
	<input type="number" name="totalPrice" value="20000">
	<select name="period">
		<option value="30">30</option>
		<option value="60">60</option>
		<option value="90">90</option>
	</select>
	<input type="submit" value="send">
</form>

</body>
</html>