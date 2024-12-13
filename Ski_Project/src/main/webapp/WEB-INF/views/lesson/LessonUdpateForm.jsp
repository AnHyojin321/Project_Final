<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강습 예약 수정</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }

        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 30px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #1e3c72;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            color: #1e3c72;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        textarea {
            resize: none;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .save-btn {
            background-color: #1e3c72;
            color: white;
        }

        .save-btn:hover {
            background-color: #2a5298;
            box-shadow: 0 5px 15px rgba(30, 60, 114, 0.3);
        }

        .cancel-btn {
            background-color: #fff;
            color: #1e3c72;
            border: 2px solid #1e3c72;
        }

        .cancel-btn:hover {
            background-color: #1e3c72;
            color: white;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>강습 예약 수정</h1>
        <form action="updateLesson.le" method="post">
            <!-- 예약 번호 (수정 불가) -->
            <div class="form-group">
                <label for="resNo">예약 번호</label>
                <input type="text" id="resNo" name="resNo" value="${requestScope.les.resNo}" readonly>
            </div>

            <!-- 예약자 -->
            <div class="form-group">
                <label for="memberName">예약자</label>
                <input type="text" id="memberName" name="memberName" value="${loginMember.memberName}" readonly>
            </div>

            <!-- 휴대전화번호 -->
            <div class="form-group">
                <label for="lessonPhone">휴대전화번호</label>
                <input type="text" id="lessonPhone" name="lessonPhone" value="${requestScope.les.lessonPhone}" required>
            </div>

            <!-- 강습 종류 -->
            <div class="form-group">
                <label for="lessonActivite">강습 종류</label>
                <input type="text" id="lessonActivite" name="lessonActivite" value="${requestScope.les.lessonActivite}" required>
            </div>

            <!-- 강습 일자 -->
            <div class="form-group">
                <label for="lessonDate">강습 일자</label>
                <input type="date" id="lessonDate" name="lessonDate" value="${requestScope.les.lessonDate}" required>
            </div>

            <!-- 강습 시간 -->
            <div class="form-group">
                <label for="lessonTime">강습 시간</label>
                <input type="text" id="lessonTime" name="lessonTime" value="${requestScope.les.lessonTime}" required>
            </div>

            <!-- 예약 인원 -->
            <div class="form-group">
                <label for="lessonResCount">예약 인원</label>
                <input type="number" id="lessonResCount" name="lessonResCount" value="${requestScope.les.lessonResCount}" min="1" required>
            </div>

            <!-- 요청 사항 -->
            <div class="form-group">
                <label for="lessonResContent">요청 사항</label>
                <textarea id="lessonResContent" name="lessonResContent" rows="4">${requestScope.les.lessonResContent}</textarea>
            </div>

            <!-- 버튼 그룹 -->
            <div class="btn-group">
                <button type="submit" class="btn save-btn">저장</button>
                <button type="button" class="btn cancel-btn" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>
</body>
</html>
