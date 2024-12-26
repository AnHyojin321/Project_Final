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
      width: 100%;
      flex-grow: 1;
      position: relative;
    }

    .logo {
      position: relative;
      bottom: 250px;
      transform: translateX(-50%);
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

    .main-menu ul li,
    .sub-menu ul li {
      font-size: 24px;
      font-weight: bold;
      color: #444;
      margin: 10px 0;
      cursor: pointer;
      opacity: 0;
    }

    .main-menu ul li:hover,
    .sub-menu ul li:hover {
      color: #fff;
    }

    footer {
      text-align: center;
      font-size: 12px;
      color: #666;
      margin-top: auto;
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
        <li onclick="location.href='${pageContext.request.contextPath}'">HOME</li>
        <li>About Us</li>
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

  <script>
    window.onload = function () {
      const mainMenuItems = document.querySelectorAll('.main-menu ul li');
      const subMenuItems = document.querySelectorAll('.sub-menu ul li');
      const logo = document.querySelector('.logo');

      // 로고 애니메이션
      gsap.fromTo(
        logo,
        { opacity: 0, y: -50 },
        { opacity: 1, y: 0, duration: 1, ease: 'power3.out' }
      );

      // 메인 메뉴 애니메이션
      gsap.to(mainMenuItems, {
        opacity: 1,
        x: 0,
        stagger: 0.2,
        duration: 1,
        ease: 'power3.out',
        delay: 0.5,
      });

      // 서브 메뉴 애니메이션
      gsap.to(subMenuItems, {
        opacity: 1,
        y: 0,
        stagger: 0.2,
        duration: 1,
        ease: 'power3.out',
        delay: 1.5,
      });
    };
  </script>
</body>
</html>

