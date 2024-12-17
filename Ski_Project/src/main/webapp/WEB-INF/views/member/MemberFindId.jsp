<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            overflow: hidden;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        /* 왼쪽 섹션 */
        .left {
            width: 50%;
            background-color: #004AAD;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .left h1 {
            font-size: 3rem;
            font-weight: bold;
            letter-spacing: 5px;
            margin-bottom: 1rem;
        }

        .left h2 {
            font-size: 2rem;
            font-weight: 500;
            letter-spacing: 2px;
        }

        /* 오른쪽 섹션 */
        .right {
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f4f4f4;
        }

        /* 폼 스타일 */
        .form-container {
            text-align: center;
            width: 100%;
            max-width: 400px;
        }

        .form-container h1 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .form-container input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-container button {
            width: 100%;
            padding: 12px;
            background-color: #004AAD;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #003580;
        }

        .links {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .links a {
            text-decoration: none;
            color: #004AAD;
        }

        .links a:hover {
            text-decoration: underline;
        }

        /* 모달 팝업 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            background: white;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 400px;
        }

        .modal-header {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .modal-body {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .modal-footer button {
            background-color: #004AAD;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-footer button:hover {
            background-color: #003580;
        }

        /* 눈송이 스타일 */
        .snowflake {
            position: absolute;
            top: -10px;
            color: white;
            font-size: 1rem;
            pointer-events: none;
            animation: fall linear infinite;
        }

        @keyframes fall {
            0% {
                transform: translateY(0);
                opacity: 1;
            }
            100% {
                transform: translateY(110vh);
                opacity: 0;
            }
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
    </style>
</head>
<body>
    <div class="container">
        <!-- 왼쪽 섹션 -->
        <div class="left">
            <img src="resources/images/logo.png" alt="로고" style="width: 300px; height: 200px;">
            <h1>SEOLLEENUN</h1>
            <h2>SKI & RESORT</h2>
            <p>Premium Adventure Shop</p>
            <div id="top1">
                <p>[Adv:nture]</p>
                <p>MAKE YOUR</p>
            </div>
        </div>

        <!-- 오른쪽 섹션 -->
        <div class="right">
            <form method="post" action="${pageContext.request.contextPath}/findId.me" class="form-container">
                <h1>아이디 찾기</h1>
                <input type="text" name="memberName" placeholder="이름" required>
                <input type="email" name="memberEmail" placeholder="이메일" required>
                <button type="submit">아이디 찾기</button>
                <div class="links">
                    <a href="${pageContext.request.contextPath}/login.me">로그인으로 돌아가기</a> | 
                    <a href="${pageContext.request.contextPath}/findPwd.me">비밀번호 찾기</a>
                </div>
            </form>
        </div>
    </div>

    <!-- 모달 -->
    <div class="modal" id="resultModal">
        <div class="modal-content">
            <div class="modal-header">알림</div>
            <div class="modal-body" id="modalMessage"></div>
            <div class="modal-footer">
                <button onclick="closeModal()">확인</button>
            </div>
        </div>
    </div>

    <script>
        // 눈송이 생성 함수
        function createSnowflake() {
            var snowflake = document.createElement('div');
            snowflake.classList.add('snowflake');
            snowflake.textContent = '❄';
            snowflake.style.left = Math.random() * 100 + 'vw';
            snowflake.style.animationDuration = (15 + Math.random() * 15) + 's';
            snowflake.style.fontSize = (10 + Math.random() * 10) + 'px';
            document.body.appendChild(snowflake);

            snowflake.addEventListener('animationend', function() {
                snowflake.remove();
            });

            setTimeout(createSnowflake, 500);
        }

        // 모달 열기
        function openModal(message) {
            document.getElementById('modalMessage').textContent = message;
            document.getElementById('resultModal').style.display = 'flex';
        }

        // 모달 닫기
        function closeModal() {
            document.getElementById('resultModal').style.display = 'none';
        }

        // 서버에서 전달된 메시지 표시
        window.onload = function () {
            <% if (request.getAttribute("resultMsg") != null) { %>
                openModal("<%= request.getAttribute("resultMsg") %>");
            <% } %>
            createSnowflake();
        };
    </script>
</body>
</html>
