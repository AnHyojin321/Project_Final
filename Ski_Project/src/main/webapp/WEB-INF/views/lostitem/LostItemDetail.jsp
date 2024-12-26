<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 상세보기</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            color: #2c3e50;
        }

        .container {
            width: 90%;
            max-width: 900px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h1 {
            font-size: 32px;
            font-weight: bold;
            color: #2d3436;
            text-align: center;
            margin-bottom: 20px;
        }

        .details {
            text-align: center;
            margin-bottom: 20px;
        }

        .details span {
            font-size: 16px;
            color: #636e72;
        }

        .details .date {
            display: block;
            margin-top: 5px;
            font-size: 14px;
            color: #b2bec3;
        }

        .content {
            margin: 30px 0;
            font-size: 18px;
            line-height: 1.8;
            color: #2d3436;
            text-align: justify;
        }

        .content p {
            margin-bottom: 10px;
        }

        .image-container {
            text-align: center;
            margin-bottom: 30px;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .image-container img:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
        }

        .button-container {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            display: inline-block;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
        background: linear-gradient(to right, #4a90e2, #74b9ff);
            border: none;
            border-radius: 25px;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
            cursor: pointer;
        }

        .btn:hover {
            background: linear-gradient(to right, #81ecec, #74b9ff);
            transform: translateY(-3px);
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
