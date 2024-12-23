<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 상세보기</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .container {
            width: 80%;
            max-width: 900px;
            margin: 20px auto;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .header {
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
            padding-bottom: 10px;
        }

        .header .title {
            font-size: 20px;
            font-weight: bold;
            color: #2c3e50;
            margin: 0;
        }

        .header .meta {
            display: flex;
            justify-content: space-between;
            margin-top: 5px;
            font-size: 14px;
            color: #7f8c8d;
        }

        .content {
            margin-bottom: 20px;
            font-size: 16px;
            line-height: 1.6;
            color: #2c3e50;
        }

        .nav-section {
            border-top: 1px solid #ddd;
            padding: 15px 0;
            display: flex;
            justify-content: space-between;
        }

        .nav-section .nav-item {
            font-size: 14px;
            color: #7f8c8d;
        }

        .nav-section .nav-item a {
            text-decoration: none;
            color: #3498db;
        }

        .nav-section .nav-item a:hover {
            text-decoration: underline;
        }

        .btn-container {
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            font-size: 14px;
            background-color: #f0f0f0;
            color: #7f8c8d;
            text-decoration: none;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <div class="title">${notice.noticeTitle}</div>
            <div class="meta">
                <span>작성일: <fmt:formatDate value="${notice.createDate}" pattern="yyyy-MM-dd" /></span>
            </div>
        </div>

        <!-- Content Section -->
        <div class="content">
            ${notice.noticeContent}
        </div>

        <!-- Navigation Section -->
        <div class="nav-section">
            <div class="nav-item">
                <c:if test="${prevNotice != null}">
                    <a href="/ski/noticeDetail?noticeNo=${prevNotice.noticeNo}">◀ [공지]: ${prevNotice.noticeTitle}</a>
                </c:if>
                <c:if test="${prevNotice == null}">
                    이전 글이 없습니다.
                </c:if>
            </div>
            <div class="nav-item">
                <c:if test="${nextNotice != null}">
                    <a href="/ski/noticeDetail?noticeNo=${nextNotice.noticeNo}"> [공지]: ${nextNotice.noticeTitle}▶</a>
                </c:if>
                <c:if test="${nextNotice == null}">
                    다음 글이 없습니다.
                </c:if>
            </div>
        </div>

        <!-- Button Section -->
        <div class="btn-container">
            <a href="/ski/noticeList" class="btn">목록</a>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>
