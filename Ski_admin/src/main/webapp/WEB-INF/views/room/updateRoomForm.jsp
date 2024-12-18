<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            width: 70%;
            margin: 50px auto;
            background: #ffffff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .info-item {
            display: flex;
            justify-content: space-between;
            padding: 15px 0;
            border-bottom: 1px dashed #ccc;
        }
        .info-item:last-child {
            border-bottom: none;
        }
        .info-title {
            font-weight: bold;
            color: #333;
        }
        .info-value {
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>객실 상세 정보</h1>
        <div class="info-item">
            <span class="info-title">가격</span>
            <span class="info-value">290,000원</span>
        </div>
        <div class="info-item">
            <span class="info-title">판매 기간</span>
            <span class="info-value">2025-01-01 ~ 2024-12-31</span>
        </div>
        <div class="info-item">
            <span class="info-title">상품 구성</span>
            <span class="info-value">스탠다드 2인 객실 + 성인 리프트 종일권 2인 + 락커 1인</span>
        </div>
        <div class="info-item">
            <span class="info-title">패키지 세트</span>
            <span class="info-value">객실 + 리프트 + 락커</span>
        </div>
        <div class="info-item">
            <span class="info-title">상태</span>
            <span class="info-value">판매중</span>
        </div>
    </div>
</body>
</html>