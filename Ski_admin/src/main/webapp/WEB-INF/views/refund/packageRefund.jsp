<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>패키지 환불 조회</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        tbody tr:hover {
            background-color: #f2f2f2;
        }
            .container {
        width: 90%;
        max-width: 1200px;
        padding: 20px;
        overflow-x: auto;
    }
    </style>
</head>
<body>
<div class="admin-container">
		<jsp:include page="../common/sidebar.jsp" />
	
	    <div class="container">
    <h1>패키지 환불 조회</h1>
    <table>
        <thead>
            <tr>
                <th>예약 번호</th>
                <th>체크인 날짜</th>
                <th>체크아웃 날짜</th>
                <th>환불 상태</th>
                <th>환불 날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="row" items="${packageRefundList}">
                <tr>
                    <td>${row.PACKAGERESERVNO}</td> <!-- 대문자 키 사용 -->
                    <td>${row.CHECKINDATE}</td> <!-- 대문자 키 사용 -->
                    <td>${row.CHECKOUTDATE}</td> <!-- 대문자 키 사용 -->
                    <td>${row.TOTALPRICE}</td> <!-- 대문자 키 사용 -->
                    <td>${row.REFUNDSTATUS}</td> <!-- 대문자 키 사용 -->
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
    </div>
</body>
</html>
