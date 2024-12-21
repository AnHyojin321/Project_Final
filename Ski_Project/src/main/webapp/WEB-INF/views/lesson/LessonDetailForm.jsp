<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설레눈 강습 예약 상세보기</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        .details-container {
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        /* header1에서 변경된 클래스명 */
        .details-header { 
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .details-header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        .reservation-number {
            font-size: 1.2em;
            opacity: 0.8;
        }

        .content {
            padding: 40px;
        }

        .detail-row {
            display: flex;
            border-bottom: 1px solid #e0e0e0;
            padding: 20px 0;
            transition: background-color 0.3s ease;
        }

        .detail-row:hover {
            background-color: #f8f9fa;
        }

        .detail-label {
            width: 200px;
            font-weight: bold;
            color: #1e3c72;
        }

        .detail-value {
            flex: 1;
        }

        .status {
            display: inline-block;
            padding: 8px 15px;
            border-radius: 25px;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 0.9em;
            letter-spacing: 1px;
        }

        .status-confirmed {
            background-color: #e7f5e7;
            color: #2e7d32;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 40px;
        }

        .button-group button {
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .edit-btn {
            background-color: #1e3c72;
            color: white;
        }

        .edit-btn:hover {
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

        @media (max-width: 768px) {
            .details-container {
                margin: 20px;
            }

            .content {
                padding: 20px;
            }

            .detail-row {
                flex-direction: column;
            }

            .detail-label {
                margin-bottom: 5px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <div class="details-container">
        <div class="details-header"> 
            <h1>🎿 설레눈 강습 예약</h1>
            <div class="reservation-number">예약 번호: ${ les.resNo }</div>
        </div>
        <div class="content">
            <div class="detail-row">
                <div class="detail-label">예약 상태</div>
                <div class="detail-value">
                    <span class="status status-confirmed">확정</span>
                </div>
            </div>

            <div class="detail-row">
                <div class="detail-label">예약자</div>
                <div class="detail-value">${ loginMember.memberName }</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">이메일</div>
                <div class="detail-value">${ loginMember.email }</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">휴대전화번호</div>
                <div class="detail-value">${ requestScope.les.lessonPhone }</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">강습 종류</div>
                <div class="detail-value">${ requestScope.les.lessonActivite }</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">강습 일자</div>
                <div class="detail-value">${ requestScope.les.lessonDate }</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">강습 프로그램</div>
                <div class="detail-value">${ requestScope.les.lessonType }</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">강습 시간</div>
                <div class="detail-value">${ requestScope.les.lessonTime }</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">예약 인원</div>
                <div class="detail-value">${ requestScope.les.lessonResCount }</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">요청 사항</div>
                <div class="detail-value">${ requestScope.les.lessonResContent }</div>
            </div>
		
			<div class="button-group">
			    <form action="${pageContext.request.contextPath}/lesson/updateForm" method="get">
			        <input type="hidden" name="resNo" value="${requestScope.les.resNo}">
			        <button class="edit-btn" type="submit">예약 수정</button>
			    </form>
			    
				<form action="${pageContext.request.contextPath}/delete.le" method="post" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
				    <input type="hidden" name="resNo" value="${requestScope.les.resNo}">
				    <button class="danger-btn" type="submit">게시글 삭제</button>
				</form>

			    <button class="cancel-btn" onclick="history.back()">뒤로</button>
			</div>


        </div>
    </div>
    
    <script>
    function deletePost() {
        if (confirm('정말로 삭제하시겠습니까?')) {
            window.location.href = '${pageContext.request.contextPath}/delete.le?resNo=${requestScope.les.resNo}';
        }
    }
</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>