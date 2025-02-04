<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            font-size: 30px;
        }

        .info-box {
            background-color: #f3f3f3;
            padding: 10px;
            margin: 20px auto;
            width: 90%;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .info-box p {
            margin: 0;
            font-size: 14px;
            color: #555;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f0f0f0;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .pagination {
            text-align: center;
            margin: 20px 0;
        }

        .pagination a {
            text-decoration: none;
            padding: 8px 12px;
            margin: 0 5px;
            background-color: #ddd;
            color: #333;
            border-radius: 5px;
        }

        .pagination a:hover, .pagination b {
            color: black;
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            background-color: #8c7ae6;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            margin: 5px;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

    <h1>공지사항</h1>

    <!-- 안내 메시지 -->
    <div class="info-box">
        <p> 공지사항 목록입니다. 최신 공지사항을 확인하세요. [추가 문의 필요 시 채널을 통해 문의 부탁드립니다.]</p>
    </div>

   <table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
    </tr>
    <c:forEach var="notice" items="${list}">
        <tr>
            <td>${notice.noticeNo}</td>
            <!-- 제목에 a 태그 추가 -->
            <td>
                <a href="/ski/noticeDetail?noticeNo=${notice.noticeNo}" style="text-decoration: none; color: #3498db;">
                    ${notice.noticeTitle}
                </a>
            </td>
            <td>
                <fmt:formatDate value="${notice.createDate}" pattern="yyyy.MM.dd" />
            </td>
        </tr>
    </c:forEach>
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
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>