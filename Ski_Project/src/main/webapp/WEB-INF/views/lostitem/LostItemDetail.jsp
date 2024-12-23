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
            background-color: #f9f9f9;
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
            font-size: 28px;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .details {
            text-align: center;
            margin-bottom: 30px;
        }

        .details span {
            display: block;
            font-size: 14px;
            color: #7f8c8d;
        }

        .details .date {
            margin-top: 5px;
            font-size: 14px;
            color: #95a5a6;
        }

        .image-container {
            text-align: center;
            margin-bottom: 30px;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .content {
            font-size: 16px;
            line-height: 1.8;
            color: #34495e;
            margin-bottom: 20px;
        }

        .content p {
            margin: 10px 0;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 30px;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: left;
            font-size: 16px;
        }

        .table th {
            background-color: #3498db;
            color: #fff;
            font-weight: bold;
        }

        .table td {
            background-color: #f9f9f9;
            color: #34495e;
        }

        /* 버튼 스타일 */
        .button-container {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 8px;
            background-color: #3498db;
            color: #fff;
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
    </style>
</head>
<body>
  <jsp:include page="../common/header.jsp" />

    <div class="container">
        <!-- 제목 -->
        <h1>${lostItem.lostTitle}</h1>

        <!-- 세부 정보 -->
        <div class="details">
            <span>위치: ${lostItem.lostLocation}</span>
            <span class="date">
                작성일: <fmt:formatDate value="${lostItem.createDate}" pattern="yyyy.MM.dd" />
            </span>
        </div>

        <!-- 내용 -->
        <div class="content">
            <p>${lostItem.lostContent}</p>
        </div>

     
        <!-- 버튼 영역 -->
        <div class="button-container">
            <a href="/ski/lostList" class="btn">목록으로 돌아가기</a>
        </div>
    </div>
      <jsp:include page="../common/footer.jsp" />
    
</body>
</html>
