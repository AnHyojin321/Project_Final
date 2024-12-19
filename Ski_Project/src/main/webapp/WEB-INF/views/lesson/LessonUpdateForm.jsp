<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스키 강습 예약 수정</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            line-height: 1.6;
            color: #333;
            background: linear-gradient(135deg, #e6f3ff 0%, #ffffff 100%);
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        h1 {
            text-align: center;
            color: #0056b3;
            font-size: 28px;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #0056b3;
        }
        input[type="text"],
        input[type="tel"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .radio-group {
            display: flex;
            gap: 15px;
        }
        .radio-group label {
            display: flex;
            align-items: center;
            font-weight: normal;
        }
        .radio-group input[type="radio"] {
            margin-right: 5px;
        }
        textarea {
            height: 100px;
        }
        .button-group {
            text-align: center;
            margin-top: 30px;
        }
        .button-group button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .button-group button[type="submit"] {
            background-color: #0056b3;
            color: white;
        }
        .button-group button[type="submit"]:hover {
            background-color: #003d82;
        }
        .button-group button[type="button"] {
            background-color: #f8f9fa;
            color: #333;
            margin-left: 10px;
        }
        .button-group button[type="button"]:hover {
            background-color: #e2e6ea;
        }
        .required::after {
            content: " *";
            color: #dc3545;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="container">
        <h1>🎿 스키 강습 예약 수정</h1>

        <form action="${pageContext.request.contextPath}/lesson/updateLesson" method="post">
            <div class="form-group">
                <label for="resNo">예약 번호</label>
                <input type="text" id="resNo" name="resNo" value="${les.resNo}" readonly>
            </div>
            <input type="hidden" name="memberNo" value="${loginMember.memberNo}">
            
            <div class="form-group">
                <label for="memberName">예약자</label>
                <input type="text" id="memberName" name="memberName" value="${loginMember.memberName}" readonly>
            </div>

            <div class="form-group">
                <label for="lessonPhone" class="required">휴대전화번호</label>
                <input type="tel" id="lessonPhone" name="lessonPhone" value="${les.lessonPhone}" required>
            </div>

            <div class="form-group">
                <label class="required">강습 종류</label>
                <div class="radio-group">
                    <label><input type="radio" name="lessonActivite" value="스키" ${les.lessonActivite == '스키' ? 'checked' : ''}> 스키</label>
                    <label><input type="radio" name="lessonActivite" value="보드" ${les.lessonActivite == '보드' ? 'checked' : ''}> 보드</label>
                </div>
            </div>

            <div class="form-group">
                <label for="lessonDate" class="required">강습 일자</label>
                <input type="date" id="lessonDate" name="lessonDate" value="${les.lessonDate}" required>
            </div>

            <div class="form-group">
                <label for="lessonTime" class="required">강습 시간</label>
                <select id="lessonTime" name="lessonTime" required>
                    <option value="">강습시간을 선택해주세요.</option>                        
                    <option value="2시간 - 1교시(08:30~10:30)" ${les.lessonTime == '2시간 - 1교시(08:30~10:30)' ? 'selected' : ''}>2시간 - 1교시(08:30~10:30)</option>
                    <option value="2시간 - 2교시(10:30~12:30)" ${les.lessonTime == '2시간 - 2교시(10:30~12:30)' ? 'selected' : ''}>2시간 - 2교시(10:30~12:30)</option>
                    <option value="2시간 - 3교시(13:30~15:30)" ${les.lessonTime == '2시간 - 3교시(13:30~15:30)' ? 'selected' : ''}>2시간 - 3교시(13:30~15:30)</option>
                    <option value="2시간 - 4교시(15:30~17:30)" ${les.lessonTime == '2시간 - 4교시(15:30~17:30)' ? 'selected' : ''}>2시간 - 4교시(15:30~17:30)</option>
                    <option value="4시간 - 1교시(08:30~12:30)" ${les.lessonTime == '4시간 - 1교시(08:30~12:30)' ? 'selected' : ''}>4시간 - 1교시(08:30~12:30)</option>
                    <option value="4시간 - 2교시(13:30~17:30)" ${les.lessonTime == '4시간 - 2교시(13:30~17:30)' ? 'selected' : ''}>4시간 - 2교시(13:30~17:30)</option>
                </select>
            </div>

            <div class="form-group">
                <label class="required">강습프로그램</label>
                <div class="radio-group">
                    <label><input type="radio" name="lessonType" value="초급반" ${les.lessonType == '초급반' ? 'checked' : ''}> 초급반</label>
                    <label><input type="radio" name="lessonType" value="중급반" ${les.lessonType == '중급반' ? 'checked' : ''}> 중급반</label>
                    <label><input type="radio" name="lessonType" value="상급반" ${les.lessonType == '상급반' ? 'checked' : ''}> 상급반</label>
                </div>
            </div>

            <div class="form-group">
                <label class="required">예약 인원</label>
                <div class="radio-group">
                    <label><input type="radio" name="lessonResCount" value="1:1 개인강습" ${les.lessonResCount == '1:1 개인강습' ? 'checked' : ''}> 1:1 개인강습</label>
                    <label><input type="radio" name="lessonResCount" value="1:2 소그룹강습" ${les.lessonResCount == '1:2 소그룹강습' ? 'checked' : ''}> 1:2 소그룹강습</label>
                    <label><input type="radio" name="lessonResCount" value="1:3 소그룹강습" ${les.lessonResCount == '1:3 소그룹강습' ? 'checked' : ''}> 1:3 소그룹강습</label>
                </div>
            </div>

            <div class="form-group">
                <label for="lessonResContent">요청 사항</label>
                <textarea id="lessonResContent" name="lessonResContent">${les.lessonResContent}</textarea>
            </div>

            <div class="button-group">
                <button type="submit">수정하기</button>
                <button type="button" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>