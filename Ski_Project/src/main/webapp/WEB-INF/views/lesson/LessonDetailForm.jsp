<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설레눈 강습 예약 확인서</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .confirmation-container {
            max-width: 800px;
            margin: 40px auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 0 0 1px rgba(63, 153, 225, 0.15),
                       0 2px 8px rgba(63, 153, 225, 0.15);
            overflow: hidden;
        }

        .confirmation-header {
            background-color: #f8fbff;
            padding: 30px;
            border-bottom: 1px solid #e1e9f2;
            position: relative;
        }

        .confirmation-title {
            font-size: 24px;
            font-weight: 700;
            color: #2c5282;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .confirmation-icon {
            width: 32px;
            height: 32px;
            background-color: #3182ce;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
        }

        .confirmation-content {
            padding: 30px;
        }

        .section {
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 16px;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 15px;
            padding-bottom: 8px;
            border-bottom: 1px solid #e2e8f0;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 120px 1fr;
            gap: 12px;
            align-items: center;
        }

        .label {
            color: #718096;
            font-size: 14px;
        }

        .value {
            color: #2d3748;
            font-weight: 500;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 12px;
            background-color: #ebf8ff;
            color: #2b6cb0;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 500;
        }

        .footer {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #e2e8f0;
            text-align: center;
            color: #718096;
            font-size: 14px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-top: 30px;
        }

        .button {
            padding: 8px 16px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
        }

        .primary-button {
            background-color: #3182ce;
            color: white;
            border: none;
        }

        .secondary-button {
            background-color: white;
            color: #3182ce;
            border: 1px solid #3182ce;
        }

        .danger-button {
            background-color: white;
            color: #e53e3e;
            border: 1px solid #e53e3e;
        }

        @media (max-width: 640px) {
            .confirmation-container {
                margin: 20px auto;
            }

            .info-grid {
                grid-template-columns: 1fr;
                gap: 8px;
            }

            .label {
                color: #4a5568;
                font-weight: 500;
            }

            .button-group {
                flex-direction: column;
            }

            .button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header2.jsp"/>
    
    <div class="confirmation-container">
        <div class="confirmation-header">
            <h1 class="confirmation-title">
                <span class="confirmation-icon">🎿</span>
                강습 예약 확인서
            </h1>
        </div>

        <div class="confirmation-content">
            <div class="section">
                <h2 class="section-title">예약 정보</h2>
                <div class="info-grid">
                    <div class="label">예약 번호</div>
                    <div class="value">${les.resNo}</div>
					<div class="label">예약 상태</div>
					<div class="value">
	                <c:choose>
	                    <c:when test="${les.resStatus == 'Y'}">
	                        <span class="status-badge success">예약 성공</span>
	                    </c:when>
	                    <c:otherwise>
	                        <span class="status-badge pending">예약 대기중</span>
	                    </c:otherwise>
	                </c:choose>
					</div>
                    <div class="label">예약자</div>
                    <div class="value">${loginMember.memberName}</div>

                    <div class="label">이메일</div>
                    <div class="value">${loginMember.email}</div>

                    <div class="label">휴대전화</div>
                    <div class="value">${requestScope.les.lessonPhone}</div>
                </div>
            </div>

            <div class="section">
                <h2 class="section-title">강습 정보</h2>
                <div class="info-grid">
                    <div class="label">강습 종류</div>
                    <div class="value">${requestScope.les.lessonActivite}</div>

                    <div class="label">강습 일자</div>
                    <div class="value">${requestScope.les.lessonDate}</div>

                    <div class="label">강습 프로그램</div>
                    <div class="value">${requestScope.les.lessonType}</div>

                    <div class="label">강습 시간</div>
                    <div class="value">${requestScope.les.lessonTime}</div>

                    <div class="label">예약 인원</div>
                    <div class="value">${requestScope.les.lessonResCount}명</div>

                    <div class="label">요청 사항</div>
                    <div class="value">${requestScope.les.lessonResContent}</div>
                </div>
            </div>

            <div class="button-group">
                <form action="${pageContext.request.contextPath}/lesson/updateForm" method="get" style="display: inline;">
                    <input type="hidden" name="resNo" value="${requestScope.les.resNo}">
                    <button type="submit" class="button primary-button">예약 수정</button>
                </form>
                
                <form action="${pageContext.request.contextPath}/delete.le" method="post" 
                      onsubmit="return confirm('정말로 삭제하시겠습니까?')" style="display: inline;">
                    <input type="hidden" name="resNo" value="${requestScope.les.resNo}">
                    <button type="submit" class="button danger-button">예약 삭제</button>
                </form>

                <button onclick="history.back()" class="button secondary-button">뒤로</button>
            </div>

            <div class="footer">
                본 예약 확인서는 설레눈 리조트 강습 예약 확인을 위한 문서입니다.<br>
                문의사항은 고객센터로 연락 부탁드립니다.
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>