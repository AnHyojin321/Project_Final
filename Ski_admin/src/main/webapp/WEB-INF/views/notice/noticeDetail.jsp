<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 상세보기</title>
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

        .detail-container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .detail-header {
            margin-bottom: 20px;
        }

        .detail-header h2 {
            margin: 0;
            font-size: 24px;
        }

        .detail-header p {
            margin: 5px 0;
            color: #777;
        }

        .detail-content {
            margin-top: 20px;
            font-size: 16px;
            line-height: 1.6;
        }

        .btn-container {
            text-align: right;
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            background-color: #8c7ae6;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
            text-align: center;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #6c5ce7;
        }
    </style>
    
        <script>
        
        function confirmDelete(noticeNo) {
            if (confirm("정말로 이 게시물을 삭제하시겠습니까?")) {
                location.href = "/admin/deleteNotice?noticeNo=" + noticeNo;
            }
        }
        
        
    </script>
</head>
<body>
    <h1>공지사항 상세보기</h1>

    <div class="detail-container">
        <div class="detail-header">
            <h2>${notice.noticeTitle}</h2>
            <p>작성일: <fmt:formatDate value="${notice.createDate}" pattern="yyyy.MM.dd" /></p>
        </div>
        <div class="detail-content">
            ${notice.noticeContent}
        </div>
        <div class="btn-container">
            <a href="/admin/noticeList" class="btn">목록으로</a>
<a href="javascript:void(0);" class="btn btn-delete" onclick="confirmDelete(${notice.noticeNo})">삭제하기</a>
<a href="/admin/updateNoticeForm?noticeNo=${notice.noticeNo}" class="btn">수정</a>
            
        </div>
    </div>
</body>
</html>
