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

        h1 {
            text-align: center;
            margin-top: 30px;
            font-size: 28px;
            color: #2c3e50;
        }

        .detail-container {
            width: 80%;
            max-width: 900px;
            margin: 30px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .detail-header {
            border-bottom: 1px solid #ddd;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }

        .detail-header h2 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }

        .detail-header p {
            margin: 5px 0;
            color: #777;
            font-size: 14px;
        }

        .detail-content {
            margin-top: 20px;
            font-size: 16px;
            line-height: 1.8;
            color: #333;
        }

        .btn-container {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            display: inline-block;
            width: 120px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            font-size: 16px;
            color: #666;
            text-decoration: none;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            transition: all 0.3s ease;
            margin: 0 10px;
        }

        .btn:hover {
            background-color: #f0f0f0;
            color: #333;
            border-color: #bbb;
        }
        
          .content {
	flex:1;
	width:100%;
    padding: 30px;
    background-color: #f8f9fa;
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


              <div class="admin-container">
        <jsp:include page="../common/sidebar.jsp" />
        <main class="content">
    <h1>공지사항 상세보기</h1>

    <div class="detail-container">
        <div class="detail-header">
            <h2>${notice.noticeTitle}</h2>
            <p>작성일: <fmt:formatDate value="${notice.createDate}" pattern="yyyy.MM.dd" /></p>
        </div>
        <div class="detail-content">
            ${notice.noticeContent}
        </div>

        <!-- 버튼 컨테이너 -->
        <div class="btn-container">
            <a href="/admin/noticeList" class="btn">목록</a>
            <a href="javascript:void(0);" class="btn" onclick="confirmDelete(${notice.noticeNo})">삭제</a>
            <a href="/admin/updateNoticeForm?noticeNo=${notice.noticeNo}" class="btn">수정</a>
        </div>
    </div>
    
       </main>
	</div>
</body>
</html>
