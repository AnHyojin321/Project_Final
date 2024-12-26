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
      background: linear-gradient(120deg, #1a1a1a, #333);
      font-family: 'Arial', sans-serif;
      color: #fff;
      display: flex;
      flex-direction: column;
      height: 100vh;
      overflow: hidden;
    }

    .menu-container {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-grow: 1;
      position: relative;
    }

    .logo {
      position: absolute;
      top: 15%;
      text-align: center;
      width: 100%;
      opacity: 0;
    }

    .logo span {
      font-size: 48px;
      color: #85caed;
      font-weight: bold;
      letter-spacing: 5px;
      text-shadow: 2px 2px 10px rgba(0, 255, 255, 0.6);
    }

    .logo p {
      font-size: 18px;
      margin-top: 10px;
      color: #ddd;
      font-style: italic;
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
      color: #bbb;
      margin: 20px 0;
      cursor: pointer;
      transform: translateY(50px);
      opacity: 0;
      transition: color 0.3s ease-in-out, transform 0.3s ease-in-out;
    }

    .main-menu ul li:hover,
    .sub-menu ul li:hover {
      color: #85caed;
      text-shadow: 0 0 10px rgba(0, 255, 255, 0.8);
    }

    .sub-menu ul li {
      font-size: 20px;
      font-weight: normal;
    }

    /* 배경 애니메이션 */
    .background {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: -1;
      background: linear-gradient(120deg, #1a1a1a, #333);
      overflow: hidden;
    }

    .background .circle {
      position: absolute;
      border-radius: 50%;
      opacity: 0.7;
      animation: float 10s infinite ease-in-out;
    }

    @keyframes float {
      0% {
        transform: translateY(0) scale(1);
        opacity: 0.7;
      }
      50% {
        transform: translateY(-20px) scale(1.2);
        opacity: 1;
      }
      100% {
        transform: translateY(0) scale(1);
        opacity: 0.7;
      }
    }
  </style>
</head>
<body>
  <div class="background">
    <!-- 부드러운 원형 애니메이션 -->
    <div class="circle" style="width: 200px; height: 200px; background: rgba(255, 255, 255, 0.1); top: 10%; left: 15%;"></div>
    <div class="circle" style="width: 300px; height: 300px; background: rgba(255, 255, 255, 0.2); top: 30%; left: 50%;"></div>
    <div class="circle" style="width: 150px; height: 150px; background: rgba(255, 255, 255, 0.05); top: 60%; left: 20%;"></div>
  </div>

  <div class="menu-container">
    <div class="logo">
      <span>[Adventure]</span>
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
      const logo = document.querySelector('.logo');
      const mainMenuItems = document.querySelectorAll('.main-menu ul li');
      const subMenuItems = document.querySelectorAll('.sub-menu ul li');

      // 로고 애니메이션
      gsap.fromTo(
        logo,
        { opacity: 0, y: -50 },
        { opacity: 1, y: 0, duration: 1.5, ease: 'power3.out' }
      );

      // 메인 메뉴 애니메이션
      gsap.to(mainMenuItems, {
        opacity: 1,
        y: 0,
        stagger: 0.3,
        duration: 1.5,
        ease: 'power3.out',
        delay: 0.5,
      });

      // 서브 메뉴 애니메이션
      gsap.to(subMenuItems, {
        opacity: 1,
        y: 0,
        stagger: 0.3,
        duration: 1.5,
        ease: 'power3.out',
        delay: 1,
      });
    };
  </script>
</body>
</html>
