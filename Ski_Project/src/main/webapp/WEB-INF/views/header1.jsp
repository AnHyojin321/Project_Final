<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Menu Screen</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
  <style>
    body {
      margin: 0;
      padding: 0;
      background: linear-gradient(135deg, #1a1a1a, #333);
      font-family: 'Arial', sans-serif;
      color: #fff;
      display: flex;
      flex-direction: column;
      height: 100vh;
      overflow: hidden;
    }

    .menu-container {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: flex-start;
      padding: 20px;
    }

      .logo {
      position: relative;
      margin-bottom: 350px;
      right:400px;
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

    @keyframes fadeInLogo {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    @keyframes glow {
      from {
        text-shadow: 0 0 5px #ffcc00, 0 0 10px #4a90e2, 0 0 15px #4a90e2;
      }
      to {
        text-shadow: 0 0 20px #ffcc00, 0 0 30px #4a90e2, 0 0 40px #4a90e2;
      }
    }
    .main-menu ul {
          position: relative;
    
      list-style: none;
      padding: 0;
      margin: 0;
      display: flex;
      bottom:200px;
      right:150px;
      flex-direction: column;
      gap: 15px;
    }

    .main-menu ul li {
      font-size: 28px;
      font-weight: bold;
      color: #aaa;
      cursor: pointer;
      transition: color 0.3s, transform 0.3s;
      position: relative;
    }

    .main-menu ul li:hover {
      color: #74b9ff;
      transform: scale(1.1);
    }

      .sub-menu {
        position: absolute;
        top: 200px;
        left:300px; /* 메인 메뉴 오른쪽에 나타나도록 */
        display: none;
        flex-direction: row; /* 가로로 정렬 */
        flex-wrap: nowrap; /* 줄바꿈 방지 */
        gap: 20px; /* 항목 간 간격 */
        background: rgba(0, 0, 0, 0.8);
        padding: 10px 15px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    }

     .sub-menu ul {
        display: flex; /* 가로 정렬 */
        flex-direction: row; /* 항목 가로 배치 */
        list-style: none;
        padding: 0;
        margin: 0;
        gap: 15px; /* 서브 메뉴 간 간격 */
    }

     .sub-menu ul li {
        font-size: 20px;
        color: #ddd;
        cursor: pointer;
        transition: color 0.3s, transform 0.3s;
    }

     .sub-menu ul li:hover {
        color: #74b9ff;
        transform: translateY(-5px); /* 살짝 올라가는 효과 */
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(-20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</head>
<body>

  <div class="menu-container">
    <div class="logo">
      <span>[Adventure]</span>
      <p>Explore the possibilities...</p>
    </div>
    <div class="main-menu">
      <ul>
        <li onclick="location.href='${pageContext.request.contextPath}'">처음으로</li>
        <li data-menu="purchase">이용하기
          <div class="sub-menu" id="purchase">
            <ul>
              <li onclick="location.href='${pageContext.request.contextPath}/list.le'">강습 예약</li>
              <li onclick="location.href='${pageContext.request.contextPath}/locker'">락커 구매</li>
              <li onclick="location.href='${pageContext.request.contextPath}/list.pk'">패키지 구매</li>
              <li onclick="location.href='${pageContext.request.contextPath}/liftList.li'">리프트권 구매</li>
              <li onclick="location.href='${pageContext.request.contextPath}/list.ro'">객실 예약</li>
            </ul>
          </div>
        </li>
        <li data-menu="board">게시판
          <div class="sub-menu" id="board">
            <ul>
              <li onclick="location.href='${pageContext.request.contextPath}/lostList'">분실물</li>
              <li onclick="location.href='${pageContext.request.contextPath}/noticeList'">공지사항</li>
            </ul>
          </div>
        </li>
        <li data-menu="account">내 계정
          <div class="sub-menu" id="account">
            <ul>
              <li onclick="location.href='${pageContext.request.contextPath}/myPage.me'">마이페이지</li>
             <li onclick="location.href='${pageContext.request.contextPath}/login.me'">로그인</li>
              <li onclick="location.href='${pageContext.request.contextPath}/logout.me'">로그아웃</li>
            </ul>
          </div>
        </li>
      </ul>
    </div>
  </div>

  <script>
    const mainMenuItems = document.querySelectorAll('.main-menu ul li');

    mainMenuItems.forEach(item => {
      const subMenu = item.querySelector('.sub-menu');

      item.addEventListener('click', () => {
        if (subMenu.style.display === 'flex') {
          // 서브 메뉴가 열려 있다면 닫기
          gsap.to(subMenu, {
            opacity: 0,
            x: -10,
            duration: 0.3,
            onComplete: () => (subMenu.style.display = 'none'),
          });
        } else {
          // 다른 서브 메뉴 닫기
          document.querySelectorAll('.sub-menu').forEach(menu => {
            if (menu !== subMenu && menu.style.display === 'flex') {
              gsap.to(menu, {
                opacity: 0,
                x: -10,
                duration: 0.3,
                onComplete: () => (menu.style.display = 'none'),
              });
            }
          });

          // 서브 메뉴 열기
          subMenu.style.display = 'flex';
          gsap.fromTo(subMenu, { opacity: 0, x: -10 }, { opacity: 1, x: 0, duration: 0.3 });
        }
      });
    });
  </script>
</body>
</html>


