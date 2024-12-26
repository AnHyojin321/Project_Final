<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            color: #333;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #ddd;
            margin-bottom: 30px;
            overflow-x: auto;
            white-space: nowrap;
        }

        .nav a {
            text-decoration: none;
            color: #666;
            padding: 0 15px;
        }

        .profile {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .profile-image {
            width: 60px;
            height: 60px;
            background-color: #666;
            border-radius: 50%;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            font-size: 24px;
        }

        .profile-info h2 {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .profile-info p {
            color: #666;
            font-size: 14px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 30px;
        }

        .member-info, .my-posts, .password-change {
            background: white;
            border-radius: 8px;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .info-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 1px solid #eee;
        }

        .info-item {
            display: grid;
            grid-template-columns: 100px 1fr;
            padding: 12px 0;
            border-bottom: 1px solid #f5f5f5;
            align-items: center;
        }

        .info-item:last-child {
            border-bottom: none;
        }

        .info-label {
            color: #666;
            font-size: 14px;
        }

        .info-value {
            color: #333;
            font-size: 14px;
        }

        .account-links {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            display: flex;
            justify-content: space-between;
        }

        .account-link {
            color: #666;
            text-decoration: none;
            padding: 8px 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            background: white;
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .account-link:hover {
            background: #f5f5f5;
            color: #333;
        }

        .account-link.delete {
            color: #e54d4d;
            border-color: #e54d4d;
        }

        .account-link.delete:hover {
            background: #fdd;
        }

        .my-posts h3 {
            font-size: 18px;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 1px solid #eee;
        }

        .inquiry-stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            margin-bottom: 20px;
        }

        .inquiry-stat {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 15px;
        }

        .inquiry-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 8px;
        }

        .inquiry-number {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .inquiry-number.pending {
            color: #333;
        }

        .inquiry-buttons {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .inquiry-button {
            padding: 10px;
            border: 1px solid #2c3e50;
            background: white;
            color: #333;
            border-radius: 4px;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .inquiry-button:hover {
            background-color: #f5f5f5;
        }

        /* 주문 통계 스타일 */
        .order-stats {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            background: white;
            border: 1px solid #eee;
            margin-bottom: 30px;
            border-radius: 8px;
        }

        .order-stat-item {
            text-align: center;
            flex: 1;
        }

        .order-stat-number {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        /* 주문 목록 스타일 */
        .order-list {
            background: white;
            border: 1px solid #eee;
            margin-bottom: 30px;
            border-radius: 8px;
            overflow: hidden;
        }

        .order-header {
            display: grid;
            grid-template-columns: 1fr 2fr 1fr 1fr;
            padding: 15px;
            background: #2c3e50;
            color: white;
            font-weight: 500;
        }

        .order-item {
            display: grid;
            grid-template-columns: 1fr 2fr 1fr 1fr;
            padding: 15px;
            border-bottom: 1px solid #eee;
            align-items: center;
        }

        .order-item:last-child {
            border-bottom: none;
        }

        .order-item img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 4px;
        }

        .btn-view {
            padding: 6px 16px;
            border: 1px solid #76a77c;
            color: #76a77c;
            background: white;
            border-radius: 20px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.2s;
        }

        .btn-view:hover {
            background: #76a77c;
            color: white;
        }

        /* VIP 태그 스타일 */
        .vip-tag {
            display: inline-block;
            padding: 2px 8px;
            background: #f0f0f0;
            border-radius: 12px;
            font-size: 12px;
            margin-right: 10px;
        }

.pwd-form-group {
    margin-bottom: 24px;
    position: relative;
}

.pwd-form-group input {
    width: 100%;
    padding: 12px;
    padding-right: 40px; /* 아이콘 공간 확보 */
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
}

.toggle-password {
    position: absolute;
    top: 12px; /* 입력 필드의 높이에 맞춰 고정 */
    right: 12px;
    cursor: pointer;
        transform: translateY(190%); /* 정확히 중앙 정렬 */
    color: #999;
    font-size: 16px;
    z-index: 10;
}


        .pwd-form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }
.message {
    min-height: 20px; /* 메시지 영역의 고정 높이 설정 */
    margin-top: 4px; /* 입력 필드와 메시지 간의 간격 */
    font-size: 12px; /* 메시지 글자 크기 */
    color: #ff0000; /* 에러 메시지 색상 */
    display: flex;
    align-items: center; /* 텍스트 수직 정렬 */
    visibility: hidden; /* 초기에는 메시지를 숨김 */
}

.message.visible {
    visibility: visible; /* 메시지가 표시될 때만 보이도록 설정 */
}

.success {
    color: #28a745; /* 성공 메시지 색상 */
}

.error {
    color: #dc3545; /* 에러 메시지 색상 */
}
        .submit-btn {
            color: #666;
            text-decoration: none;
            padding: 8px 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            background: white;
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .submit-btn:hover {
            background: #f5f5f5;
            color: #333;
        }

        /* 모달 전체 스타일 */
.modal {
    display: none; /* 기본적으로 숨김 */
    position: fixed;
    z-index: 1000;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 어두운 배경 */
    justify-content: center;
    align-items: center;
}

/* 모달 내용 */
.modal-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 500px;
    max-width: 90%;
    text-align: center;
    color : red;
}

/* 닫기 버튼 */
.modal-content .close {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 24px;
    font-weight: bold;
    color: #333;
    cursor: pointer;
}

.modal-content .close:hover {
    color: #ff0000;
}
.modal-reservation {
    display: none;
    position: fixed;
    z-index: 1050;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}

/* 모달 내용 */
.modal-reservation-content {
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 500px;
    max-width: 90%;
    position: relative;
}

/* 모달 제목 */
.modal-reservation-content h1 {
    font-size: 24px;
    font-weight: 600;
    color: #333;
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #eee;
}

/* 예약 정보 스타일 */
#reservationModalContent p {
    display: flex;
    justify-content: space-between;
    margin-bottom: 12px;
    padding: 8px 0;
    border-bottom: 1px solid #f5f5f5;
}

#reservationModalContent p:last-child {
    border-bottom: none;
}

#reservationModalContent strong {
    color: #666;
    font-weight: 500;
}

/* 닫기 버튼 */
.close-reservation {
    position: absolute;
    top: 20px;
    right: 20px;
    font-size: 24px;
    font-weight: bold;
    color: #666;
    cursor: pointer;
    background: none;
    border: none;
    padding: 0;
}

.close-reservation:hover {
    color: #333;
}
    /* 모달 오버레이 */
    .modal-reservation {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 1000;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* 모달 컨테이너 */
    .modal-reservation-content {
        background: white;
        width: 100%;
        max-width: 500px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
        margin: 20px;
        position: relative;
        animation: modalFadeIn 0.3s ease-out;
    }

    /* 모달 헤더 */
    .modal-reservation-content h1 {
        font-size: 18px;
        font-weight: 600;
        color: #333;
        margin: 0;
        padding: 20px;
        border-bottom: 1px solid #e9ecef;
    }

    /* 닫기 버튼 */
    .close-reservation {
        position: absolute;
        top: 20px;
        right: 20px;
        border: none;
        background: none;
        font-size: 20px;
        cursor: pointer;
        color: #999;
        padding: 0;
        width: 24px;
        height: 24px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .close-reservation:hover {
        color: #666;
    }

    /* 모달 컨텐츠 */
    #packageModalContent {
        padding: 20px;
    }

    /* 상세 정보 행 */
    #packageModalContent p {
        display: flex;
        justify-content: space-between;
        padding: 12px 0;
        border-bottom: 1px solid #f1f3f5;
        margin: 0;
    }

    #packageModalContent p:last-child {
        border-bottom: none;
    }

    /* 레이블 스타일 */
    #packageModalContent strong {
        color: #666;
        font-size: 14px;
        font-weight: normal;
    }

    /* 값 스타일 */
    #packageModalContent span {
        color: #333;
        font-size: 14px;
        font-weight: 500;
        text-align: right;
    }

    /* 애니메이션 */
    @keyframes modalFadeIn {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* 반응형 스타일 */
    @media (max-width: 576px) {
        .modal-reservation-content {
            margin: 15px;
        }

        .modal-reservation-content h1 {
            font-size: 16px;
            padding: 15px;
        }

        #packageModalContent {
            padding: 15px;
        }
    }
        #lockerModalContent {
        padding: 20px;
    }

    /* 상세 정보 행 */
    #liftModalContent p {
        display: flex;
        justify-content: space-between;
        padding: 12px 0;
        border-bottom: 1px solid #f1f3f5;
        margin: 0;
    }

    #liftModalContent p:last-child {
        border-bottom: none;
    }

    /* 레이블 스타일 */
    #liftModalContent strong {
        color: #666;
        font-size: 14px;
        font-weight: normal;
    }

    /* 값 스타일 */
    #liftModalContent span {
        color: #333;
        font-size: 14px;
        font-weight: 500;
        text-align: right;
    }
     #liftModalContent {
        padding: 20px;
    }

    /* 상세 정보 행 */
    #liftModalContent p {
        display: flex;
        justify-content: space-between;
        padding: 12px 0;
        border-bottom: 1px solid #f1f3f5;
        margin: 0;
    }

    #liftModalContent p:last-child {
        border-bottom: none;
    }

    /* 레이블 스타일 */
    #liftModalContent strong {
        color: #666;
        font-size: 14px;
        font-weight: normal;
    }

    /* 값 스타일 */
    #liftModalContent span {
        color: #333;
        font-size: 14px;
        font-weight: 500;
        text-align: right;
    }
    
        /* 모달 컨텐츠 */
    #lockerModalContent {
        padding: 20px;
    }

    /* 상세 정보 행 */
    #lockerModalContent p {
        display: flex;
        justify-content: space-between;
        padding: 12px 0;
        border-bottom: 1px solid #f1f3f5;
        margin: 0;
    }

    #lockerModalContent p:last-child {
        border-bottom: none;
    }

    /* 레이블 스타일 */
    #lockerModalContent strong {
        color: #666;
        font-size: 14px;
        font-weight: normal;
    }

    /* 값 스타일 */
    #lockerModalContent span {
        color: #333;
        font-size: 14px;
        font-weight: 500;
        text-align: right;
    }
    
    .btn-view {
    padding: 6px 16px;
    border: 1px solid #76a77c;
    color: #76a77c;
    background: white;
    border-radius: 20px;
    cursor: pointer;
    font-size: 14px;
    transition: all 0.2s;
    text-decoration: none;
    display: inline-block;
    text-align: center;
}

.btn-view:hover {
    background: #76a77c;
    color: white;
}
.faq-section {
    margin-top: 10px; /* 전체 섹션 상단 여백 축소 */
    padding-top: 5px; /* 섹션 내부 상단 여백 축소 */
}

.faq-item {
    margin-bottom: 10px; /* 항목 간 간격 축소 */
    border-bottom: 1px solid #ddd; /* 더 얇은 하단 경계선 */
    padding-bottom: 5px; /* 하단 여백 축소 */
}

.faq-question {
    cursor: pointer;
    font-weight: bold;
    color: black;
    margin-bottom: 5px; /* 질문과 답변 사이 간격 축소 */
    line-height: 1.2; /* 텍스트 줄 간격 축소 */
}

.faq-answer {
    margin-top: 5px; /* 질문과 답변 사이 간격 축소 */
    color: #555;
    padding-left: 10px; /* 답변 들여쓰기 축소 */
    line-height: 1.4; /* 답변 줄 간격 축소 */
}

    </style>
    
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="container">
        <nav class="nav">
            <a href="${pageContext.request.contextPath}/myPage.me">마이페이지</a>
            <a href="${pageContext.request.contextPath}/myLockerReservation">락커 예약</a>	
            <a href="${pageContext.request.contextPath}/myPackage.me">패키지</a>
            <a href="${pageContext.request.contextPath}/liftList.li">리프트권</a>
            <a href="${pageContext.request.contextPath}/myRoom.me">객실 예약</a>
            <a href="${pageContext.request.contextPath}/list.le">강습 예약</a>
        </nav>


        <div class="profile">
            <div class="profile-info">
                <h1>${sessionScope.loginMember.memberName} </h1>
            </div>
        </div>

        <div class="info-grid">
            <!-- 회원 정보 섹션 -->
            <div class="member-info" id="memberInfoSection">
                <h3 class="info-title">
                	회원 정보
						<button onclick="showUpdateMemberForm()" class="account-link">회원정보 변경</button>

                </h3>
                <div class="info-item">
                    <span class="info-label">이름</span>
                    <span class="info-value">${sessionScope.loginMember.memberName}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">이메일</span>
                    <span class="info-value">${sessionScope.loginMember.email}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">전화번호</span>
                    <span class="info-value">${sessionScope.loginMember.phone}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">생년월일</span>
                    <span class="info-value">${sessionScope.loginMember.birthDate}</span>
                </div>
                <div class="account-links">
                    <button onclick="showPasswordChangeForm()" class="account-link">비밀번호 변경</button>
					<button type="button" class="account-link delete" onclick="showModal()">회원 탈퇴</button>


                </div>
            </div>

    <!-- 비밀번호 변경 폼 수정 -->
    <div class="member-info" id="passwordChangeSection" style="display: none;">
        <h3 class="info-title">비밀번호 변경</h3>
        <form id="changePwdForm" action="changePwd.me" method="post">
            <div class="pwd-form-group">
                <label for="currentPwd">현재 비밀번호</label>
                <input type="password" id="currentPwd" name="currentPwd" required>
                <i class="fas fa-eye toggle-password"></i>
            </div>
			<div class="pwd-form-group">
			    <label for="newPwd">새 비밀번호</label>
			    <input type="password" id="newPwd" name="newPwd" required>
			    <i class="fas fa-eye toggle-password"></i>
			    <div id="newPasswordMessage" class="message"></div>
			</div>
			<div class="pwd-form-group">
			    <label for="checkPwd">새 비밀번호 확인</label>
			    <input type="password" id="checkPwd" name="checkNewPwd" required>
			    <i class="fas fa-eye toggle-password"></i>
			    <div id="checkPasswordMessage" class="message"></div>
			</div>

            <button type="submit" class="submit-btn">변경</button>
			<button type="button" class="submit-btn" onclick="showMemberInfo()">취소</button>

        </form>
    </div>
    
    <!-- 회원정보 변경 폼 -->
<div class="member-info" id="updateMemberSection" style="display: none;">
    <h3 class="info-title">회원정보 변경</h3>
    <form id="updateMemberForm" action="${pageContext.request.contextPath}/update.me" method="post">
        <div class="info-item">
            <label for="memberId" class="info-label">아이디</label>
            <input type="text" id="memberId" name="memberId" value="${sessionScope.loginMember.memberId}" readonly>
        </div>
        <div class="info-item">
            <label for="memberName" class="info-label">이름</label>
            <input type="text" id="memberName" name="memberName" value="${sessionScope.loginMember.memberName}" required>
        </div>
        <div class="info-item">
            <label for="email" class="info-label">이메일</label>
            <input type="email" id="email" name="email" value="${sessionScope.loginMember.email}" readonly>
        </div>
        <div class="info-item">
            <label for="phone" class="info-label">전화번호</label>
            <input type="tel" id="phone" name="phone" value="${sessionScope.loginMember.phone}" required>
        </div>
        <div class="info-item">
            <label for="birthDate" class="info-label">생년월일</label>
            <input type="date" id="birthDate" name="birthDate" value="${sessionScope.loginMember.birthDate}" required>
        </div>
        <div class="info-item">
            <label for="address" class="info-label">주소</label>
            <input type="text" id="address" name="address" value="${sessionScope.loginMember.address}">
        </div>
        <div class="account-links">
            <button type="submit" class="account-link">저장</button>
            <button type="button" class="account-link" onclick="showMemberInfo()">취소</button>
        </div>
    </form>
</div>
    
		<!-- 모달 -->
		<div id="withdrawalModal" class="modal" style="display: none;">
		    <div class="modal-content">
		        <span class="close">&times;</span>
		        <h2>회원탈퇴</h2>
		        <p>탈퇴 후 복구가 불가능합니다. 정말로 탈퇴 하시겠습니까?</p>
		        <form id="withdrawalForm" action="delete.me" method="post">
		            <div class="pwd-form-group">
		                <label for="memberPwd">비밀번호:</label>
		                <input type="password" id="memberPwd" name="memberPwd" required>
		                <i class="fas fa-eye toggle-password"></i>
		            </div>
		            <input type="hidden" name="memberId" value="${sessionScope.loginMember.memberId}">
		            <div style="text-align: center; margin-top: 20px;">
		                <button type="submit" class="submit-btn">탈퇴하기</button>
		                <button type="button" class="submit-btn" onclick="closeModal()">취소</button>
		            </div>	
		        </form>
		    </div>
		</div>


            <!-- 내 문의 섹션 -->

<div class="my-posts">
    <h3>자주 묻는 질문</h3>
    <div class="faq-section">
        <div class="faq">
            <div class="faq-item">
                <h4 class="faq-question">Q: 예약은 어떻게 하나요?</h4>
                <p class="faq-answer" style="display: none;">
                    A: 예약은 홈페이지 회원 가입 후 원하는 객실, 강습, 리프트권, 패키지, 락커 등을 선택해 예약할 수 있습니다.
                </p>
            </div>
            <div class="faq-item">
                <h4 class="faq-question">Q: 예약 후 결제 방법은 무엇인가요?</h4>
                <p class="faq-answer" style="display: none;">
                    A: 결제는 신용카드, 계좌이체, 간편결제(카카오페이, 네이버페이 등)를 지원합니다.
                       강습 에약일 경우에는 예약시 보내드린 메일에서 입금을 해주시면 됩니다.
                </p>
            </div>
            <div class="faq-item">
                <h4 class="faq-question">Q: 객실 체크인 및 체크아웃 시간은 언제인가요?</h4>
                <p class="faq-answer" style="display: none;">
                    A: 체크인은 오후 3시부터, 체크아웃은 오전 11시까지입니다.
                </p>
            </div>
            <div class="faq-item">
                <h4 class="faq-question">Q: 리프트권은 현장에서 구매할 수 있나요?</h4>
                <p class="faq-answer" style="display: none;">
                    A: 네, 현장에서 구매 가능고, 리프트권 구매 페이지에서도 구매가 가능합니다.
                </p>
            </div>
        </div>
    </div>
</div>
        </div>

        <!-- 주문 통계 -->
 <div class="order-stats">
    <div class="order-stat-item">
        <div>락커</div><br>
        <div class="order-stat-number">${lockerCount}</div>
    </div>
    <div class="order-stat-item">
        <div>객실</div><br>
        <div class="order-stat-number">${roomCount}</div>
    </div>
    <div class="order-stat-item">
        <div>패키지</div><br>
        <div class="order-stat-number">${packageCount}</div>
    </div>
    <div class="order-stat-item">
        <div>리프트</div><br>
        <div class="order-stat-number">${liftCount}</div>
    </div>
</div>


       <!-- 주문 목록 -->
<div class="order-list">
    <div class="order-header">
        <div>예약번호</div>
        <div>상품정보</div>
        <div>결제 금액</div>
        <div>상세 보기</div>
    </div>
    <div id="reservationItems">
        <c:choose>

            <c:when test="${not empty reservedRooms or not empty reservedLiftList or not empty reservedPackages or not empty reservedLockers}">

                <c:forEach var="room" items="${reservedRooms}">
                    <div class="order-item" data-date="${room.reservDate}">
                        <div>[#${room.roomReservNo}]<br>${room.reservDate}</div>
                        <div>${room.roomType} 룸</div>
                        <div>${room.amount}원</div>
                        <div>
                            <button class="btn-view" onclick="openReservationDetailModal(${room.roomReservNo}, ${sessionScope.loginMember.memberNo})">조회</button>
                        </div>
                    </div>
                </c:forEach>

                <c:forEach var="liftOrder" items="${reservedLiftList}">
                    <div class="order-item">
                        <div>[#${liftOrder.liftOrderNo}]</div>
                        <div>리프트 번호: ${liftOrder.liftNo}</div>
                        <div>${liftOrder.liftTotalPrice}원</div>
                        <div>
                            <button class="btn-view" onclick="openLiftDetailModal(${liftOrder.liftOrderNo})">조회</button>
                        </div>
                    </div>
                </c:forEach>

                <c:forEach var="packagePay" items="${reservedPackages}">
                    <div class="order-item">
                        <div>[#${packagePay.packageReservNo}]<br>${packagePay.payDate}</div>
                        <div>${packagePay.packageName}</div>
                        <div>${packagePay.packagePrice}원</div>
                        <div>
                            <button class="btn-view" onclick="openPackageDetailModal(${packagePay.packageReservNo})">조회</button>
                        </div>
                    </div>
                </c:forEach>

                <c:forEach var="locker" items="${reservedLockers}">
                    <div class="order-item" data-reservno="${locker.lockerReservNo}">
                        <div>[#${locker.lockerReservNo}]</div>
                        <div>락커</div>
                        <div>${locker.lockerTotalPrice}원</div>
                        <div>
                            <button class="btn-view" onclick="openLockerDetailModal(${locker.lockerReservNo})">조회</button>
                        </div>
                    </div>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <div class="order-item" style="text-align: center; padding: 20px;">
                    예약 내역이 없습니다.
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- 락커 상세 정보 모달 -->
<div id="lockerDetailModal" class="modal-reservation" style="display: none;">
    <div class="modal-reservation-content">
        <span class="close-reservation" onclick="closeLockerDetailModal()">&times;</span>
        <h1>락커 상세 정보</h1>
        <div id="lockerModalContent">
            <!-- AJAX를 통해 동적으로 데이터를 로드 -->
        </div>
    </div>
</div>

		<!-- 예약 상세 정보 모달 -->
<div id="reservationDetailModal" class="modal-reservation" style="display: none;">
    <div class="modal-reservation-content">
        <span class="close-reservation" onclick="closeReservationModal()">&times;</span>
        <h1>객실 예약 상세 정보</h1>
        <div id="reservationModalContent">
            <!-- AJAX를 통해 동적으로 데이터를 로드 -->
            <p><strong>예약 상세 정보를 불러오는 중...</strong></p>
        </div>
    </div>
</div>


    <div id="liftDetailModal" class="modal-reservation" style="display: none;">
        <div class="modal-reservation-content">
            <span class="close-reservation" onclick="closeLiftDetailModal()">&times;</span>
            <h1>리프트 상세 정보</h1>
            <div id="liftModalContent">
                <!-- AJAX를 통해 동적으로 데이터가 로드됩니다 -->
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(".faq-question").on("click", function () {
            const $answer = $(this).next(".faq-answer");
            const $faqItem = $(this).parent(".faq-item");
            const isVisible = $answer.is(":visible");

            // 모든 질문과 답변을 닫기
            $(".faq-answer").slideUp();
            $(".faq-item").not($faqItem).hide();

            if (!isVisible) {
                // 현재 클릭한 항목의 답변만 슬라이드 다운
                $faqItem.show();
                $answer.slideDown();
            } else {
                // 다시 클릭 시 전체 항목 보이기
                $(".faq-item").show();
            }
        });
    });
</script>


<script>
var contextPath = "${pageContext.request.contextPath}";
function openLockerDetailModal(lockerReservNo) {
    if (!lockerReservNo) {
        alert("예약 번호를 찾을 수 없습니다.");
        return;
    }

    $.ajax({
        url: '/ski/lockerDetail.lo', // 컨트롤러 매핑 URL
        type: 'GET',
        data: { lockerReservNo: lockerReservNo }, // 서버에 전달할 파라미터
        success: function (response) {
            if (response) {
                var modalContent =
                    "<p><strong>예약번호:</strong> " + (response.lockerReservNo || '없음') + "</p>" +
                    "<p><strong>시작 날짜:</strong> " + (response.lockerStartDate || '없음') + "</p>" +
                    "<p><strong>종료 날짜:</strong> " + (response.lockerEndDate || '없음') + "</p>" +
                    "<p><strong>총 금액:</strong> " + (response.lockerTotalPrice || '0') + "원</p>" +
                    "<p><a href='" + contextPath + "/myLockerReservation' class='btn-view'>자세히 보기</a></p>";
                document.getElementById('lockerModalContent').innerHTML = modalContent;
                document.getElementById('lockerDetailModal').style.display = 'flex';
            } else {
                alert("락커 정보를 불러오는데 실패했습니다.");
            }
        },
        error: function () {
            alert("서버 요청 중 오류가 발생했습니다.");
        }
    });
}

function closeLockerDetailModal() {
    document.getElementById('lockerDetailModal').style.display = 'none';
}


function openPackageDetailModal(packageReservNo) {
    if (!packageReservNo) {
        alert("패키지 예약 번호를 찾을 수 없습니다.");
        return;
    }

    $.ajax({
        url: '/ski/packageDetail.pk',
        type: 'GET',
        data: { packageReservNo: packageReservNo },
        success: function (response) {
            if (response) {
                var modalContent = "<p><strong>예약번호:</strong> " + (response.packageReservNo || '없음') + "</p>" +
                                   "<p><strong>패키지 이름:</strong> " + (response.packageName || '없음') + "</p>" +
                                   "<p><strong>체크인 날짜:</strong> " + (response.checkInDate || '없음') + "</p>" +
                                   "<p><strong>체크아웃 날짜:</strong> " + (response.checkOutDate || '없음') + "</p>" +
                                   "<p><strong>결제 금액:</strong> " + (response.packagePrice || '0') + "원</p>";
                document.getElementById('packageModalContent').innerHTML = modalContent;
                document.getElementById('packageDetailModal').style.display = 'flex';
            } else {
                alert("패키지 정보를 불러오는데 실패했습니다.");
            }
        },
        error: function () {
            alert("서버 요청 중 오류가 발생했습니다.");
        }
    });
}

function closePackageDetailModal() {
    document.getElementById('packageDetailModal').style.display = 'none';
}


document.addEventListener("DOMContentLoaded", function () {
    const reservationContainer = document.getElementById("reservationItems");

    // 모든 예약 항목 가져오기 (리프트 제외)
    const reservations = Array.from(reservationContainer.children);

    // 날짜 기준으로 정렬 (오름차순)
    reservations.sort((a, b) => {
        const dateA = new Date(a.getAttribute("data-date"));
        const dateB = new Date(b.getAttribute("data-date"));
        return dateA - dateB; // 오름차순
    });

    // 정렬된 요소를 다시 추가
    reservations.forEach(item => reservationContainer.appendChild(item));
});

function openReservationDetailModal(roomReservNo, memberNo) {
    if (!roomReservNo || !memberNo) {
        alert("필요한 매개변수가 누락되었습니다.");
        return;
    }

    $.ajax({
        url: '/ski/myRoomDetail.ro',
        type: 'POST',
        data: {
            roomReservNo: roomReservNo,
            memberNo: memberNo
        },
        success: function (response) {
            if (response.roomDetail) {
                var modalContent =
                    "<p><strong>객실 이름:</strong> " + (response.roomDetail.roomName || "없음") + "</p>" +
                    "<p><strong>객실 타입:</strong> " + (response.roomDetail.roomType || "없음") + "</p>" +
                    "<p><strong>예약 금액:</strong> " + (response.roomDetail.amount || "0") + "원</p>" +
                    "<p><strong>체크인:</strong> " + (response.roomDetail.checkInDate || "없음") + "</p>" +
                    "<p><strong>체크아웃:</strong> " + (response.roomDetail.checkOutDate || "없음") + "</p>" +
                    "<p><a href='" + contextPath + "/myRoomReservation.ro' class='btn-view'>자세히 보기</a></p>";
                document.getElementById("reservationModalContent").innerHTML = modalContent;
                document.getElementById("reservationDetailModal").style.display = "flex";
            } else {
                alert("예약 정보를 불러오는데 실패했습니다.");
            }
        },
        error: function () {
            alert("서버 요청 중 오류가 발생했습니다.");
        }
    });
}


function closeReservationModal() {
    document.getElementById("reservationDetailModal").style.display = "none";
}

function openLiftDetailModal(liftOrderNo) {
    if (!liftOrderNo) {
        alert("리프트 예약 번호를 찾을 수 없습니다.");
        return;
    }

    $.ajax({
        url: "/ski/liftOrderDetail.li", // 컨트롤러 매핑 URL
        type: "GET",
        data: { liftOrderNo: liftOrderNo }, // 서버에 전달할 파라미터
        dataType: "json", // JSON 형식으로 데이터 반환
        success: function (response) {
            if (response && response.liftOrderNo) { // 응답 값 검증
                var modalContent = "<p><strong>예약번호:</strong> " + (response.liftOrderNo || "없음") + "</p>" +
                    "<p><strong>리프트 번호:</strong> " + (response.liftNo || "없음") + "</p>" +
                    "<p><strong>수량:</strong> " + (response.liftCount || "없음") + "매</p>" +
                    "<p><strong>총 금액:</strong> " + (response.liftTotalPrice || "0") + "원</p>";
                document.getElementById("liftModalContent").innerHTML = modalContent;
                document.getElementById("liftDetailModal").style.display = "flex";
            } else {
                alert("리프트 정보를 불러오는데 실패했습니다.");
            }
        },
        error: function () {
            alert("서버 요청 중 오류가 발생했습니다.");
        }
    });
}




// 리프트 상세 정보 모달 닫기
function closeLiftDetailModal() {
    document.getElementById('liftDetailModal').style.display = 'none';
}


//모든 섹션 숨기기
function hideAllSections() {
    document.getElementById('memberInfoSection').style.display = 'none';
    document.getElementById('passwordChangeSection').style.display = 'none';
    document.getElementById('updateMemberSection').style.display = 'none';
}

// 회원 정보 섹션으로 돌아가기
function showMemberInfo() {
    hideAllSections(); // 모든 섹션 숨기기
    document.getElementById('memberInfoSection').style.display = 'block';
}

// 회원정보 변경 섹션 열기
function showUpdateMemberForm() {
    hideAllSections(); // 모든 섹션 숨기기
    document.getElementById('updateMemberSection').style.display = 'block';
}

// 비밀번호 변경 섹션 열기
function showPasswordChangeForm() {
    hideAllSections(); // 모든 섹션 숨기기
    document.getElementById('passwordChangeSection').style.display = 'block';
}
$(document).ready(function () {
    // 비밀번호 표시/숨김 토글 기능
    $(".toggle-password").on("click", function () {
        const $input = $(this).siblings("input");
        const currentType = $input.attr("type");

        if (currentType === "password") {
            $input.attr("type", "text");
            $(this).removeClass("fa-eye").addClass("fa-eye-slash");
        } else {
            $input.attr("type", "password");
            $(this).removeClass("fa-eye-slash").addClass("fa-eye");
        }
    });

    // 비밀번호 유효성 검사
    const $currentPwdInput = $("#currentPwd"); // 현재 비밀번호
    const $newPwdInput = $("#newPwd");       // 새 비밀번호
    const $checkPwdInput = $("#checkPwd");   // 새 비밀번호 확인
    const $submitBtn = $("#changePwdForm button[type='submit']"); // 변경 버튼
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~!@#$^*])[A-Za-z\d~!@#$^*]{8,20}$/;

    // 새 비밀번호 유효성 검사 함수
    function validateNewPassword() {
        const currentPwd = $currentPwdInput.val(); // 현재 비밀번호 값
        const newPwd = $newPwdInput.val();        // 새 비밀번호 값
        const $message = $("#newPasswordMessage");

        if (newPwd === "") {
            $message.removeClass("visible success error");
            return false;
        }

        if (newPwd === currentPwd) {
            // 새 비밀번호와 현재 비밀번호가 동일한 경우
            $message.text("새 비밀번호는 현재 비밀번호와 다르게 설정해야 합니다.")
                .removeClass("success")
                .addClass("error visible");
            return false;
        } else if (passwordRegex.test(newPwd)) {
            $message.text("사용 가능한 비밀번호입니다.")
                .removeClass("error")
                .addClass("success visible");
            return true;
        } else {
            $message.text("비밀번호는 8~20자이며, 대문자, 소문자, 숫자, 특수기호(~!@#$^*)를 포함해야 합니다.")
                .removeClass("success")
                .addClass("error visible");
            return false;
        }
    }

    // 비밀번호 일치 여부 검사 함수
    function checkPasswordMatch() {
        const currentPwd = $currentPwdInput.val(); // 현재 비밀번호
        const newPwd = $newPwdInput.val();        // 새 비밀번호 값
        const checkPwd = $checkPwdInput.val();    // 확인 비밀번호 값
        const $message = $("#checkPasswordMessage");

        if (checkPwd === "") {
            $message.removeClass("visible success error");
            return false;
        }

        if (checkPwd !== newPwd) {
            $message.text("비밀번호가 일치하지 않습니다.")
                .removeClass("success")
                .addClass("error visible");
            return false;
        }

        if (newPwd === currentPwd) {
            // 새 비밀번호가 현재 비밀번호와 동일한 경우
            $message.text("새 비밀번호는 현재 비밀번호와 다르게 설정해야 합니다.")
                .removeClass("success")
                .addClass("error visible");
            return false;
        }

        $message.text("비밀번호가 일치합니다.")
            .removeClass("error")
            .addClass("success visible");
        return true;
    }

    // 버튼 활성화/비활성화 관리
    function toggleSubmitButton() {
        const isValidNewPwd = validateNewPassword();
        const isPwdMatch = checkPasswordMatch();

        // 새 비밀번호가 유효하고 확인 비밀번호와 일치하며, 기존 비밀번호와 다를 때만 활성화
        if (isValidNewPwd && isPwdMatch) {
            $submitBtn.prop("disabled", false);
        } else {
            $submitBtn.prop("disabled", true);
        }
    }

    // 입력 이벤트 연결
    $currentPwdInput.on("keyup", toggleSubmitButton);
    $newPwdInput.on("keyup", toggleSubmitButton);
    $checkPwdInput.on("keyup", toggleSubmitButton);

    // 초기 상태에서 버튼 비활성화
    $submitBtn.prop("disabled", true);

    // 폼 제출 시 유효성 검사
    $("#changePwdForm").on("submit", function (e) {
        const currentPwd = $currentPwdInput.val(); // 현재 비밀번호
        const newPwd = $newPwdInput.val();        // 새 비밀번호
        const checkPwd = $checkPwdInput.val();    // 새 비밀번호 확인

        if (!passwordRegex.test(newPwd)) {
            alert("새 비밀번호 조건을 확인해주세요.");
            e.preventDefault();
            return;
        }

        if (newPwd === currentPwd) {
            alert("새 비밀번호는 현재 비밀번호와 다르게 설정해야 합니다.");
            e.preventDefault();
            return;
        }

        if (newPwd !== checkPwd) {
            alert("새 비밀번호가 일치하지 않습니다.");
            e.preventDefault();
        }
    });

    // 회원 탈퇴 모달 관련 함수
    const $modal = $("#withdrawalModal");

    function showModal() {
        $modal.css("display", "flex");
    }

    function closeModal() {
        $modal.hide();
    }

    // 회원 탈퇴 모달 이벤트 연결
    $(document).on("click", ".account-link.delete", function () {
        showModal();
    });

    $(window).on("click", function (event) {
        if (event.target === $modal[0]) {
            closeModal();
        }
    });

    $(document).on("click", ".close", function () {
        closeModal();
    });
});



    function closeModal() {
        document.getElementById("withdrawalModal").style.display = "none";
    }

</script>
<script>
    function viewReservationDetail(roomNo) {
        // 상세 페이지 URL로 이동
        location.href = "/ski/reservationDetail.ro?roomNo=" + roomNo;
    }
</script>
        <jsp:include page="../common/footer.jsp" />

</body>
</html>