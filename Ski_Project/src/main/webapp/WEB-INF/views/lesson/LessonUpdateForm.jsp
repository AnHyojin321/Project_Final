<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스키 강습 예약 수정</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f5f5f5;
        }

        .page-title {
            text-align: center;
            font-size: 32px;
            font-weight: 700;
            color: #333;
            margin: 40px 0;
        }

        .booking-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: grid;
            grid-template-columns: 300px 1fr 300px;
            gap: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* Left Panel */
        .lesson-types {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
        }

        .lesson-types h3 {
            font-size: 18px;
            margin-bottom: 20px;
            color: #e74c3c;
            position: relative;
            padding-left: 10px;
        }

        .lesson-types h3::before {
            content: "•";
            position: absolute;
            left: 0;
            color: #e74c3c;
        }

        .type-option {
            margin-bottom: 15px;
        }

        .type-option label {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .type-option input[type="radio"] {
            margin-right: 10px;
        }

        /* Middle Panel */
        .booking-details {
            padding: 20px;
            border-left: 1px solid #eee;
            border-right: 1px solid #eee;
        }

        .date-picker {
            margin-bottom: 30px;
        }

        .date-picker h3 {
            font-size: 18px;
            margin-bottom: 15px;
            color: #e74c3c;
            position: relative;
            padding-left: 10px;
        }

        .date-picker h3::before {
            content: "•";
            position: absolute;
            left: 0;
            color: #e74c3c;
        }

        .date-picker input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        /* Right Panel */
        .customer-info {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
        }

        .customer-info h3 {
            font-size: 18px;
            margin-bottom: 20px;
            color: #e74c3c;
            position: relative;
            padding-left: 10px;
        }

        .customer-info h3::before {
            content: "•";
            position: absolute;
            left: 0;
            color: #e74c3c;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #666;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-group textarea {
            height: 100px;
            resize: vertical;
        }

        /* Button Group */
        .button-group {
            grid-column: 1 / -1;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .submit-button,
        .cancel-button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-button {
            background: #2c3e50;
            color: white;
        }

        .submit-button:hover {
            background: #34495e;
        }

        .cancel-button {
            background: #95a5a6;
            color: white;
        }

        .cancel-button:hover {
            background: #7f8c8d;
        }

        /* Required Field Indicator */
        .required::after {
            content: " *";
            color: #e74c3c;
        }

        /* Notification Banner */
        .notification-banner {
            grid-column: 1 / -1;
            background: #e1f5fe;
            border: 1px solid #e1f5fe;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        .notification-banner p {
            margin-bottom: 8px;
            color: #856404;
        }

        .notification-banner p:last-child {
            margin-bottom: 0;
            color: #dc3545;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header2.jsp" />
    
    <h1 class="page-title">🎿 스키 강습 예약 수정</h1>

    <form action="${pageContext.request.contextPath}/lesson/updateLesson" method="post">
        <div class="booking-container">
            <input type="hidden" name="memberNo" value="${loginMember.memberNo}">

            <!-- Notification Banner -->
            <div class="notification-banner">
                <p>• 온라인 예약시 전액입금을 원칙으로 합니다.</p>
                <p>• 온라인 예약후 12시간동안 입금확인이 되지 않은 경우 자동 취소 됩니다.</p>
                <p>• 의류, 고글, 장갑등 개인 장비이므로 지정판매샵에서 현장 및 구매하시면 됩니다.</p>
                <p>※ 예약변경은 최소3일전 가능하며 온라인 예약상금 중복은 불가능합니다.</p>
            </div>

            <!-- Left Panel -->
            <div class="lesson-types">
                <h3>강습 유형</h3>
                <div class="type-option">
                    <label>
                        <input type="radio" name="lessonActivite" value="스키" ${les.lessonActivite == '스키' ? 'checked' : ''} required>
                        스키
                    </label>
                </div>
                <div class="type-option">
                    <label>
                        <input type="radio" name="lessonActivite" value="보드" ${les.lessonActivite == '보드' ? 'checked' : ''} required>
                        보드
                    </label>
                </div>
                <h3>강습 수준</h3>
                <div class="type-option">
                    <label>
                        <input type="radio" name="lessonType" value="초급반" ${les.lessonType == '초급반' ? 'checked' : ''} required>
                        초급반
                    </label>
                </div>
                <div class="type-option">
                    <label>
                        <input type="radio" name="lessonType" value="중급반" ${les.lessonType == '중급반' ? 'checked' : ''} required>
                        중급반
                    </label>
                </div>
                <div class="type-option">
                    <label>
                        <input type="radio" name="lessonType" value="상급반" ${les.lessonType == '상급반' ? 'checked' : ''} required>
                        상급반
                    </label>
                </div>
                <h3>예약인원</h3>
                <div class="type-option">
                    <label>
                        <input type="radio" name="lessonResCount" value="1:1 개인강습" ${les.lessonResCount == '1:1 개인강습' ? 'checked' : ''} required>
                        1:1 개인강습
                    </label>
                </div>
                <div class="type-option">
                    <label>
                        <input type="radio" name="lessonResCount" value="1:2 소그룹강습" ${les.lessonResCount == '1:2 소그룹강습' ? 'checked' : ''} required>
                        1:2 소그룹강습
                    </label>
                </div>
                <div class="type-option">
                    <label>
                        <input type="radio" name="lessonResCount" value="1:3 소그룹강습" ${les.lessonResCount == '1:3 소그룹강습' ? 'checked' : ''} required>
                        1:3 소그룹강습
                    </label>
                </div>
            </div>

            <!-- Middle Panel -->
            <div class="booking-details">
                <div class="date-picker">
                    <h3>예약 일시</h3>
                    <input type="date" id="lessonDate" name="lessonDate" value="${les.lessonDate}" required onclick="this.showPicker()">
                </div>
                <div class="form-group">
                    <label for="lessonTime" class="required">강습시간</label>
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
            </div>

            <!-- Right Panel -->
            <div class="customer-info">
                <h3>예약자 정보</h3>
                <div class="form-group">
                    <label for="resNo">예약 번호</label>
                    <input type="text" id="resNo" name="resNo" value="${les.resNo}" readonly>
                </div>
                <div class="form-group">
                    <label for="memberName" class="required">예약자</label>
                    <input type="text" id="memberName" name="memberName" value="${loginMember.memberName}" readonly>
                </div>
                <div class="form-group">
                    <label for="lessonPhone" class="required">휴대전화번호</label>
                    <input type="tel" id="lessonPhone" name="lessonPhone" value="${les.lessonPhone}" required>
                </div>
                <div class="form-group">
                    <label for="lessonResContent">요청사항</label>
                    <textarea id="lessonResContent" name="lessonResContent">${les.lessonResContent}</textarea>
                    <p style="font-size: 0.9em; color: #6c757d; margin-top: 5px;">
                        * 예약 수정 완료 후 수정된 예약 안내메일이 발송됩니다.<br>
                        * 핸드폰번호는 반드시 등록 해주셔야 됩니다.
                    </p>
                </div>
            </div>

            <!-- Button Group -->
            <div class="button-group">
                <button type="submit" class="submit-button">수정하기</button>
                <button type="button" class="cancel-button" onclick="history.back()">취소</button>
            </div>
        </div>
    </form>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>