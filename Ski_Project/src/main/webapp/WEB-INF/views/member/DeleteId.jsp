<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>설레눈 리조트 회원탈퇴</title>
<style>
/* 공통 스타일 */
body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color: white;
    color: #333;
}

html, body {
    height: 100%;
}

/* Header Styles */
header {
    background-color: #f9f9f9;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    z-index: 1001;
}

/* Main Content */
.main-content {
    flex: 1;
    max-width: 2000px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f0f8ff;
    min-height: calc(100vh - 240px);
}

/* Menu Button */
.menu-button {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 30px;
    cursor: pointer;
    border: none;
    background: none;
    font-size: 18px;
    font-weight: bold;
    color: #333;
    transition: color 0.3s;
}

.menu-button::before {
    content: "☰";
    font-size: 18px;
    transition: content 0.3s;
}

.menu-button.active::before {
    content: "✕";
}

/* Page Title */
.page-title {
    text-align: center;
    font-size: 28px;
    margin-bottom: 40px;
}

/* Container */
.container {
    max-width: 500px;
    margin: 0 auto;
    background-color: #ffffff;
    padding: 30px;
    border-radius: 8px;
}

/* Form Groups */
.pwd-form-group {
    margin-bottom: 24px;
    position: relative;
}

.pwd-form-group label {
    display: block;
    margin-bottom: 8px;
    color: #333;
    font-weight: bold;
}

.pwd-form-group input {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 16px;
    transition: border-color 0.3s ease;
}

.pwd-form-group input:focus {
    border-color: #4a90e2;
    outline: none;
    box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
}

.toggle-password {
    position: absolute;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
    color: #999;
    cursor: pointer;
    background: none;
    border: none;
    padding: 0;
}

/* Submit Button */
.submit-btn {
    display: block;
    width: 50%;
    margin: 30px auto 0;
    padding: 12px;
    background-color: #4a90e2;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.submit-btn:hover {
    background-color: #357ab7;
}

/* Menu Overlay */
.menu-overlay {
    position: absolute;
    left: 0;
    width: 100%;
    background-color: rgba(249, 249, 249, 0.95);
    z-index: 1000;
    display: none;
    padding: 20px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.menu-overlay.active {
    display: block;
}

.menu-content {
    max-width: 1200px;
    margin: 20px auto;
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 30px;
}

.menu-section {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.menu-section-title {
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
}

.menu-section-item {
    color: #666;
    text-decoration: none;
    font-size: 14px;
    transition: color 0.2s;
}

.menu-section-item:hover {
    color: #333;
}

/* Message Styles */
.message {
    font-size: 12px;
    margin-top: 4px;
}

.message.success {
    color: #2ea043;
}

.message.error {
    color: #f85149;
}

/* Responsive Design */
@media (max-width: 768px) {
    .menu-content {
        grid-template-columns: repeat(2, 1fr);
    }
    .container {
        padding: 15px;
    }
    .pwd-form-group {
        flex-direction: column;
        align-items: flex-start;
    }
    .pwd-form-group label {
        margin-bottom: 5px;
    }
    .pwd-form-group input {
        width: 100%;
    }
}

@media (max-width: 480px) {
    .menu-content {
        grid-template-columns: 1fr;
    }
    .page-title {
        font-size: 24px;
    }
    .tab {
        padding: 8px 12px;
        font-size: 14px;
    }
}

/* 탭 컨테이너 스타일 */
.tab-container {
    display: flex;
    background-color: #d9e6f0;
    border-radius: 8px;
    overflow: hidden;
    max-width: 600px;
    margin: 20px auto;
}

/* 탭 버튼 스타일 */
.tab-button {
    flex: 1;
    padding: 15px 0;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
    color: #666;
    background: transparent;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}

/* 활성 탭 스타일 */
.tab-button.active {
    background-color: #ffffff;
    color: #333;
    border: 1px solid #ddd;
    border-bottom: none;
    border-radius: 8px 8px 0 0;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.tab-button:hover {
    background-color: #f5f5f5;
}

.withdrawal-notice {
    margin-bottom: 20px;
    color: #666;
    box-sizing: border-box !important; /* 우선순위 강제 적용 */
}

.notice-list {
    list-style: none;
    padding: 0;
}

.notice-item {
    margin-bottom: 16px;
    position: relative;
    padding-left: 20px;
}

.notice-item::before {
    content: "•";
    position: absolute;
    left: 0;
    color: #4a90e2;
}

.important-notice {
    font-weight: bold;
    color: #333;
    margin-top: 8px;
}

.agreement-checkbox {
    display: flex;
    align-items: center;
    gap: 8px;
    margin: 24px 0;
}

.agreement-checkbox input {
    width: 16px;
    height: 16px;
    margin: 0;
}

.agreement-checkbox label {
    font-size: 14px;
    color: #666;
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1050;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 500px;
    border-radius: 8px;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<jsp:include page="../common/header.jsp" />

<main class="main-content">
    <button class="menu-button" id="menu-toggle">MENU</button>
    <a href="${pageContext.request.contextPath}/myPage1.me" style="display: flex; align-items: center; text-decoration: none; color: inherit;">
    	<img src="resources/images/back.png" style="width: 25px; height: 25px; margin-right: 5px;">
    	<span style="font-size: 16px; font-weight: bold;">BACK</span>
	</a>

    <h1 class="page-title">내 정보 관리</h1>
    <div class="tab-container">
        <button class="tab-button" onclick="location.href='${pageContext.request.contextPath}/myPage.me'">정보변경</button>
        <button class="tab-button" onclick="location.href='${pageContext.request.contextPath}/PwdChange.me'">비밀번호변경</button>
        <button class="tab-button active" onclick="location.href='${pageContext.request.contextPath}/idDelete.me'">회원탈퇴</button>
    </div>

    <div class="container">
        <h2 style="text-align: center; margin-bottom: 20px; font-size: 24px;">탈퇴 안내</h2>
        <p class="withdrawal-notice">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
    
        <ul class="notice-list">
            <li class="notice-item">
                탈퇴 시 예약 및 기타 회원 서비스 이용에 제약을 받을 수 있으며 회원권 정보 등록을 연동한 경우, 연동이 해제됩니다.
                <p class="important-notice">
                    ※ 객실, 패키지, 상품 예약 탈퇴(변경, 취소, 결제 이력 등)이 있는 경우 탈퇴 시 온라인에서 예약 내역 확인에 제약이 있을 수 있습니다.
                </p>
            </li>
            <li class="notice-item">
                회원정보는 개인정보보호 처리 방침 기준에 따라 탈퇴 즉시 파기됩니다.
            </li>
            <li class="notice-item">
                게시판 서비스 이용 기록(등록한 게시물, 문의 내용 등)은 탈퇴 후에도 남아있으며, 원치 않으실 경우 탈퇴 전 직접 삭제하셔야 합니다.
            </li>
            <li class="notice-item">
                제공되었던 혜택 및 쿠폰은 삭제되어 복구되지 않습니다.
            </li>
        </ul>
    
        <div class="agreement-checkbox">
            <input type="checkbox" id="agreement" required>
            <label for="agreement">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
        </div>
    
        <button type="button" class="submit-btn" id="openModal">확인</button>
    </div>
</main>

<div class="menu-overlay">
    <div class="menu-content">
        <div class="menu-section">
            <div class="menu-section-title">내 정보 관리</div>
            <a href="${pageContext.request.contextPath}/myPage.me" class="menu-section-item">회원정보 변경</a>
            <a href="${pageContext.request.contextPath}/PwdChange.me" class="menu-section-item">비밀번호 변경</a>
            <a href="${pageContext.request.contextPath}/idDelete.me" class="menu-section-item">회원탈퇴 안내</a>
        </div>
        <div class="menu-section">
            <div class="menu-section-title">나의 정보</div>
            <a href="#" class="menu-section-item">나의 예약</a>
            <a href="#" class="menu-section-item">나의 문의</a>
        </div>
    </div>
</div>

<!-- 모달 -->
<div id="withdrawalModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>회원탈퇴</h2>
        <p>탈퇴 후 복구가 불가능합니다. 정말로 탈퇴 하시겠습니까?</p>
        <form id="withdrawalForm" action="delete.me" method="post">
            <div class="pwd-form-group">
                <label for="memberPwd">비밀번호:</label>
                <input type="password" id="memberPwd" name="memberPwd" required style="right: 16px; position: relative;">
                <i class="fas fa-eye toggle-password" style="top: 50px; position: absolute;"></i>
            </div>
            <input type="hidden" name="memberId" value="${sessionScope.loginMember.memberId}">
            <button type="submit" class="submit-btn">탈퇴하기</button>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
    const menuButton = document.getElementById('menu-toggle');
    const overlay = document.querySelector('.menu-overlay');
    
    menuButton.addEventListener('click', function () {
        const rect = menuButton.getBoundingClientRect();
        overlay.style.top = rect.bottom + 'px';
        overlay.classList.toggle('active');
        menuButton.classList.toggle('active');
    });

    // 모달 관련 스크립트
    var modal = document.getElementById("withdrawalModal");
    var btn = document.getElementById("openModal");
    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function() {
        if (document.getElementById("agreement").checked) {
            modal.style.display = "block";
        } else {
            alert("안내 사항에 동의해주세요.");
        }
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // 비밀번호 표시/숨김 토글
    $('.toggle-password').click(function() {
        var input = $(this).prev('input');
        if (input.attr('type') === 'password') {
            input.attr('type', 'text');
            $(this).removeClass('fa-eye').addClass('fa-eye-slash');
        } else {
            input.attr('type', 'password');
            $(this).removeClass('fa-eye-slash').addClass('fa-eye');
        }
    });

    // 폼 제출 처리
    $('#withdrawalForm').on('submit', function(e) {
        if (!confirm('정말로 탈퇴하시겠습니까?')) {
            e.preventDefault();
        }
    });
});
</script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>