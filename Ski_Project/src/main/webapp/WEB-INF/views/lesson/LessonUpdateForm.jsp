<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강습 예약 수정 | SnowPeak Resort</title>

    <style>
        :root {
            --primary-color: #1e3c72;
            --secondary-color: #2a5298;
            --accent-color: #ff6b6b;
            --background-color: #f8f9fa;
            --text-color: #333;
            --border-color: #e0e0e0;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: var(--background-color);
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .form-container {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 40px;
            transition: all 0.3s ease;
        }

        .form-container:hover {
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--primary-color);
            font-size: 2.5em;
            font-weight: 700;
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
            color: var(--primary-color);
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 2px rgba(42, 82, 152, 0.2);
        }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='%231e3c72' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        .radio-group {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .radio-group label {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .radio-group input[type="radio"] {
            width: auto;
            margin-right: 8px;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            font-size: 16px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .save-btn {
            background-color: var(--primary-color);
            color: white;
        }

        .save-btn:hover {
            background-color: var(--secondary-color);
            box-shadow: 0 5px 15px rgba(30, 60, 114, 0.3);
        }

        .cancel-btn {
            background-color: #fff;
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
        }

        .cancel-btn:hover {
            background-color: var(--primary-color);
            color: white;
        }

        @media (max-width: 600px) {
            .form-container {
                padding: 20px;
            }

            .btn-group {
                flex-direction: column;
                gap: 15px;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="form-container">
            <h1>강습 예약 수정</h1>
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
                    <label for="lessonPhone">휴대전화번호</label>
                    <input type="tel" id="lessonPhone" name="lessonPhone" value="${les.lessonPhone}" required>
                </div>

                <div class="form-group">
                    <label for="lessonActivite">강습 종류</label>
                    <select id="lessonActivite" name="lessonActivite" required>
                        <option value="ski" ${les.lessonActivite == '스키' ? 'selected' : ''}>스키</option>
                        <option value="snowboard" ${les.lessonActivite == '보드' ? 'selected' : ''}>보드</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="lessonDate">강습 일자</label>
                    <input type="date" id="lessonDate" name="lessonDate" value="${les.lessonDate}" required>
                </div>

                <div class="form-group">
                    <label for="lessonTime">강습 시간</label>
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
                    <label>강습프로그램</label>
				<div class="radio-group">
				    <label>
				        <input type="radio" id="lessonType" name="lessonType" value="초급반" ${les.lessonType == '초급반' ? 'checked' : ''}> 초급반
				    </label>
				    <label>
				        <input type="radio" id="lessonType" name="lessonType" value="중급반" ${les.lessonType == '중급반' ? 'checked' : ''}> 중급반
				    </label>
				    <label>
				        <input type="radio" id="lessonType" name="lessonType" value="상급반" ${les.lessonType == '상급반' ? 'checked' : ''}> 상급반
				    </label>
				</div>
                </div>

                <div class="form-group">
                    <label>예약 인원</label>
                    <div class="radio-group">
                        <label>
                            <input type="radio" name="lessonResCount" value="1-1" 
                                ${les.lessonResCount == '1-1' ? 'checked' : ''}> 1:1 개인강습
                        </label>
                        <label>
                            <input type="radio" name="lessonResCount" value="1-2" 
                                ${les.lessonResCount == '1-2' ? 'checked' : ''}> 1:2 소그룹강습
                        </label>
                        <label>
                            <input type="radio" name="lessonResCount" value="1-3" 
                                ${les.lessonResCount == '1-3' ? 'checked' : ''}> 1:3 소그룹강습
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="lessonResContent">요청 사항</label>
                    <textarea id="lessonResContent" name="lessonResContent" rows="4">${les.lessonResContent}</textarea>
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn save-btn">저장</button>
                    <button type="button" class="btn cancel-btn" onclick="history.back()">취소</button>
                </div>
            </form>
        </div>
    
    </div>
    

</body>
</html>