<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 폼</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            line-height: 1.5;
            color: #333;
        }

        .form-container {
            max-width: 1000px;
            margin: 20px auto;
            background: #fff;
        }

        .form-row {
            display: flex;
            border: 1px solid #e0e0e0;
            border-bottom: none;
        }

        .form-row:last-child {
            border-bottom: 1px solid #e0e0e0;
        }

        .form-label {
            width: 200px;
            padding: 15px;
            background: #f9f9f9;
            display: flex;
            align-items: center;
        }

        .form-label.required::before {
            content: "•";
            color: #ff6b01;
            margin-right: 5px;
        }

        .form-input {
            flex: 1;
            padding: 10px;
            background: #fff;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        select,
        textarea {
            width: 100%;
            max-width: 300px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            background: #f9f9f9;
        }

        .phone-group {
            display: flex;
            gap: 5px;
            align-items: center;
        }

        .phone-group select {
            width: 100px;
        }

        .date-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .calendar-icon {
            width: 20px;
            height: 20px;
            background: #f0f0f0;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #ddd;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            padding: 5px 0;
        }

        .radio-group label {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        textarea {
            width: 100%;
            min-height: 150px;
            resize: vertical;
        }

        .note {
            margin-top: 10px;
            color: #666;
            font-size: 0.9em;
        }

        .agreement {
            padding: 10px;
            margin-bottom: 20px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .button-group button {
            padding: 8px 30px;
            border: 1px solid #ddd;
            background: #fff;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="agreement">
            <label>
                <input type="checkbox" name="agreement"> 개인정보수집동의에 동의합니다.
            </label>
        </div>

        <form id="addLessonForm" method="post" action="insert.le">
        <input type="hidden" name="memberNo" value="${loginMember.memberNo}">
        
            <input type="hidden" name="lessonTitle" value="${loginMember.memberName} 예약안내">
			    <div class="form-row">
			        <div class="form-label required">예약자</div>
			        <div class="form-input">
			            <input type="text" value="${loginMember.memberName}" readonly>
			            <input type="hidden" name="memberName" value="${loginMember.memberName}">
			        </div>
			    </div>

            <div class="form-row">
                <div class="form-label">이메일</div>
                <div class="form-input">
                    <input type="email" name="email" value="${ loginMember.email }">
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">휴대전화번호</div>
                <div class="form-input">
                    <div class="phone-group">
                        <input type="text" name="lessonPhone" id="lessonPhone" style="width: 350px">
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">강습성격</div>
                <div class="form-input">
                    <div class="radio-group">
                        <label>
                            <input type="radio" name="lessonActivite" value="ski"> 스키
                        </label>
                        <label>
                            <input type="radio" name="lessonActivite" value="board"> 보드
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">희망일</div>
                <div class="form-input">
                    <div class="date-group">
                        <input type="date" style="width: 120px" id="lessonDate" name="lessonDate">
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">강습프로그램</div>
                <div class="form-input">
                    <div class="radio-group">
                        <label>
                            <input type="radio" id="lessonType" name="lessonType" value="초급반"> 초급반
                        </label>
                        <label>
                            <input type="radio" id="lessonType" name="lessonType" value="중급반"> 중급반
                        </label>
                        <label>
                            <input type="radio" id="lessonType" name="lessonType" value="고급반"> 고급반
                        </label>
                    </div>
                </div>
            </div>

<div class="form-row">
    <div class="form-label required">강습시간</div>
    <div class="form-input">
        <select name="lessonTime" required>
            <option value="">강습시간을 선택해주세요.</option>                        
            <option value="08:30~10:30">2시간 - 1교시(08:30~10:30)</option>
            <option value="10:30~12:30">2시간 - 2교시(10:30~12:30)</option>
            <option value="12:30~14:30">2시간 - 3교시(12:30~14:30)</option>
            <option value="14:30~16:30">2시간 - 4교시(14:30~16:30)</option>
            <option value="08:30~12:30">4시간 - 1교시(08:30~12:30)</option>
            <option value="12:30~16:30">4시간 - 2교시(12:30~16:30)</option>
        </select>
    </div>
</div>


            <div class="form-row">
                <div class="form-label required">예약인원</div>
                <div class="form-input">
                    <div class="radio-group">
                        <label>
                            <input type="radio" id="lessonResCount" name="lessonResCount" value="1-1"> 1:1 개인강습
                        </label>
                        <label>
                            <input type="radio" id="lessonResCount" name="lessonResCount" value="1-2"> 1:2 소그룹강습
                        </label>
                        <label>
                            <input type="radio" id="lessonResCount" name="lessonResCount" value="1-3"> 1:3 소그룹강습
                        </label>
                        <label>
                            <input type="radio" id="lessonResCount" name="lessonResCount" value="group"> 기타(인원초과시 문의)
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">내용</div>
                <div class="form-input">
                    <textarea name="lessonResContent" id="lessonResContent" placeholder="강습시 주의 및 요구사항"></textarea>
                    <div class="note">
                        * 예약하기 완료 후 예약 안내메일이 발송됩니다.<br>
                        * 접수 후 사용안내 문자가 발송 됩니다.<br>
                        * 핸드폰번호는 반드시 등록 해주셔 됩니다.
                    </div>
                </div>
            </div>
            
            <div class="button-group">
            <button type="submit">등록</button>
            <button type="button">취소</button>
        </div>
        </form>


    </div>
</body>
</html>