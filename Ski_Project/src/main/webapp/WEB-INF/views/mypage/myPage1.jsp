
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
/* Reset */
body {
    margin: 0;
    background-color: #f0f8ff; /* 전체 배경색 통일 */
}

html, body {
    height: 100%;
}

/* Header Styles */
header {
    background-color: #f0f8ff; /* 헤더와 오버레이 배경 통일 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    z-index: 1001;
}

/* Main Content Styles */
.main-content {
    flex: 1;
    max-width: 2000px;
    margin: 0 auto;
    padding: 20px;
    background-color:white; /* 배경색 통일 */
    min-height: calc(100vh - 240px);
    margin-bottom: 0;
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
    content: "☰"; /* 초기 아이콘 ☰ */
    font-size: 18px;
    transition: content 0.3s; /* 아이콘 변경 시 부드럽게 */
}

.menu-button.active::before {
    content: "✕"; /* 메뉴가 열렸을 때 아이콘 ✕ */
}


.page-title {
    text-align: center;
    font-size: 24px;
    margin-bottom: 80px; /* 제목과 메뉴 리스트 사이 간격 추가 */
}

/* Menu List */
.menu-list {
    display: flex;
    flex-direction: column;
    gap: 10px;
    max-width: 400px;
    margin: 0 auto;
    justify-content: center; /* 메뉴 리스트를 중앙에 배치 */
}

.menu-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    background-color: #ffffff; /* 메뉴 항목 흰색 */
    border: 1px solid #ddd;
    border-radius: 8px;
    color: black;
    text-decoration: none; /* 링크 밑줄 제거 */
    transition: background-color 0.2s;
}

.menu-item:hover {
    background-color: #f0f0f0; /* 호버 시 배경색 변경 */
}

.menu-item span {
    display: flex;
    align-items: center;
}

.menu-item span img {
    margin-right: 10px; /* 아이콘과 글자 사이 여백 */
}

.menu-item span:last-child {
    color: #999;
}

/* Menu Overlay */
.menu-overlay {
    position: absolute;
    left: 0;
    width: 100%;
    background-color: rgba(249, 249, 249, 0.95); /* 불투명한 배경 */
    z-index: 1000;
    display: none;
    padding: 20px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.menu-overlay.active {
    display: block;
}

.menu-close {
    position: absolute;
    top: 10px;
    right: 20px;
    background: none;
    border: none;
    font-size: 20px;
    cursor: pointer;
    color: #666;
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
    color: #333; /* 호버 시 색상 변경 */
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
        <button class="menu-button" id="menu-toggle">MENU</button>

        <h1 class="page-title">내 정보 관리</h1>
		<div class="menu-list">
		    <a href="${pageContext.request.contextPath}/myPage.me" class="menu-item">
		        <span>
		            <img src="resources/images/mypage.png" style="width: 25px; height: 25px; margin-right: 10px;">
		            회원정보 변경
		        </span>
		        <span>›</span>
		    </a>
		    <a href="${pageContext.request.contextPath}/PwdChange.me" class="menu-item">
		        <span>
		     	   <img src="resources/images/changepwd.png" style="width: 25px; height: 25px; margin-right: 10px;">
		        	비밀번호 변경
		       	</span>
		        <span>›</span>
		    </a>
		    <a href="${pageContext.request.contextPath}/idDelete.me" class="menu-item">
		        <span>
		        	<img src="resources/images/deleteid.png" style="width: 25px; height: 25px; margin-right: 10px;">	
			   	    회원탈퇴 안내
		        </span>
		        <span>›</span>
		    </a>
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
            <a href="#" class="menu-section-item">강습 예약 게시판</a>            
        </div>
        </div>
    </div>
    
    

    <script>
        // Menu toggle functionality
const menuButton = document.getElementById('menu-toggle');
const overlay = document.querySelector('.menu-overlay');

// 메뉴 버튼 클릭 이벤트
menuButton.addEventListener('click', function () {
    const rect = menuButton.getBoundingClientRect();
    overlay.style.top = rect.bottom + 'px'; // 메뉴 버튼의 아래에서 시작
    
    // 메뉴 오버레이 토글
    overlay.classList.toggle('active');
    menuButton.classList.toggle('active'); // 버튼에 active 클래스 추가/제거
});



    </script>
    
    <jsp:include page="../common/footer.jsp" />
</body>

</html>
