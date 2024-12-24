<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 상세보기</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 30px;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            padding: 15px 20px;
            text-align: left;
            font-size: 16px;
        }

        th {
            background-color: #3498db;
            color: #fff;
            font-weight: bold;
            border-bottom: 2px solid #2980b9;
        }

        td {
            background-color: #f9f9f9;
            color: #34495e;
            border-bottom: 1px solid #ddd;
        }

        td:last-child {
            word-wrap: break-word;
        }

        /* 버튼 스타일 */
        .button-container {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            margin: 0 10px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        .btn-delete {
            background-color: #e74c3c;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }
        
            .content {
	flex:1;
	width:100%;
    padding: 30px;
    background-color: #f8f9fa;
}
    </style>
    <script>
        function confirmDelete(lostNo) {
            if (confirm("정말로 이 게시물을 삭제하시겠습니까?")) {
                location.href = "/admin/deleteLostItem?lostNo=" + lostNo;
            }
        }
    </script>
</head>
<body>

              <div class="admin-container">
        <jsp:include page="../common/sidebar.jsp" />
        <main class="content">
    <div class="container">
        <h1>게시글 상세보기</h1>
        <table>
            <tr>
                <th>번호</th>
                <td>${lostItem.lostNo}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>${lostItem.lostTitle}</td>
            </tr>
            <tr>
                <th>위치</th>
                <td>${lostItem.lostLocation}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>${lostItem.lostContent}</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>
                    <fmt:formatDate value="${lostItem.createDate}" pattern="yyyy.MM.dd" />
                </td>
            </tr>
            <tr>
                <th>조회수</th>
                <td>${lostItem.count}</td>
            </tr>
        </table>

        <!-- 버튼 영역 -->
        <div class="button-container">
            <a href="/admin/lostList" class="btn">목록으로 돌아가기</a>
            <a href="javascript:void(0);" class="btn btn-delete" onclick="confirmDelete(${lostItem.lostNo})">삭제하기</a>
        </div>
    </div>
    </main>
	</div>
</body>
</html>
