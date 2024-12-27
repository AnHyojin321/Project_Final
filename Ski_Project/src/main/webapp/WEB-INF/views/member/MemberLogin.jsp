<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .snowflake {
            position: absolute;
            top: -10px;
            color: white;
            font-size: 1rem;
            pointer-events: none; /* 마우스 이벤트 방지 */
            animation: fall linear infinite; /* 애니메이션 효과 */
        }

        @keyframes fall {
            0% {
                transform: translateY(0); /* 시작 위치 */
                opacity: 1;
            }
            100% {
                transform: translateY(110vh); /* 화면 아래로 이동 */
                opacity: 0; /* 점점 투명해짐 */
            }
        }
        body {
            font-family: Arial, sans-serif;
            overflow: hidden; /* 스크롤 방지 */
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .left {
            width: 50%;
            background-color: #004AAD; /* 파란색 배경 */
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .left h1 {
            font-size: 3rem; /* 큰 글씨 크기 */
            font-weight: bold; /* 굵은 글씨 */
            letter-spacing: 5px; /* 글자 간격 */
            margin-bottom: 1rem;
        }

        .left h2 {
            font-size: 2rem;
            font-weight: 500; /* 중간 굵기 */
            letter-spacing: 2px;
        }

        .left p {
            font-size: 1.2rem;
            font-style: italic; /* 이탤릭체 */
        }

        .background-circle {
            position: absolute;
            width: 60px; /* 원의 크기 */
            height: 60px;
            background-color: rgba(255, 255, 255, 0.1); /* 반투명 흰색 */
            border-radius: 50%; /* 원 모양 */
            top: 70%;
            left: 65%;
            transform: translate(-50%, -50%);
            z-index: 0; /* 텍스트 뒤로 배치 */
        }

        #top1 {
            position: absolute;
            top: 20px;
            color: white;
            left: 20px; /* 왼쪽 상단에 위치 */
            font-weight: 500; /* 글씨 두께 */
        }

        #top1 p {
            margin: 0;
            font-size: 18px;
        }

        .right {
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f4f4f4;
            position: relative;
        }

        .login-form {
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.9);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }

        .login-form h1 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
            text-align: center;
        }

        .login-form input {
            width: 90%;
            max-width: 400px;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .login-form button {
            width: 90%;
            max-width: 400px;
            padding: 10px;
            background-color: #004AAD;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-form button:hover {
            background-color: #003580;
        }

        .social-login {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 15px;
            width: 90%;
            max-width: 400px;
        }

        .social-login button {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        .social-login button.kakao {
            background-color: #fee500;
            color: black;
        }

        .social-login button.google {
            background-color: #db4437;
            color: white;
        }

        .social-login button img {
            width: 20px;
            height: 20px;
        }

        .links {
            text-align: center;
            margin-top: 15px;
        }

        .links a {
            text-decoration: none;
            font-size: 14px;
            color: #004AAD;
        }

        .links a:hover {
            text-decoration: underline;
        }
        /* 모달 배경 */
.modal {
    display: none; /* 초기에는 숨김 */
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    display: flex;
    justify-content: center;
    align-items: center;
}
    
    </style>
        
    <!-- Alertify 라이브러리 연동 구문 (CDN) -->
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
</head>
<body>
    <div class="container">
        <!-- Left Section -->
        <div class="left">
            <img src="resources/images/logo.png" style="width: 300px; height: 200px;">
            <div id="top1">
                <p>[Adv:nture]</p>
                <p>MAKE YOUR</p>
            </div>
            <h1>SEOLLEENUN</h1>
            <h2>SKI & RESORT</h2>
            <p>Premium Adventure Shop</p>
            <div class="background-circle"></div>
        </div>


        <!-- Right Section -->
        <div class="right">
            <form method="post" class="login-form" action="login.me">
                <h1>로그인</h1>
                <input type="text" id="memberId" name="memberId" placeholder="아이디" required>
                <input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호" required>
                <button type="submit">로그인</button>
				<div class="social-login">
				    <!-- 카카오 로그인 버튼 -->
<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id={클라이언트id}&redirect_uri=http://localhost:8090/ski/kakao/callback">
    <img src="resources/images/kakao_login_img.png" alt="카카오 로그인" style="width: 195px; height: 40px;">
</a>


<!-- 네이버 로그인 버튼 -->
<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id={네이버클라이언트id}&state=STATE_STRING&redirect_uri=http://localhost:8090/ski/naver/callback">
    <img src="resources/images/btnG_완성형.png" alt="네이버 로그인" style="width: 195px; height: 40px;">
</a>
				</div>

                <div class="links">
                    <a href="${pageContext.request.contextPath}/findId.me">아이디 찾기</a> | 
                    <a href="${ pageContext.request.contextPath }/findPwd.me">비밀번호 찾기</a> | 
                    <a href="${ pageContext.request.contextPath }/enrollForm.me">회원가입</a>
                </div>
            </form>
        </div>
    </div>
    

<c:if test="${not empty sessionScope.alertMsg}">
    <script>
        alert("${sessionScope.alertMsg}");
    </script>
    <%
        // alertMsg 출력 후 세션에서 삭제
        session.removeAttribute("alertMsg");
    %>
</c:if>



    
    <script>
        function createSnowflake() {
            var snowflake = document.createElement('div');
            snowflake.classList.add('snowflake');
            snowflake.textContent = '❄'; // 눈송이 모양
            snowflake.style.left = Math.random() * 100 + 'vw'; // 랜덤 위치
            snowflake.style.animationDuration = (15 + Math.random() * 15) + 's'; // 애니메이션 속도
            snowflake.style.fontSize = (10 + Math.random() * 10) + 'px'; // 눈송이 크기
            document.body.appendChild(snowflake);

            snowflake.addEventListener('animationend', function() {
                snowflake.remove();
            });

            setTimeout(createSnowflake, 1000); // 눈송이 생성 간격
        }

        createSnowflake();
        
    </script>
</body>
</html>
