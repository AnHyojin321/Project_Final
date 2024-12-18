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
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            color: #555;
            font-weight: bold;
        }

        td {
            color: #333;
        }

        /* 버튼 스타일 */
        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
            margin: 0 10px;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .btn-delete {
            background-color: #FF5733;
        }

        .btn-delete:hover {
            background-color: #E64C2E;
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
</body>
</html>
