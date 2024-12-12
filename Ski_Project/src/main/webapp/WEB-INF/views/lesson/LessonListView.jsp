<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강습예약</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .reservation-status {
            background-color: #007bff;
            color: white;
            padding: 2px 5px;
            border-radius: 3px;
            font-size: 0.8em;
        }
        
        /* 페이징 바 디자인 */
        .pagination {
            display: flex;
            justify-content: center; /* 중앙 정렬 */
            align-items: center;
            margin: 20px 0;
            list-style: none;
            padding: 0;
        }
        .pagination .page-item {
            margin: 0 2px;
        }
        .pagination .page-link {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            color: #007bff;
            text-decoration: none;
        }
        .pagination .page-item.active .page-link {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }
        .pagination .page-item.disabled .page-link {
            color: #6c757d;
            pointer-events: none;
            background-color: #e9ecef;
            border-color: #dee2e6;
        }
        .pagination .page-link:hover {
            background-color: #f1f1f1;
            color: #0056b3;
            text-decoration: none;
        }

        .search-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .search-bar input {
            padding: 5px;
            margin-right: 5px;
        }
        .search-bar button {
            padding: 5px 10px;
            background-color: #333;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <h1>강습예약</h1>

    <div style="overflow-x: auto;">
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>예약상태</th>
                    <th>제목</th>
                    <th>강습프로그램</th>
                    <th>강습시간</th>
                    <th>접수기간</th>
                    <th>시작일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="l" items="${requestScope.list}">
                    <tr>
                        <td class="resNo">${ l.resNo }</td>
                        <td><span class="reservation-status">예약상태</span></td>
                        <td>${ l.lessonTitle } 예약안내</td>
                        <td>${ l.lessonType }</td>
                        <td>${ l.lessonTime }</td>
                        <td>${ l.lessonDate }</td>
                        <td>${ l.lessonResDate }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 페이징 바 -->
    <div class="pagination">
        <!-- Previous 버튼 -->
        <c:if test="${requestScope.pi.currentPage > 1}">
            <li class="page-item">
                <a class="page-link" href="list.le?cpage=${requestScope.pi.currentPage - 1}">&lt;</a>
            </li>
        </c:if>
        <c:if test="${requestScope.pi.currentPage eq 1}">
            <li class="page-item disabled">
                <a class="page-link" href="#">&lt;</a>
            </li>
        </c:if>

        <!-- 페이지 번호 -->
        <c:forEach var="p" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}">
            <c:choose>
                <c:when test="${p eq requestScope.pi.currentPage}">
                    <li class="page-item active">
                        <a class="page-link" href="#">${p}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="list.le?cpage=${p}">${p}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <!-- Next 버튼 -->
        <c:if test="${requestScope.pi.currentPage < requestScope.pi.maxPage}">
            <li class="page-item">
                <a class="page-link" href="list.le?cpage=${requestScope.pi.currentPage + 1}">&gt;</a>
            </li>
        </c:if>
        <c:if test="${requestScope.pi.currentPage eq requestScope.pi.maxPage}">
            <li class="page-item disabled">
                <a class="page-link" href="#">&gt;</a>
            </li>
        </c:if>
    </div>

    <!-- 검색 바 -->
    <div class="search-bar">
        <button>목록</button>
        <div>
            <input type="text" placeholder="제목">
            <button>검색</button>
        </div>
    </div>
</body>
</html>
