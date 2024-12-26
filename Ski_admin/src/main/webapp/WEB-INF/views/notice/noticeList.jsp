<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 목록</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            font-size: 28px;
            color: #333;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

.content {
	flex:1;
	width:100%;
    padding: 30px;
    background-color: #f8f9fa;
}
        .info-box {
            background-color: #f0f4f8;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #d1d9e0;
            border-radius: 8px;
            color: #555;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }

        th, td {
            text-align: left;
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f7f9fc;
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }

        tr:hover {
            background-color: #f1f7fc;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        td a {
            color: #3498db;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        td a:hover {
            color: #1d78c1;
        }

        .pagination {
            margin: 20px 0;
            display: flex;
            justify-content: center;
            gap: 5px;
        }

        .pagination a, .pagination b {
            display: inline-block;
            padding: 8px 12px;
            text-decoration: none;
            color: #555;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            transition: all 0.3s ease;
        }

        .pagination a:hover {
            background-color: #3498db;
            color: #fff;
        }

        .pagination b {
            background-color: #3498db;
            color: #fff;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 14px;
            background-color: #2c3e50;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 20px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #1d78c1;
        }
    </style>
</head>
<body>

<div class="admin-container">
        <jsp:include page="../common/sidebar.jsp" />
        <main class="content">

    <h1>공지사항 목록</h1>

    <div class="container">
        <!-- 글작성 버튼 -->
        <a href="/admin/NoticeForm" class="btn">글작성</a>

        <!-- 안내 메시지 -->
        <div class="info-box">
            - 공지사항 목록입니다. 최신 공지사항을 확인하세요.
        </div>

        <!-- 목록 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="notice" items="${list}">
                    <tr>
                        <td>${notice.noticeNo}</td>
                        <td>${notice.noticeTitle}</td>
                        <td><fmt:formatDate value="${notice.createDate}" pattern="yyyy-MM-dd" /></td>
                        <td><a href="/admin/noticeDetail?noticeNo=${notice.noticeNo}">상세보기</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이징 처리 -->
        <div class="pagination">
            <c:if test="${pi.startPage > 1}">
                <a href="?currentPage=${pi.startPage - 1}">&laquo; 이전</a>
            </c:if>

            <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="i">
                <c:choose>
                    <c:when test="${i == pi.currentPage}">
                        <b>${i}</b>
                    </c:when>
                    <c:otherwise>
                        <a href="?currentPage=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${pi.endPage < pi.maxPage}">
                <a href="?currentPage=${pi.endPage + 1}">다음 &raquo;</a>
            </c:if>
        </div>
    </div>
       </main>
	</div>
</body>
</html>
