<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설레눈 리조트 - 강습 예약</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4f7f9;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 40px;
            font-weight: 700;
        }
        .reservation-table {
            width: 100%;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .reservation-table th, 
        .reservation-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        .reservation-table th {
            background-color: #3498db;
            color: #fff;
            font-weight: 500;
            text-transform: uppercase;
        }
        .reservation-table tr:last-child td {
            border-bottom: none;
        }
        .reservation-table tbody tr:hover {
            background-color: #f5f5f5;
            cursor: pointer;
        }
        .reservation-status {
            background-color: #2ecc71;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8em;
            font-weight: 500;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        .pagination a {
            color: #3498db;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
            margin: 0 4px;
            border-radius: 4px;
        }
        .pagination a.active {
            background-color: #3498db;
            color: white;
            border: 1px solid #3498db;
        }
        .pagination a:hover:not(.active) {
            background-color: #ddd;
        }
        .search-bar {
            display: flex;
            justify-content: space-between; /* 왼쪽 정렬 */
            gap: 10px; /* 요소 간 간격 */
            margin-bottom: 20px; /* 아래 여백 */
            align-items: center; /* 수직 정렬 */
        }
        .search-bar input {
            padding: 10px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .search-bar button, 
        .reservation-btn {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .search-bar button:hover, 
        .reservation-btn:hover {
            background-color: #2980b9;
        }
        .reservation-btn {
            margin-left: auto;
            display: block;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="container">
        <h1>강습 예약</h1>

        <button onclick="location.href='addLessonForm.le'" class="reservation-btn">
            <i class="fas fa-plus"></i> 강습 예약하기
        </button>

<div class="search-bar">
    <!-- 전체 목록 버튼: 왼쪽 -->
    <button type="button" onclick="location.href='list.le'" style="display: flex; align-items: center;">
        <i class="fas fa-list" style="margin-right: 5px;"></i> 전체 목록
    </button>

    <!-- 검색 폼: 오른쪽 -->
    <form action="list.le" method="get" style="display: flex; gap: 10px;">
        <input type="text" name="keyword" placeholder="제목 검색" value="${keyword}">
        <button type="submit">
            <i class="fas fa-search"></i> 검색
        </button>
    </form>
</div>

        <!-- 예약 테이블 -->
        <table class="reservation-table">
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
                <c:forEach var="les" items="${requestScope.list}">
                    <tr>
                        <td class="resNo">${les.resNo}</td>
                        <td><span class="reservation-status">예약완료</span></td>
                        <td>${les.lessonTitle}</td>
                        <td>${les.lessonType}</td>
                        <td>${les.lessonTime}</td>
                        <td>${les.lessonResDate}</td>
                        <td>${les.lessonDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <c:if test="${pi.currentPage > 1}">
                <a href="list.le?currentPage=${pi.currentPage - 1}">&laquo;</a>
            </c:if>

            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                <c:choose>
                    <c:when test="${p eq pi.currentPage}">
                        <a href="#" class="active">${p}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="list.le?currentPage=${p}">${p}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${pi.currentPage < pi.maxPage}">
                <a href="list.le?currentPage=${pi.currentPage + 1}">&raquo;</a>
            </c:if>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function() {
            $(".reservation-table tbody tr").click(function() {
                let resNo = $(this).find(".resNo").text().trim();
                if (resNo) {
                    location.href = "lesson/" + resNo;
                } else {
                    console.error("글 번호를 가져올 수 없습니다.");
                }
            });
        });
    </script>
</body>
</html>
