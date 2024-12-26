<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      display: flex;
      justify-content: center;
      align-items: center;
      right:100px;
      width: 100%;
      flex-grow: 1;
      position: relative; /* 메뉴 컨테이너에 상대적인 위치 지정 */
    }

    .main-menu, .sub-menu {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin: 0 30px;
    }
    
    .logo {
      position: relative;
      bottom: 250px; /* 로고를 메뉴 상단으로 위치 */
      right:150px;
      transform: translateX(-50%); /* 중앙 정렬 */
      text-align: center;
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
      margin-top: 400px;
      right: 700px;
    }

    /* 메인 메뉴 애니메이션 */
    .main-menu {
      opacity: 0;
      transform: translateX(-100%);
      transition: transform 1s ease-out, opacity 1s ease-out;
    }

    .main-menu.show {
      opacity: 1;
      transform: translateX(0);
    }

    /* 서브 메뉴 애니메이션 */
    .sub-menu {
      opacity: 0;
      transform: translateY(20px);
      transition: opacity 1s ease-out, transform 1s ease-out;
    }

    .sub-menu.show {
      opacity: 1;
      transform: translateY(0);
    }

  </style>
</head>
<body>
  <div class="menu-container">
    <div class="logo">
      <span>[Adv:nture]</span>
      <p>Soul spirit SKI...</p>
    </div>
    <div class="main-menu">
      <ul>
        <li onclick="toggleSubMenu()">Home</li>
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
		<li onclick="location.href='${pageContext.request.contextPath}/lostList'">Lost</li>
		<li onclick="location.href='${pageContext.request.contextPath}/noticeList'">Notice</li>
		<li onclick="location.href='${pageContext.request.contextPath}/locker'">Locker</li>	
	    <!-- 로그인 상태 확인 -->
	    <c:if test="${not empty sessionScope.loginMember}">
	      <!-- 로그인 상태일 때 (Logout과 MyPage 보이기) -->
	      <li onclick="location.href='${pageContext.request.contextPath}/myPage.me'">MyPage</li>
	      <li onclick="location.href='${pageContext.request.contextPath}/logout.me'">Logout</li>
	    </c:if>
	    <c:if test="${empty sessionScope.loginMember}">
	      <!-- 로그인 상태가 아닐 때 (Login 보이기) -->
	      <li onclick="location.href='${pageContext.request.contextPath}/login.me'">Login</li>
	    </c:if>
	  </ul>
	</div>

  </div>

  <script>
    // 서브 메뉴 보이기/숨기기
    function toggleSubMenu() {
      const subMenu = document.querySelector('.sub-menu');
      const mainMenu = document.querySelector('.main-menu');

      // 서브 메뉴가 이미 보이고 있다면 숨기기
      if (subMenu.classList.contains('show')) {
        subMenu.classList.remove('show');
        setTimeout(() => {
          subMenu.style.display = 'none'; // 애니메이션이 끝난 후 숨김
        }, 1000); // 1초 후 서브 메뉴 숨기기
      } else {
        // 서브 메뉴가 보이지 않으면 1초 뒤에 보이게 하기
        subMenu.style.display = 'block'; // 서브 메뉴를 보이게 설정
        setTimeout(() => {
          subMenu.classList.add('show');
        }, 100); // 0.1초 뒤에 애니메이션 시작
      }
    }

    // 페이지 로드 시 애니메이션 시작
    window.onload = function() {
      const mainMenu = document.querySelector('.main-menu');
      const subMenu = document.querySelector('.sub-menu');

      setTimeout(() => {
        mainMenu.classList.add('show');
      }, 100);

      setTimeout(() => {
        subMenu.classList.add('show');
      }, 1000);
    };
  </script>
</body>
</html>
