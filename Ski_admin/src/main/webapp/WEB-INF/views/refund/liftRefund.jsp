<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>리프트권 환불 조회</title>
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
    <h1>리프트권 환불 조회</h1>
    <table>
        <thead>
            <tr>
                <th>구매 번호</th>
                <th>구매 날짜</th>
                <th>총 금액</th>
                <th>사용 상태</th>
                <th>환불 상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="row" items="${liftRefundList}">
                <tr>
                   <td>${row.LIFTPURCHASENO}</td>
					<td>${row.PURCHASEDATE}</td>
					<td>${row.TOTALPRICE}</td>
					<td>${row.USEDSTATUS}</td>
					<td>${row.REFUNDSTATUS}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
    </div>
</body>
</html>
