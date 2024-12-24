<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>락커 환불 조회</title>
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
    <h1>락커 환불 조회</h1>
    <table>
        <thead>
            <tr>
                <th>예약 번호</th>
                <th>시작 날짜</th>
                <th>종료 날짜</th>
                <th>총 금액</th>
                <th>환불 상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="row" items="${lockerRefundList}">
                <tr>
                    <td>${row.LOCKERRESERVNO}</td>
                    <td>${row.LOCKERSTARTDATE}</td>
                    <td>${row.LOCKERENDDATE}</td>
                    <td>${row.TOTALPRICE}</td>
                    <td>${row.REFUNDSTATUS}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
