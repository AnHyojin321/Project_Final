<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id="autoPostForm" method="POST" action="payConfirm.li">
    <input type="hidden" name="tid" value="${tid}">
    <input type="hidden" name="memberId" value="${memberId}">
    <input type="hidden" name="totalCount" value="${totalCount}">
	<input type="hidden" name="totalPrice" value="${totalPrice}">
</form>
<script>
    document.getElementById("autoPostForm").submit();
</script>


</body>
</html>