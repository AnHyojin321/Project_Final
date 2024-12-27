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
     body, html {
        margin: 0;
        padding: 0;
        font-family: 'Arial', sans-serif;
        box-sizing: border-box;
    }

   header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px 40px;
        background: linear-gradient(to bottom, #2a2a72, #304987); /* 푸터와 일관된 그라데이션 */
        color: #f9f9f9; /* 밝은 텍스트 */
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2); /* 더 부드러운 그림자 */
        top: 0;
        z-index: 1000;
    }

    /* 왼쪽 타이틀 */
    .header-left {
        display: flex;
        flex-direction: column;
    }

    .brand-title {
        font-size: 1.8rem;
        font-weight: bold;
        margin: 0;
        color: #85caed; /* 푸른 계열로 통일 */
        text-shadow: 2px 2px 5px rgba(255, 255, 255, 0.6); /* 밝은 그림자 */
    }

      .brand-subtitle {
        font-size: 1rem;
        margin: 5px 0 0;
        opacity: 0.9;
        color: #b3d9f9; /* 밝은 하늘색으로 강조 */
        text-shadow: 1px 1px 3px rgba(255, 255, 255, 0.6);
    }

     /* 오른쪽 버튼 및 메뉴 */
    .header-right {
        display: flex;
        align-items: center;
        gap: 20px;
    }
   .btn-contact {
        display: flex;
        align-items: center;
        background: linear-gradient(to right, #85caed, #b3d9f9); /* 연한 푸른 계열 그라데이션 */
        color: #2a2a72; /* 텍스트 대비 효과 */
        padding: 10px 20px;
        border: none;
        border-radius: 50px;
        font-size: 0.9rem;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
    }


      .btn-contact:hover {
        background: linear-gradient(to right, #b3d9f9, #85caed); /* 호버 시 색상 반전 */
        transform: translateY(-2px);
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
    }


        .btn-contact #custom-kakao-channel-button {
        width: 20px;
        height: 20px;
        margin-right: 8px;
    }

         .menu-icon {
        position: relative;
        text-align: center;
        font-size: 1rem;
        font-weight: bold;
        color: #f9f9f9;
        cursor: pointer;
        transition: transform 0.3s ease;
    }
	   .menu-icon:hover {
        transform: scale(1.1);
    }

	
       .menu-icon span {
        font-size: 14px;
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
        background-image: url('resources/images/menu.png');
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
        right:50px;
                position: relative;
    }

    .main-menu ul li {
        font-size: 38px;
        font-weight: bold;
        color: #f2f2f2;
        right:50px;
                position: relative;
        
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
        font-size: 25px;
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
        top: 120px;
        right: 300px;
        font-size: 44px;
        cursor: pointer;
        color: #f2f2f2;
        transition: transform 0.2s, color 0.3s;
    }

    .menu-close:hover {
        transform: scale(1.2);
        color: #f00;
    }
    
     .sub-menu {
        display: none; /* 초기 상태에서 서브 메뉴 숨김 */
        opacity: 0; /* 부드러운 전환을 위해 투명도 설정 */
        transition: opacity 0.3s ease; /* 전환 효과 */
    }
    
     /* 바운스와 정지 포함 애니메이션 */
    @keyframes bounce-fade-pause {
        0%, 20% {
            transform: translateY(0);
            opacity: 1;
        }
        10% {
            transform: translateY(-10px); /* 바운스 효과 */
        }
        50% {
            transform: rotate(360deg); /* 회전하며 사라짐 */
            opacity: 0;
        }
        70%, 100% {
            transform: translateY(0);
            opacity: 1; /* 다시 나타난 상태로 정지 */
        }
    }

    /* 기본 스타일 */
    .header-left {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
    }

    /* 글자 개별 애니메이션 */
    .brand-title span,
    .brand-subtitle span {
        display: inline-block;
        animation: bounce-fade-pause 7s ease-in-out infinite; /* 애니메이션 주기 5초 */
        opacity: 0;
    }

    .brand-title span:nth-child(1) { animation-delay: 0s; }
    .brand-title span:nth-child(2) { animation-delay: 0.2s; }
    .brand-title span:nth-child(3) { animation-delay: 0.4s; }
    .brand-title span:nth-child(4) { animation-delay: 0.6s; }
    .brand-title span:nth-child(5) { animation-delay: 0.8s; }
    .brand-title span:nth-child(6) { animation-delay: 1s; }

    .brand-subtitle span:nth-child(1) { animation-delay: 1.2s; }
    .brand-subtitle span:nth-child(2) { animation-delay: 1.4s; }
    .brand-subtitle span:nth-child(3) { animation-delay: 1.6s; }
    .brand-subtitle span:nth-child(4) { animation-delay: 1.8s; }
    .brand-subtitle span:nth-child(5) { animation-delay: 2s; }
    .brand-subtitle span:nth-child(6) { animation-delay: 2.2s; }
    .brand-subtitle span:nth-child(7) { animation-delay: 2.4s; }
    .brand-subtitle span:nth-child(8) { animation-delay: 2.6s; }
    .brand-subtitle span:nth-child(9) { animation-delay: 2.8s; }
    .brand-subtitle span:nth-child(10) { animation-delay: 3s; }
    
    
    
 .ski-animation {
    position: absolute;
    top: 50px;
    left: 120px;
    width: 20px;
    height: 20px;
    z-index: 3; /* 텍스트 아래로 배치 */
}

.ski-icon {
    width: 60px; /* 애니메이션 크기 */
    position: absolute;
    left: -100px; /* 화면 왼쪽 밖에서 시작 */
    animation: skiMove 6s linear infinite; /* 5초 동안 무한 반복 */
    opacity: 0.8; /* 텍스트와 자연스럽게 겹치기 위해 약간 투명 */
}

/* 스키 애니메이션 이동 */
@keyframes skiMove {
    0% {
        left: -100px; /* 화면 왼쪽 밖 */
    }
    100% {
        left: 120%; /* 화면 오른쪽 밖 */
    }
}

.logo {
      position: relative;
      top: 100px;
      right:500px;
      text-align: left;
      animation: fadeInLogo 2s ease-in-out;
    }

    .logo span {
      font-size: 40px;
      font-weight: bold;
      color: #4a90e2;
      letter-spacing: 4px;
      text-shadow: 3px 3px 10px rgba(255, 204, 0, 0.7);
      animation: glow 1.5s ease-in-out infinite alternate;
    }

    .logo p {
      font-size: 18px;
      margin-top: 5px;
      color: #ccc;
      letter-spacing: 1px;
      text-shadow: 2px 2px 5px rgba(255, 255, 255, 0.2);
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
    <!-- 개별 글자에 span 태그 적용 -->
    <p class="brand-title">
    <span>설</span><span>레</span><span>눈</span> <span>리</span><span>조</span><span>트</span>
</p>
<p class="brand-subtitle">
    <span>눈</span><span>과</span><span> 함</span><span>께</span> <span>시</span><span>작</span><span>되</span><span>는</span> <span>행</span><span>복</span>
</p>
<div class="ski-animation">
<img src="/ski/resources/images/iceski.gif" alt="스키 타는 애니메이션" class="ski-icon">
    </div>
</div>


        <div class="header-right">
            <button class="btn-contact">
                <img src="resources/images/question.png" alt="돋보기 아이콘" id="custom-kakao-channel-button"> 문의하기
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
        <div class="logo">
      <span>[Adventure]</span>
      <p>Explore the possibilities...</p>
    </div>
    <div class="menu-container">
    <div class="main-menu">
        <ul>
                <li onclick="location.href='${pageContext.request.contextPath}'">처음으로</li>
            <li data-menu="use">이용하기</li>
            <li data-menu="board">게시판</li>
            <li data-menu="info">내 정보</li>
        </ul>
    </div>
    <div class="sub-menu" id="use">
        <ul>
            <li onclick="location.href='${pageContext.request.contextPath}/list.le'">강습 예약</li>
              <li onclick="location.href='${pageContext.request.contextPath}/locker'">락커 구매</li>
              <li onclick="location.href='${pageContext.request.contextPath}/list.pk'">패키지 구매</li>
              <li onclick="location.href='${pageContext.request.contextPath}/liftList.li'">리프트권 구매</li>
              <li onclick="location.href='${pageContext.request.contextPath}/list.ro'">객실 예약</li>
        </ul>
    </div>
    <div class="sub-menu" id="board">
        <ul>
            <li onclick="location.href='${pageContext.request.contextPath}/lostList'">분실물</li>
            <li onclick="location.href='${pageContext.request.contextPath}/noticeList'">공지사항</li>
              <li onclick="location.href='${pageContext.request.contextPath}/slopeOpen.sm'">슬로프 개장</li>
            
        </ul>
    </div>
    <div class="sub-menu" id="info">
        <ul>
            <li onclick="location.href='${pageContext.request.contextPath}/myPage.me'">마이페이지</li>
            <li onclick="location.href='${pageContext.request.contextPath}/login.me'">로그인</li>
              <li onclick="location.href='${pageContext.request.contextPath}/logout.me'">로그아웃</li>
            
        </ul>
    </div>
</div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        // 카카오 SDK 초기화
        Kakao.init('dc02060907b4ccb8c6417c5af8b8a228'); // 실제 JavaScript 키로 대체

        // 커스텀 버튼 클릭 이벤트
        const customButton = document.getElementById('custom-kakao-channel-button');
        customButton.addEventListener('click', function () {
          Kakao.Channel.addChannel({
            channelPublicId: '_PPxdxln' // 채널 고유 ID
          });
        });
      });
    
    
    
    const mainMenuItems = document.querySelectorAll('.main-menu ul li');
    const subMenus = document.querySelectorAll('.sub-menu');

    mainMenuItems.forEach(item => {
        const menuId = item.getAttribute('data-menu'); // 메인 메뉴와 연결된 서브 메뉴 ID
        const targetSubMenu = document.getElementById(menuId);

        item.addEventListener('click', () => {
            if (targetSubMenu.style.display === 'flex') {
                // 서브 메뉴가 열려 있다면 닫기
                gsap.to(targetSubMenu, {
                    opacity: 0,
                    duration: 0.3,
                    onComplete: () => (targetSubMenu.style.display = 'none'),
                });
            } else {
                // 다른 서브 메뉴 닫기
                subMenus.forEach(subMenu => {
                    if (subMenu !== targetSubMenu && subMenu.style.display === 'flex') {
                        gsap.to(subMenu, {
                            opacity: 0,
                            duration: 0.3,
                            onComplete: () => (subMenu.style.display = 'none'),
                        });
                    }
                });

                // 클릭한 서브 메뉴 열기
                targetSubMenu.style.display = 'flex';
                gsap.fromTo(
                    targetSubMenu,
                    { opacity: 0 },
                    { opacity: 1, duration: 0.3 }
                );
            }
        });
    });
    
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