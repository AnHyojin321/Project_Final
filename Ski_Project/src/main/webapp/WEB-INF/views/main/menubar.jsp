<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Menu Screen</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      background-color: #1a1a1a;
      font-family: Arial, sans-serif;
      color: #fff;
      display: flex;
      flex-direction: column;
      height: 100vh;
    }

    .menu-container {
      position: fixed; /* 화면에 고정 */
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      background: rgba(0, 0, 0, 0.8); /* 메뉴 배경 */
      opacity: 0; /* 처음에 메뉴는 안 보이게 */
      pointer-events: none; /* 클릭 불가능 */
      transition: opacity 0.5s; /* 투명도 애니메이션 */
      z-index: 1000; /* 메인 컨텐츠보다 위에 표시되도록 */
    }

    .main-menu, .sub-menu {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin: 0 30px;
    }

    .logo {
      position: absolute;
      top: 40px;
      left: 60px;
      text-align: left;
      opacity: 0; /* 초기 투명도 */
      transition: opacity 0.5s; /* 투명도 애니메이션 */
    }

    .logo span {
      font-size: 36px;
      color: #999;
    }

    .logo p {
      font-size: 14px;
      margin-top: 5px;
      color: #999;
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
      color: #444;
      margin: 10px 0;
      transition: color 0.3s;
    }

    .main-menu ul li:hover {
      color: #fff;
    }

    .sub-menu ul li {
      font-size: 18px;
      color: #999;
      margin: 5px 0;
      transition: color 0.3s;
    }

    .sub-menu ul li:hover {
      color: #fff;
    }

    footer {
      text-align: center;
      font-size: 12px;
      color: #666;
      margin-top: 20px;
      opacity: 0; /* 초기 투명도 */
      transition: opacity 0.5s;
    }

    .close-button {
      position: absolute;
      top: 20px;
      right: 20px;
      background: none;
      border: none;
      color: #fff;
      font-size: 24px;
      cursor: pointer;
      opacity: 0; /* 처음에 보이지 않게 */
      pointer-events: none; /* 클릭 불가능 */
      transition: opacity 0.5s;
    }

    .close-button:hover {
      color: #999;
    }

    .menu {
      width: 70px;
      position: absolute;
      top: 20px;
      right: 20px;
      cursor: pointer;
      display: block; /* 메뉴바 이미지는 항상 보임 */
      z-index: 1001; /* 메뉴 버튼을 메뉴 컨테이너 위에 표시 */
    }
  </style>
</head>
<body>
  <!-- 메뉴바 이미지 -->
  <img class="menu" src="resource/menu.png" alt="Menu Bar">

  <!-- 메뉴 컨테이너 -->
  <div class="menu-container">
    <div class="logo">
      <span>[Adv:nture]</span>
      <p>Soul spirit SKI...</p>
    </div>
    <div class="main-menu">
      <ul>
        <li>Home</li>
        <li>About Us</li>
        <li>Works</li>
        <li>Partner</li>
      </ul>
    </div>
    <div class="sub-menu">
      <ul>
        <li>Project Request</li>
        <li>Contact</li>
        <li>Threeway Homepage</li>
        <li>Company Brochure</li>
        <li>Intranet</li>
        <li>Extranet</li>
      </ul>
    </div>
  </div>

  <!-- Footer -->
  <footer>
    <p>&copy; THREEWAY CO., LTD. ALL RIGHT RESERVED.</p>
  </footer>

  <!-- 닫기 버튼 -->
  <button class="close-button">X</button>

  <script>
    // 요소 가져오기
    const menuButton = document.querySelector('.menu');
    const closeButton = document.querySelector('.close-button');
    const menuContainer = document.querySelector('.menu-container');
    const logo = document.querySelector('.logo');
    const footer = document.querySelector('footer');

    // 메뉴바 클릭 시
    menuButton.addEventListener('click', () => {
      menuContainer.style.opacity = '1'; // 메뉴 컨테이너 보이기
      menuContainer.style.pointerEvents = 'auto'; // 클릭 가능
      logo.style.opacity = '1'; // 로고 보이기
      footer.style.opacity = '1'; // 푸터 보이기
      closeButton.style.opacity = '1'; // 닫기 버튼 보이기
      closeButton.style.pointerEvents = 'auto'; // 클릭 가능
      menuButton.style.display = 'none'; // 메뉴바 숨기기
    });

    // 닫기 버튼 클릭 시
    closeButton.addEventListener('click', () => {
      menuContainer.style.opacity = '0'; // 메뉴 컨테이너 숨기기
      menuContainer.style.pointerEvents = 'none'; // 클릭 불가능
      logo.style.opacity = '0'; // 로고 숨기기
      footer.style.opacity = '0'; // 푸터 숨기기
      closeButton.style.opacity = '0'; // 닫기 버튼 숨기기
      closeButton.style.pointerEvents = 'none'; // 클릭 불가능
      menuButton.style.display = 'block'; // 메뉴바 보이기
    });
  </script>
</body>
</html>
