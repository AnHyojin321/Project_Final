<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>설레눈 리조트 비밀번호 변경</title>
<style>
/* 공통 스타일 */
body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color:white;
    color: #333;
}

/* 기존 스타일 유지 */
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
    background-color : #f0f8ff;
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

/* Tabs Section */
/* .tabs {
    display: flex;
    border-bottom: 2px solid #ddd;
    margin-bottom: 30px;
}

.tab {
    flex: 1;
    padding: 15px 0;
    background: none;
    border: none;
    font-size: 15px;
    color: #666;
    cursor: pointer;
    position: relative;
}

.tab.active {
    color: #4a90e2;
    font-weight: 500;
}

.tab.active::after {
    content: '';
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 100%;
    height: 2px;
    background-color: #4a90e2;
} */

/* Form Groups */
.pwd-form-group {
    margin-bottom: 24px;
}

.pwd-form-group label {
    display: block;
    margin-bottom: 8px;
    color: #333;
    font-weight: bold;
}

.pwd-form-group input {
    width: 480px;
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
    background-color:#d9e6f0;
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


    <h1 class="page-title">비밀번호 변경</h1>
        <div class="tab-container">
            <button class="tab-button" onclick="location.href='${pageContext.request.contextPath}/myPage.me'">정보변경</button>
            <button class="tab-button active" onclick="location.href='${pageContext.request.contextPath}/PwdChange.me'">비밀번호변경</button>
            <button class="tab-button" onclick="location.href='${pageContext.request.contextPath}/idDelete.me'">회원탈퇴</button>
        </div>

    <div class="container">
        <!-- 탭 UI 컨테이너 -->

        <form id="changePwdForm" action="changePwd.me" method="post">
            <div class="pwd-form-group">
                <label for="currentPwd">현재 비밀번호</label>
                <div style="position: relative;">
                    <input type="password" id="currentPwd" name="currentPwd" required>
                    <i class="fas fa-eye toggle-password"></i>
                </div>
            </div>

            <div class="pwd-form-group">
                <label for="newPwd">새 비밀번호</label>
                <div style="position: relative;">
                    <input type="password" id="newPwd" name="newPwd" required>
                    <i class="fas fa-eye toggle-password"></i>
                </div>
                <div id="newPasswordMessage" class="message"></div>
            </div>

            <div class="pwd-form-group">
                <label for="checkPwd">새 비밀번호 확인</label>
                <div style="position: relative;">
                    <input type="password" id="checkPwd" name="checkNewPwd" required>
                    <i class="fas fa-eye toggle-password"></i>
                </div>
                <div id="checkPasswordMessage" class="message"></div>
            </div>

            <input type="hidden" name="memberId" value="${sessionScope.loginMember.memberId}">
            <button type="submit" class="submit-btn">확인</button>
        </form>
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
                <div class="menu-section">
            <div class="menu-section-title">강습 </div>
            <a href="#" class="menu-section-item">강습 가격 표</a>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(function () {
    $("#newPasswordMessage").hide();
    $("#checkPasswordMessage").hide();

    const $newPwdInput = $("#newPwd");
    const $checkPwdInput = $("#checkPwd");
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~!@#$^*])[A-Za-z\d~!@#$^*]{8,20}$/;

    function validateNewPassword() {
        const newPwd = $newPwdInput.val();
        if (newPwd === "") return;
        if (passwordRegex.test(newPwd)) {
            $("#newPasswordMessage").text("사용 가능한 비밀번호입니다.").removeClass("error").addClass("success").show();
        } else {
            $("#newPasswordMessage").text("비밀번호는 8~20자이며, 대문자, 소문자, 숫자, 특수기호(~!@#$^*)를 포함해야 합니다.")
                .removeClass("success").addClass("error").show();
        }
    }

    function checkPasswordMatch() {
        const newPwd = $newPwdInput.val();
        const checkPwd = $checkPwdInput.val();
        if (newPwd === checkPwd) {
            $("#checkPasswordMessage").text("비밀번호가 일치합니다.").removeClass("error").addClass("success").show();
        } else {
            $("#checkPasswordMessage").text("비밀번호가 일치하지 않습니다.").removeClass("success").addClass("error").show();
        }
    }

    $(".toggle-password").click(function () {
        const $input = $(this).siblings("input");
        const type = $input.attr("type") === "password" ? "text" : "password";
        $input.attr("type", type);
        $(this).toggleClass("fa-eye fa-eye-slash");
    });

    $newPwdInput.on("keyup", function () {
        validateNewPassword();
        checkPasswordMatch();
    });

    $checkPwdInput.on("keyup", checkPasswordMatch);

    $("#changePwdForm").on("submit", function (e) {
        if (!passwordRegex.test($newPwdInput.val())) {
            alert("비밀번호 조건을 확인해주세요.");
            e.preventDefault();
        }
        if ($newPwdInput.val() !== $checkPwdInput.val()) {
            alert("비밀번호가 일치하지 않습니다.");
            e.preventDefault();
        }
    });
});

const menuButton = document.getElementById('menu-toggle');
const overlay = document.querySelector('.menu-overlay');

menuButton.addEventListener('click', function () {
    const rect = menuButton.getBoundingClientRect();
    overlay.style.top = rect.bottom + 'px';
    overlay.classList.toggle('active');
    menuButton.classList.toggle('active');
});

// 탭 버튼 활성화 함수
function activateTab(tabButton) {
    $('.tab-button').removeClass('active');
    $(tabButton).addClass('active');
}

// 페이지 로드 시 현재 페이지에 해당하는 탭 활성화
$(document).ready(function() {
    const currentPage = window.location.pathname;
    if (currentPage.includes('PwdChange')) {
        activateTab($('.tab-button:contains("비밀번호변경")'));
    } else if (currentPage.includes('myPage')) {
        activateTab($('.tab-button:contains("정보변경")'));
    }
});

// 탭 클릭 이벤트
$('.tab-button').click(function() {
    activateTab(this);
});
</script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>

