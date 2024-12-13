<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      justify-content: center; /* 메뉴들을 가운데에 배치 */
      align-items: center;
      width: 100%;
      flex-grow: 1;
    }

    .main-menu, .sub-menu {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin: 0 30px; /* 좌우 메뉴 간격 설정 */
    }

    .logo {
      position: absolute;
      top: 40px;
      left: 60px;
      text-align: left;
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
      transition: color 0.3s;
    }

    .close-button:hover {
      color: #999;
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
        <li>Home</li>
        <li>About Us</li>
        <li>Works</li>
        <li>Partner</li>
      </ul>
    </div>
            <button class="close-button">X</button>
    
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
  <footer>
    <p>&copy; THREEWAY CO., LTD. ALL RIGHT RESERVED.</p>
  </footer>
  <button class="close-button">X</button>
</body>
</html>

