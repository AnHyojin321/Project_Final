
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
}

html, body {
    height: 100%;
}

/* Main Content Styles */
.main-content {
	flex: 1;
    max-width: 1500px;
    margin: 0 auto;
    padding: 20px;
 min-height: calc(100vh - 240px); /* 화면 높이에서 푸터와 헤더를 뺀 값 */
    margin-bottom: 0;
}

.menu-button {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 30px;
    cursor: pointer;
    border: none;
    background: none;
    font-size: 14px;
}

.menu-button::before {
    content: "☰";
    font-size: 18px;
}

.page-title {
    text-align: center;
    font-size: 24px;
    margin-bottom: 40px;
}

.menu-list {
    display: flex;
    flex-direction: column;
    gap: 10px;
    max-width: 400px;
    margin: 0 auto;
}

.menu-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.2s;
}

.menu-item:hover {
    background-color: #f5f5f5;
}

.menu-item span:last-child {
    color: #999;
}

/* Menu Overlay Styles */
.menu-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 50%;
    background: white;
    z-index: 1000;
    display: none;
    padding: 20px;
    overflow-y: auto;
}

.menu-overlay.active {
    display: block;
}

.menu-close {
    position: absolute;
    top: 20px;
    right: 20px;
    background: none;
    border: none;
    font-size: 20px;
    cursor: pointer;
    color: #666;
}

.menu-content {
    max-width: 1200px;
    margin: 60px auto 0;
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 30px;
    padding: 0 20px;
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
}

.menu-section-item:hover {
    color: #333;
}

/* Responsive Design */
@media (max-width: 768px) {
    .menu-content {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 480px) {
    .menu-content {
        grid-template-columns: 1fr;
    }
}
</style>
</head>

<body>
<jsp:include page="../common/header.jsp" />

    <main class="main-content">
        <button class="menu-button">MENU</button>

        <h1 class="page-title">내 정보 관리</h1>

        <div class="menu-list">
            <div class="menu-item">
                <span>회원정보 변경</span>
                <span>›</span>
            </div>
            <div class="menu-item">
                <span>비밀번호 변경</span>
                <span>›</span>
            </div>
            <div class="menu-item">
                <span>회원탈퇴 안내</span>
                <span>›</span>
            </div>
        </div>
    </main>

    <div class="menu-overlay">
        <button class="menu-close">✕ CLOSE</button>
        <div class="menu-content">
            <div class="menu-section">
                <div class="menu-section-title">매장소개</div>
                <a href="#" class="menu-section-item">브랜드</a>
                <a href="#" class="menu-section-item">오시는길</a>
                <a href="#" class="menu-section-item">SONO</a>
                <a href="#" class="menu-section-item">GW</a>
            </div>
            <div class="menu-section">
                <div class="menu-section-title">이용안내</div>
                <a href="#" class="menu-section-item">주차안내</a>
                <a href="#" class="menu-section-item">편의시설</a>
            </div>
            <div class="menu-section">
                <div class="menu-section-title">장비대여</div>
                <a href="#" class="menu-section-item">스노보드 대여</a>
            </div>
            <div class="menu-section">
                <div class="menu-section-title">내 정보 관리</div>
                <a href="#" class="menu-section-item">회원정보 변경</a>
                <a href="#" class="menu-section-item">비밀번호 변경</a>
                <a href="#" class="menu-section-item">회원탈퇴 안내</a>
            </div>
            <div class="menu-section">
                <div class="menu-section-title">나의 정보</div>
                <a href="#" class="menu-section-item">나의 예약</a>
                <a href="#" class="menu-section-item">나의 문의</a>
            </div>
            <div class="menu-section">
                <div class="menu-section-title">패키지 예약</div>
                <a href="#" class="menu-section-item">패키지 예약하기</a>
            </div>
        </div>
    </div>

    <script>
        // Menu toggle functionality
        document.querySelector('.menu-button').addEventListener('click', function() {
            document.querySelector('.menu-overlay').classList.add('active');
        });

        document.querySelector('.menu-close').addEventListener('click', function() {
            document.querySelector('.menu-overlay').classList.remove('active');
        });
    </script>
    
    <jsp:include page="../common/footer.jsp" />
</body>

</html>
