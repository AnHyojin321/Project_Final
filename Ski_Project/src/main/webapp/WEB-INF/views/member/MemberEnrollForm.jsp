<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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

        .signup-container h1 {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
        }

        .signup-container p {
            font-size: 14px;
            color: #555;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }

        .form-group input,
        .form-group select {
            width: 550px;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group .message {
            font-size: 12px;
            margin-top: 5px;
        }

        .message.error {
            color: red;
        }

        .message.success {
            color: green;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .actions button {
            width: 48%;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .actions .submit {
            background-color: #007bff;
            color: white;
        }

        .actions .cancel {
            background-color: #ddd;
            color: #333;
        }

        .actions .submit:hover {
            background-color: #0056b3;
        }

        .actions .cancel:hover {
            background-color: #bbb;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            <div class="signup-container">
                <h1>회원가입</h1>
                <p>회원이 되어 다양한 혜택을 경험해 보세요!</p>
                <form method="post" action="insert.me" id="enrollForm">
                    <div class="form-group">
                        <label for="memberId">아이디 *</label>
                        <input type="text" id="memberId" name="memberId" placeholder="아이디 입력(5~20자)" required>
                        <div id="checkResult" style="font-size: 0.8em; display: none;"></div>
                    </div>

                    <div class="form-group">
                        <label for="memberPwd">비밀번호 *</label>
                        <input type="password" id="memberPwd" name="memberPwd"
                               placeholder="비밀번호는 영문 소문자, 대문자, 숫자, 특수기호(~!@#$^*)를 포함한 8 ~ 20자 이상입니다." required>
                        <div id="passwordMessage" class="message"></div> <!-- 비밀번호 메시지 -->
                    </div>

                    <div class="form-group">
                        <label for="checkPwd">비밀번호 확인 *</label>
                        <input type="password" id="checkPwd" name="checkPwd" placeholder="비밀번호 재입력" required>
                        <div id="passwordCheckMessage" class="message"></div> <!-- 비밀번호 확인 메시지 -->
                    </div>

                    <div class="form-group">
                        <label for="memberName">이름 *</label>
                        <input type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요" required>
                    </div>
                    <div class="form-group">
                        <label for="email">이메일 주소 *</label>
                        <input type="email" id="email" name="email" placeholder="이메일 주소 입력" required>
                    </div>
                    <div class="form-group">
                        <label for="birthDate">생년월일 *</label>
                        <input type="date" id="birthDate" name="birthDate" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">전화번호 *</label>
                        <input type="text" id="phone" name="phone" placeholder="휴대폰 번호 입력 ('-' 포함)" required>
                    </div>
                    <div class="form-group">
                        <label for="address">주소 </label>
                        <input type="text" id="address" name="address">
                    </div>
                    <div class="actions">
                        <button type="submit" class="submit" disabled>가입완료</button>
                        <button type="reset" class="cancel">가입취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<script>
$(function () {
    // 아이디 입력 필드
    const $idInput = $("#memberId");
    // 중복 체크 결과 메시지
    const $checkResult = $("#checkResult");
    // 회원가입 버튼
    const $submitButton = $(".submit");

    // 비밀번호 입력 필드와 메시지
    const $passwordInput = $("#memberPwd");
    const $passwordCheckInput = $("#checkPwd");
    const $passwordMessage = $("#passwordMessage");
    const $passwordCheckMessage = $("#passwordCheckMessage");

    // 비밀번호 정규표현식 (영문 소문자, 대문자, 숫자, 특수문자 포함 8 ~ 20자)
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~!@#$^*])[A-Za-z\d~!@#$^*]{8,20}$/;

    // 비밀번호 입력 이벤트
    $passwordInput.on("keyup", function () {
        const password = $(this).val();
        
        if (passwordRegex.test(password)) {
            $passwordMessage
                .text("사용 가능한 비밀번호입니다.")
                .css("color", "green") // 조건에 맞으면 초록색
                .show();
        } else {
            $passwordMessage
                .text("비밀번호는 8~20자이며, 최소 하나의 영문자, 숫자, 특수기호(~!@#$^*)를 포함해야 합니다.")
                .css("color", "red") // 조건에 맞지 않으면 빨간색
                .show();
        }
        checkFormValidity();
    });

    // 비밀번호 확인 입력 이벤트
    $passwordCheckInput.on("keyup", function () {
        const password = $passwordInput.val();
        const passwordCheck = $(this).val();

        if (password === passwordCheck) {
            $passwordCheckMessage
                .text("비밀번호가 일치합니다.")
                .css("color", "green") // 일치하면 초록색
                .show();
        } else {
            $passwordCheckMessage
                .text("비밀번호가 일치하지 않습니다.")
                .css("color", "red") // 일치하지 않으면 빨간색
                .show();
        }
        checkFormValidity();
    });

    // 아이디 입력 필드에서 입력 값 변경 시 이벤트 발생
    $idInput.on("keyup", function () {
        const checkId = $(this).val();

        if (checkId.length >= 5) {
            // 5글자 이상일 경우 중복 체크 Ajax 요청
            $.ajax({
                url: "idCheck.me", // 서버의 중복 체크 URL
                type: "get",
                data: { checkId: checkId },
                success: function (result) {
                    if (result.trim() === "NNNNN") {
                        $checkResult
                            .text("중복된 아이디가 이미 존재합니다. 다시 입력해 주세요.")
                            .css("color", "red")
                            .show();
                        $submitButton.prop("disabled", true); // 버튼 비활성화
                    } else {
                        $checkResult
                            .text("멋진 아이디네요!")
                            .css("color", "green")
                            .show();
                        $submitButton.prop("disabled", false); // 버튼 활성화
                    }
                },
                error: function () {
                    $checkResult
                        .text("중복 체크 중 문제가 발생했습니다.")
                        .css("color", "red")
                        .show();
                    $submitButton.prop("disabled", true); // 버튼 비활성화
                },
            });
        } else {
            $checkResult.hide();
            $submitButton.prop("disabled", true); // 버튼 비활성화
        }
    });

    // 폼의 유효성 체크
    function checkFormValidity() {
        const passwordValid = passwordRegex.test($passwordInput.val());
        const passwordCheckValid = $passwordInput.val() === $passwordCheckInput.val();
        
        if (passwordValid && passwordCheckValid && $idInput.val().length >= 5) {
            $submitButton.prop("disabled", false); // 조건을 모두 만족하면 버튼 활성화
        } else {
            $submitButton.prop("disabled", true); // 조건을 만족하지 않으면 버튼 비활성화
        }
    }
});

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
