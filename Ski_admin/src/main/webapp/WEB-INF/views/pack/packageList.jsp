<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        width: 90%;
        max-width: 1200px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        padding: 20px;
        overflow-x: auto;
    }

    .container h1 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table thead {
        background-color: #007BFF;
        color: #fff;
    }

    table th, table td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }

    table th {
        font-size: 16px;
        font-weight: bold;
    }

    table tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .btn {
        display: inline-block;
        padding: 8px 16px;
        margin: 5px;
        font-size: 14px;
        color: #fff;
        background-color: #007BFF;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        text-decoration: none;
        text-align: center;
    }

    .btn:hover {
        background-color: #0056b3;
    }

    .btn-delete {
        background-color: #dc3545;
    }

    .btn-delete:hover {
        background-color: #a71d2a;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>패키지 상품 목록</h1>
        <table>
            <thead>
                <tr>
                    <th>상품 번호</th>
                    <th>상품 구성</th>
                    <th width="300">상품 이름</th>
                    <th>시작 날짜</th>
                    <th>마감 날짜</th>
                    <th>판매여부</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="p" items="${list}">
                <tr>
                    <td>${p.packageNo}</td>
                    <td>
				        <c:choose>
				            <c:when test="${p.packageSet == 1}">객실+리프트</c:when>
				            <c:when test="${p.packageSet == 2}">리프트+락커</c:when>
				            <c:when test="${p.packageSet == 3}">객실+리프트+락커</c:when>
				            <c:otherwise>알 수 없음</c:otherwise>
				        </c:choose>
				    </td>
                    <td>${p.packageName}</td>
                    <td>${p.availableStartDate}</td>
                    <td>${p.availableEndDate}</td>
                    <td>${p.packageStatus}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="packEnrollForm.pk" class="btn">새 패키지 등록</a>
    </div>
</body></body>
</html>