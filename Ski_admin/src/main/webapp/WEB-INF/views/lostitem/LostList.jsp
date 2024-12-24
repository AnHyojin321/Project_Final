<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>분실물 목록 - 관리자</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        h1 {
            text-align: center;
            margin: 30px 0;
            font-size: 32px;
            color: #2c3e50;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .info-box {
            background-color: #e9f7fd;
            padding: 15px 20px;
            margin-bottom: 20px;
            border-left: 5px solid #3498db;
            border-radius: 5px;
        }

        .info-box p {
            margin: 5px 0;
            font-size: 14px;
            color: #2c3e50;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 20px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        th {
            background-color: #3498db;
            color: #fff;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f7fd;
            cursor: pointer;
        }

        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination a, .pagination b {
            text-decoration: none;
            padding: 8px 15px;
            margin: 0 5px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .pagination a {
            background-color: #ddd;
            color: #333;
        }

        .pagination a:hover {
            background-color: #3498db;
            color: #fff;
        }

        .pagination b {
            background-color: #3498db;
            color: #fff;
        }
        
        	        /* 메인 콘텐츠 */
.content {
	flex:1;
	width:100%;
    padding: 30px;
    background-color: #f8f9fa;
}
    </style>
</head>
<body>
	<div class="admin-container">
        <jsp:include page="../common/sidebar.jsp" />
        <main class="content">

    <div class="container">
        <h1>분실물 센터</h1>

        <a href="/admin/lostItemForm" class="btn">+ 분실물 등록</a>

        <div class="info-box">
            <p>✔ 분실물 보관 기간은 1개월입니다.</p>
            <p>✔ 보관 기간 이후, 기부를 통해 필요한 곳에 전달됩니다.</p>
        </div>

        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>위치</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            <c:forEach var="item" items="${list}">
                <tr onclick="location.href='/admin/lostItemDetail?lostNo=${item.lostNo}'">
                    <td>${item.lostNo}</td>
                    <td>${item.lostTitle}</td>
                    <td>${item.lostLocation}</td>
                    <td>
                        <fmt:formatDate value="${item.createDate}" pattern="yyyy.MM.dd" />
                    </td>
                    <td>${item.count}</td>
                </tr>
            </c:forEach>
        </table>

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
