<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>객실 환불 조회</title>
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
    </style>
</head>
<body>
    <h1>객실 환불 조회</h1>
    <table>
        <thead>
            <tr>
                <th>예약 번호</th>
                <th>체크인 날짜</th>
                <th>체크아웃 날짜</th>
                <th>환불 상태</th>
            </tr>
        </thead>
        <tbody>
         <c:forEach var="row" items="${roomRefundList}">
    <tr>
        <td>${row.ROOMRESERVNO}</td>
        <td>${row.CHECKINDATE}</td>
        <td>${row.CHECKOUTDATE}</td>
        <td>${row.REFUNDSTATUS}</td>
    </tr>
</c:forEach>

        </tbody>
    </table>
</body>
</html>
