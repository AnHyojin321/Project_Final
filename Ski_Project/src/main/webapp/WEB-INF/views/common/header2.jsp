<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Stylish Menu Toggle</title>
<style>
    /* Reset */
    body, html {
        margin: 0;
        padding: 0;
        font-family: 'Arial', sans-serif;
        box-sizing: border-box;
    }

    /* 헤더 스타일 */
    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px 40px;
        background: linear-gradient(to right, #0B3E74, #1e2a50);
        color: white;
        height: 40px;
    }

    .header-left {
        display: flex;
        flex-direction: column;
    }

    .brand-title {
        font-size: 1.5rem;
        font-weight: bold;
        margin: 0;
    }

    .brand-subtitle {
        font-size: 0.9rem;
        margin: 5px 0 0;
        opacity: 0.8;
    }

    .header-right {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    /* 문의 버튼 스타일 */
    .btn-contact {
        display: flex;
        align-items: center;
        background-color: #0B3E74;
        color: white;
        padding: 8px 16px;
        border: none;
        border-radius: 10px;
        font-size: 0.9rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn-contact:hover {
        background-color: #06264b;
    }

    .btn-contact .icon {
        width: 16px;
        height: 16px;
        margin-right: 8px;
    }

    .menu-icon {
        position: relative;
        text-align: center;
        font-size: 1rem;
        font-weight: bold;
        color: white;
        cursor: pointer;
    }

    .menu-icon span {
        font-size: 13px;
        display: block;
        margin-top: 40px;
    }

    .menu-icon::before {
        content: "";
        position: absolute;
        top: -15px;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 60px;
        background-image: url('../resources/images/menu.png');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    /* 원형 오버레이 */
    .circle-overlay {
        position: fixed;
        top: 50%;
        left: 50%;
        width: 0;
        height: 0;
        background: radial-gradient(circle, #0B3E74, #1e2a50);
        border-radius: 50%;
        transform: translate(-50%, -50%);
        z-index: 1000;
        pointer-events: none;
        box-shadow: 0 0 15px rgba(255, 255, 255, 0.5), 0 0 30px rgba(0, 0, 0, 0.7);
    }

    /* 메뉴 콘텐츠 */
    .menu-overlay-content {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        color: white;
        z-index: 1001;
        opacity: 0.9;
    }

    .menu-overlay-content.active {
        display: flex;
    }

    .menu-container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-grow: 2;
    }

    .main-menu ul,
    .sub-menu ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .main-menu ul li {
        font-size: 48px;
        font-weight: bold;
        color: #f2f2f2;
        margin: 10px 0;
        text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.8);
        transition: all 0.3s ease-in-out;
    }

    .main-menu ul li:hover {
        color: #fff;
        transform: scale(1.1);
        text-shadow: 0 0 10px rgba(255, 255, 255, 1);
    }

    .sub-menu ul li {
        font-size: 18px;
        color: #ccc;
        margin: 5px 0;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);
        transition: all 0.3s ease-in-out;
    }

    .sub-menu ul li:hover {
        color: #fff;
        transform: scale(1.05);
        text-shadow: 0 0 5px rgba(255, 255, 255, 0.7);
    }

    .menu-close {
        position: absolute;
        top: 20px;
        right: 20px;
        font-size: 24px;
        cursor: pointer;
        color: #f2f2f2;
        transition: transform 0.2s, color 0.3s;
    }

    .menu-close:hover {
        transform: scale(1.2);
        color: #f00;
    }
</style>
</head>
<body>
<c:if test="${not empty sessionScope.alertMsg}">
    <script>
        alert("${sessionScope.alertMsg}");
    </script>
    <c:remove var="alertMsg" scope="session" />
</c:if>
    <!-- 헤더 -->
    <header class="header">
        <div class="header-left">
            <p class="brand-title">[Adv:nture]</p>
            <p class="brand-subtitle">MAKE YOUR</p>
        </div>
        <div class="header-right">
            <button class="btn-contact">
                <img src="../resources/images/question.png" alt="돋보기 아이콘" class="icon"> 문의하기
            </button>
            <div class="menu-icon" id="menuIcon">
                <span>&nbsp;&nbsp;&nbsp;MENU</span>
            </div>
        </div>
    </header>

    <!-- 원형 오버레이 -->
    <div class="circle-overlay" id="circleOverlay"></div>

    <!-- 메뉴 콘텐츠 -->
    <div class="menu-overlay-content" id="menuOverlayContent">
        <div class="menu-close" id="menuClose">&times;</div>
        <div class="menu-container">
            <div class="main-menu">
                <ul>
		<li onclick="location.href='${pageContext.request.contextPath}'">HOME</li>
                    <li>About</li>
                    <li>Works</li>
                    <li>Partner</li>
                </ul>
            </div>
            <div class="sub-menu">
                <ul>
					<li onclick="location.href='${pageContext.request.contextPath}/list.le'">강습예약</li>
                    <li onclick="location.href='${pageContext.request.contextPath}/lostList'">분실물</li>
                    <li onclick="location.href='${pageContext.request.contextPath}/noticeList'">공지사항</li>
                    <li onclick="location.href='${pageContext.request.contextPath}/locker'">락커예약</li>
                    <c:if test="${not empty sessionScope.loginMember}">
                        <li onclick="location.href='${pageContext.request.contextPath}/myPage.me'">마이페이지</li>
                        <li onclick="location.href='${pageContext.request.contextPath}/logout.me'">로그아웃</li>
                    </c:if>
                    <c:if test="${empty sessionScope.loginMember}">
                        <li onclick="location.href='${pageContext.request.contextPath}/login.me'">로그인</li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <script>
    const menuIcon = document.getElementById('menuIcon');
    const circleOverlay = document.getElementById('circleOverlay');
    const menuOverlayContent = document.getElementById('menuOverlayContent');
    const menuClose = document.getElementById('menuClose');

    let snowflakeInterval;

    // 눈송이 생성 함수
    function createSnowflake() {
        const snowflake = document.createElement('div');
        snowflake.classList.add('snowflake');
        menuOverlayContent.appendChild(snowflake); // 메뉴 콘텐츠 내부에 추가

        const size = Math.random() * 10 + 5; // 눈송이 크기
        const startX = Math.random() * menuOverlayContent.clientWidth * 2 - menuOverlayContent.clientWidth; 
        // 오버레이 너비의 2배를 기준으로 왼쪽(-)부터 오른쪽(+)까지 랜덤 시작
        const endX = startX + Math.random() * 100 - 50; // 약간의 x축 흔들림
        const duration = Math.random() * 3 + 5; // 눈송이 떨어지는 시간

        gsap.set(snowflake, {
            x: startX,
            y: 0, // 화면 위쪽에서 시작
            width: size,
            height: size,
            backgroundColor: 'white',
            borderRadius: '50%',
            opacity: Math.random() + 0.3 // 약간 투명
        });

        gsap.to(snowflake, {
            x: endX, // x축 흔들림 적용
            y: menuOverlayContent.clientHeight, // 콘텐츠 높이 기준으로 떨어짐
            duration: duration,
            ease: 'none',
            onComplete: () => {
                snowflake.remove(); // 화면 밖으로 나가면 제거
            }
        });
    }

    // 눈보라 효과 시작
    function startSnow() {
        snowflakeInterval = setInterval(createSnowflake, 150); // 150ms 간격으로 눈송이 생성
    }

    // 눈보라 효과 정지
    function stopSnow() {
        clearInterval(snowflakeInterval);
        const snowflakes = menuOverlayContent.querySelectorAll('.snowflake');
        snowflakes.forEach(snowflake => snowflake.remove()); // 기존 눈송이 제거
    }

    // 메뉴 열기 애니메이션
    menuIcon.addEventListener('click', () => {
        menuOverlayContent.style.display = 'flex';
        gsap.timeline()
            .to(circleOverlay, {
                width: "2000px",
                height: "2000px",
                duration: 0.8,
                ease: "power2.inOut",
                onComplete: startSnow // 눈보라 효과 시작
            })
            .to(menuOverlayContent, {
                opacity: 1,
                duration: 0.4,
                ease: "power2.out"
            }, "-=0.4");
    });

    // 메뉴 닫기 애니메이션
    menuClose.addEventListener('click', () => {
        gsap.timeline()
            .to(menuOverlayContent, {
                opacity: 0,
                duration: 0.4,
                ease: "power2.in",
                onComplete: stopSnow // 눈보라 효과 정지
            })
            .to(circleOverlay, {
                width: "0px",
                height: "0px",
                duration: 0.8,
                ease: "power2.inOut"
            }, "-=0.4")
            .set(menuOverlayContent, { display: "none" });
    });



    </script>
</body>
</html>