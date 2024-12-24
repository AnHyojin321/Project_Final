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
        margin: 0;
        padding: 0;
    }

    .admin-container {
        display: flex;
    }

    .content {
        flex: 1;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .filter-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .filter-bar input, .filter-bar select {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    table th, table td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }

    table th {
        background-color: #f4f4f4;
        font-weight: bold;
    }

    table tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    table tbody tr:hover {
        background-color: #f1f1f1;
        cursor: pointer;
    }

    .status {
        padding: 5px 10px;
        border-radius: 5px;
        font-weight: bold;
    }

    .status.confirmed {
        background-color: #eafaf1;
        color: #2e7d32;
    }

    .status.cancelled {
        background-color: #fdecea;
        color: #e74c3c;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>
    <div class="admin-container">
        <jsp:include page="../common/sidebar.jsp" />
        <main class="content">
            <h1>패키지 예약 내역</h1>

            <div class="filter-bar">
                <input type="text" id="searchKeyword" placeholder="검색...">
                <select id="statusFilter">
                    <option value="all">모든 상태</option>
                    <option value="confirmed">예약 완료</option>
                    <option value="cancelled">취소됨</option>
                </select>
            </div>

            <table id="reservationTable">
                <thead>
                    <tr>
                        <th>예약 번호</th>
                        <th>패키지 이름</th>
                        <th>예약자 이름</th>
                        <th>예약일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${list}">
                        <tr data-status="${p.packageReservNo}">
                            <td>${p.packageReservNo}</td>
                            <td>${p.packageReservNo}</td>
                            <td>${p.packageReservNo}</td>
                            <td>${p.packageReservNo}</td>
                            <td>
                                <span class="status ${reservation.status == 'confirmed' ? 'confirmed' : 'cancelled'}">
                                    <c:choose>
                                        <c:when test="${reservation.status == 'confirmed'}">예약 완료</c:when>
                                        <c:otherwise>취소됨</c:otherwise>
                                    </c:choose>
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
</body>
</html>