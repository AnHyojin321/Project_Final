<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	thead>tr>th {
	    width: 200px;
	}
	.openBtn {
	    width: 100%;
	    height: 40px;
	    background-color: rgb(194, 220, 255);
	    border: 0px;
	    font-weight: bold;
	    cursor: pointer;
	}
	table {
	    border-spacing: 0px;
	    width: 100%;
	}
	th {
	    padding: 0px;
	}
	select {
	    display: none; 
	    width: 90%;
	    font-size: 13px;
	    background-color: #f5f5f5;
	    border: 1px solid #ccc;
	    padding: 8px 12px;
	    border-radius: 5px;
	    transition: border-color 0.3s, background-color 0.3s;
	}
	
	select:focus {
	    outline: none;
	    border-color: #666666;
	    background-color: #f5f5f5;
	}
	
	form>div {
	    width: 99%;
	    padding-top:10px;
	    text-align: right;
	}
	#editBtn {
	    width: 130px;
	    height: 40px;
	    background-color: rgb(194, 220, 255);
	    border: 1px solid gray;
	    border-radius: 5px;
	    font-weight: bold;
	    font-size: 15px;
	    transition: background-color 0.3s ease;
	}
	#editBtn:hover {
	    cursor: pointer;
	    background-color: rgb(139, 190, 255);
	}
	input[type="text"] {
		
	}
</style>
</head>
<body>
	<div class="admin-container">
		<jsp:include page="../common/sidebar.jsp" />
	    <div id="title">
	        <h1>리프트권 관리</h1>
	    </div>
	    <div>
	    	<form action="updateLift.li" method="post">
		        <table border="1px solid black">
		            <thead>
		                <tr>
		                    <th>LiftNo</th>
		                    <th>Type</th>
		                    <th>Age</th>
		                    <th>Price</th>
		                </tr>
		                <c:forEach var="li" items="${requestScope.list}" varStatus="status">
						    <tr>
						        <td>
						            ${li.liftNo}
						            <input type="hidden" name="li[${status.index}].liftNo" value="${li.liftNo}" />
						        </td>
						        <td>
						            ${li.liftType}
						            <input type="hidden" name="li[${status.index}].liftType" value="${li.liftType}" />
						        </td>
						        <td>
						            ${li.liftAge}
						            <input type="hidden" name="li[${status.index}].liftAge" value="${li.liftAge}" />
						        </td>
						        <td>
						        	<input type="text" name="li[${status.index}].liftPrice" value="${li.liftPrice}" />
						        </td>
						    </tr>
						</c:forEach>
		            </thead>
		        </table>
		        <div>
		        	<input type="submit" value="저장하기">
		        </div>
	    	</form>
	    </div>
	</div>
</body>
</html>