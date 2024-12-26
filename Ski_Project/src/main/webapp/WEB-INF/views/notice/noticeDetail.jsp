<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세보기</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #eceff1, #ffffff);
            color: #333;
        }

        .container {
            width: 80%;
            max-width: 900px;
            margin: 40px auto;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            animation: fadeIn 0.8s ease;
        }

        .header {
            border-bottom: 2px solid #e0e0e0;
            margin-bottom: 20px;
            padding-bottom: 15px;
        }

        .header .title {
            font-size: 24px;
            font-weight: bold;
            color: #2c3e50;
            margin: 0;
        }

        .header .meta {
            display: flex;
            justify-content: space-between;
            margin-top: 8px;
            font-size: 14px;
            color: #7f8c8d;
        }

        .content {
            font-size: 16px;
            line-height: 1.8;
            color: #444;
            margin-bottom: 30px;
        }

        .nav-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-top: 2px solid #e0e0e0;
        }

        .nav-section .nav-item {
            font-size: 14px;
            color: #7f8c8d;
        }

        .nav-section .nav-item a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
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
    font-size: 16px;
        background: linear-gradient(to right, #4a90e2, #74b9ff);
    color: #fff;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.btn:hover {
    background: linear-gradient(135deg, #2ecc71, #3498db); /* 호버 시 그라데이션 반전 */
    transform: scale(1.05); /* 약간 확대 */
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15); /* 호버 시 그림자 강화 */
}
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
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
                    <a href="/ski/noticeDetail?noticeNo=${prevNotice.noticeNo}">◀ 이전: ${prevNotice.noticeTitle}</a>
                </c:if>
                <c:if test="${prevNotice == null}">
                    이전 글이 없습니다.
                </c:if>
            </div>
            <div class="nav-item">
                <c:if test="${nextNotice != null}">
                    <a href="/ski/noticeDetail?noticeNo=${nextNotice.noticeNo}">다음: ${nextNotice.noticeTitle} ▶</a>
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
