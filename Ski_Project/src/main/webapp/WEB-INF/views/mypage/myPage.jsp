<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>설레눈 리조트 내 정보 관리</title>
<style>
/* Reset */
body {
    margin: 0;
    background-color: #f9f9f9;
    font-family: 'Arial', sans-serif;
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
    background-color: white;
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
    color: #333;
}

/* Container */
.container {
    max-width: 600px;
    margin: 0 auto;
    background-color: white;
    padding: 20px;
    border-radius: 8px;
}

/* Tabs Section */
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
/* Form Groups */
.form-group {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.form-group label {
    width: 100px;
    color: #333;
    font-weight: bold;
}

.form-group input[type="text"],
.form-group input[type="email"],
.form-group input[type="tel"],
.form-group input[type="date"] {
    flex: 1;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #fff;
    transition: border-color 0.3s ease;
}

.form-group input:focus {
    border-color: #4a90e2;
    outline: none;
}

.form-group input[readonly] {
    background-color: #f1f1f1;
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

/* Responsive Design */
@media (max-width: 768px) {
    .menu-content {
        grid-template-columns: repeat(2, 1fr);
    }
    .container {
        padding: 15px;
    }
    .form-group {
        flex-direction: column;
        align-items: flex-start;
    }
    .form-group label {
        margin-bottom: 5px;
    }
    .form-group input {
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
</style>
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
            <button class="tab-button active" onclick="location.href='${pageContext.request.contextPath}/myPage.me'">정보변경</button>
            <button class="tab-button" onclick="location.href='${pageContext.request.contextPath}/PwdChange.me'">비밀번호변경</button>
            <button class="tab-button" onclick="location.href='${pageContext.request.contextPath}/idDelete.me'">회원탈퇴</button>
        </div>
    <div class="container">

        <form action="update.me" method="post">
            <div class="form-group">
                <label for="memberId">아이디</label>
                <input type="text" id="memberId" name="memberId" value="${sessionScope.loginMember.memberId}" readonly>
            </div>
            <div class="form-group">
                <label for="memberName">이름</label>
                <input type="text" id="memberName" name="memberName" value="${sessionScope.loginMember.memberName}" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" value="${sessionScope.loginMember.email}" readonly>
            </div>
            <div class="form-group">
                <label for="birthDate">생년월일</label>
                <input type="date" id="birthDate" name="birthDate" value="${sessionScope.loginMember.birthDate}">
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="tel" id="phone" name="phone" value="${sessionScope.loginMember.phone}">
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" id="address" name="address" value="${sessionScope.loginMember.address}">
            </div>
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
            <a href="${pageContext.request.contextPath}/lessonPay.le" class="menu-section-item">강습 가격 표</a>
        </div>
    </div>
</div>

<script>
    const menuButton = document.getElementById('menu-toggle');
    const overlay = document.querySelector('.menu-overlay');

    menuButton.addEventListener('click', function () {
        const rect = menuButton.getBoundingClientRect();
        overlay.style.top = rect.bottom + 'px';
        overlay.classList.toggle('active');
        menuButton.classList.toggle('active');
    });
</script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>