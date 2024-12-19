    <%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>스키 강습 예약</title>
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
            .notification-banner {
                background: #e1f5fe;
                border-left: 5px solid #03a9f4;
                padding: 15px;
                margin-bottom: 30px;
                border-radius: 5px;
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
            input[type="email"],
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
            .privacy-policy {
            background: #ecf0f1;
            border: 1px solid #bdc3c7;
                border-radius: 5px;
                padding: 15px;
                margin-bottom: 20px;
                max-height: 150px;
                overflow-y: auto;
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
            <h1>🎿 스키 강습 예약</h1>

            <div class="notification-banner">
                <p>• 온라인 예약시 전액입금을 원칙으로 합니다.</p>
                <p>• 온라인 예약후 12시간동안 입금확인이 되지 않은 경우 자동 취소 됩니다.</p>
                <p>• 의류, 고글, 장갑등 개인 장비이므로 지정판매샵에서 현장 및 구매하시면 됩니다.</p>
                <p style="color: #dc3545; font-weight: bold;">※ 예약변경은 최소3일전 가능하며 온라인 예약상금 중복은 불가능합니다.</p>
            </div>

            <form id="lessonReservationForm" method="post" action="insert.le">
                <input type="hidden" name="memberNo" value="${loginMember.memberNo}">
                <input type="hidden" name="lessonTitle" value="${loginMember.memberName} 예약안내">
                
                <div class="form-group">
                    <label for="memberName" class="required">예약자</label>
                    <input type="text" id="memberName" name="memberName" value="${loginMember.memberName}" readonly>
                </div>

                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" value="${loginMember.email}">
                </div>

                <div class="form-group">
                    <label for="lessonPhone" class="required">휴대전화번호</label>
                    <input type="tel" id="lessonPhone" name="lessonPhone" placeholder="010-1234-5678" required>
                </div>

                <div class="form-group">
                    <label class="required">강습성격</label>
                    <div class="radio-group">
                        <label><input type="radio" name="lessonActivite" value="스키" required> 스키</label>
                        <label><input type="radio" name="lessonActivite" value="보드" required> 보드</label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="lessonDate" class="required">희망일</label>
                    <input type="date" id="lessonDate" name="lessonDate" required>
                </div>

                <div class="form-group">
                    <label class="required">강습프로그램</label>
                    <div class="radio-group">
                        <label><input type="radio" name="lessonType" value="초급반" required> 초급반</label>
                        <label><input type="radio" name="lessonType" value="중급반" required> 중급반</label>
                        <label><input type="radio" name="lessonType" value="상급반" required> 상급반</label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="lessonTime" class="required">강습시간</label>
                    <select id="lessonTime" name="lessonTime" required>
                        <option value="">강습시간을 선택해주세요.</option>
                        <option value="2시간 - 1교시(08:30~10:30)">2시간 - 1교시(08:30~10:30)</option>
                        <option value="2시간 - 2교시(10:30~12:30)">2시간 - 2교시(10:30~12:30)</option>
                        <option value="2시간 - 3교시(13:30~15:30)">2시간 - 3교시(13:30~15:30)</option>
                        <option value="2시간 - 4교시(15:30~17:30)">2시간 - 4교시(15:30~17:30)</option>
                        <option value="4시간 - 1교시(08:30~12:30)">4시간 - 1교시(08:30~12:30)</option>
                        <option value="4시간 - 2교시(13:30~17:30)">4시간 - 2교시(13:30~17:30)</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="required">예약인원</label>
                    <div class="radio-group">
                        <label><input type="radio" name="lessonResCount" value="1:1 개인강습" required> 1:1 개인강습</label>
                        <label><input type="radio" name="lessonResCount" value="1:2 소그룹강습" required> 1:2 소그룹강습</label>
                        <label><input type="radio" name="lessonResCount" value="1:3 소그룹강습" required> 1:3 소그룹강습</label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="lessonResContent" class="required">내용</label>
                    <textarea id="lessonResContent" name="lessonResContent" placeholder="강습시 주의 및 요구사항" required></textarea>
                    <p style="font-size: 0.9em; color: #6c757d; margin-top: 5px;">
                        * 예약하기 완료 후 예약 안내메일이 발송됩니다.<br>
                        * 접수 후 사용안내 이메일이 발송 됩니다.<br>
                        * 핸드폰번호는 반드시 등록 해주셔야 됩니다.
                    </p>
                </div>

                <div class="privacy-policy">
                    <h3>개인정보처리방침</h3>
                    <p>설레눈 리조트(이하 '회사')는 원활한 강습예약을 위하여 아래와 같은 개인정보를 수집하고 있습니다.</p>
                    <p><strong>수집하는 개인정보 항목:</strong> 이름, 이메일, 휴대전화, 접속 IP</p>
                    <p><strong>개인정보의 수집 및 이용목적:</strong> 개인 식별 및 신청 서비스 제공</p>
                    <p><strong>개인정보의 보유 및 이용기간:</strong> 서비스 완료 후 3개월</p>
                    <p>※ 개인정보 수집 동의를 거부할 수 있으나, 이 경우 강습예약 신청이 불가능합니다.</p>
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" name="privacy-agreement" required>
                        개인정보처리방침에 동의합니다.
                    </label>
                </div>

                <div class="button-group">
                    <button type="submit">예약하기</button>
                    <button type="button" onclick="history.back()">취소</button>
                </div>
            </form>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
    </html>