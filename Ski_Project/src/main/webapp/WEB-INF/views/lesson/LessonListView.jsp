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
        #lessonList {
        	cursor : pointer;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <h1>강습예약</h1>

    <div style="overflow-x: auto;">
        <table id="lessonList">
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
                        <td class="resNo">${ les.resNo }</td>
                        <td><span class="reservation-status">예약상태</span></td>
                        <td>${ les.lessonTitle }</td>
                        <td>${ les.lessonType }</td>
                        <td>${ les.lessonTime }</td>
                        <td>${ les.lessonResDate }</td>
                        <td>${ les.lessonDate }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
                
            <script>
            	// 게시글 하나를 나타내는 tr 태그에 클릭이벤트 걸기
// 게시글 하나를 나타내는 tr 태그에 클릭 이벤트 걸기
				$(function() {
				    $("#lessonList>tbody>tr").click(function() {
				        // 글번호 뽑기
				        let resNo = $(this).children(".resNo").text().trim(); // 클래스 이름을 정확히 지정
				        if (resNo) {
				            // Path Variable 방식으로 이동
				            location.href = "lesson/" + resNo;
				        } else {
				            console.error("글 번호를 가져올 수 없습니다.");
				        }
				    });
				});

            </script>

    <!-- 페이징 바 -->
<div class="pagination">
    <c:if test="${pi.currentPage > 1}">
        <li class="page-item">
            <a class="page-link" href="list.le?currentPage=${pi.currentPage - 1}">&lt;</a>
        </li>
    </c:if>

    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
        <c:choose>
            <c:when test="${p eq pi.currentPage}">
                <li class="page-item active">
                    <a class="page-link" href="#">${p}</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="list.le?currentPage=${p}">${p}</a>
                </li>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${pi.currentPage < pi.maxPage}">
        <li class="page-item">
            <a class="page-link" href="list.le?currentPage=${pi.currentPage + 1}">&gt;</a>
        </li>
    </c:if>
</div>

	
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
        <button onclick="location.href='addLessonForm.le'" style="margin-left: auto; padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer;">
            강습예약
        </button>
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
