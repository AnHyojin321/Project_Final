<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id="autoPostForm" method="POST" action="payConfirm.ro">
    <input type="hidden" name="tid" value="${tid}">
    <input type="hidden" name="memberNo" value="${memberNo}">
    <input type="hidden" name="roomNo" value="${roomNo}">
    <input type="hidden" name="checkInDate" value="${checkInDate}">
    <input type="hidden" name="checkOutDate" value="${checkOutDate}">
    <input type="hidden" name="amount" value="${amount}">
</form>
<script>
    document.getElementById("autoPostForm").submit();
</script>


</body>
</html>