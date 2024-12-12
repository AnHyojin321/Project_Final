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
            width: 480px;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        


        .password-wrapper {
            position: relative;
            width: 480px; /* 입력 필드와 동일한 크기 */
        }

        .password-wrapper input {
            width: 100%; /* 입력 필드 전체 크기 */
            padding-right: 40px; /* 오른쪽에 눈 모양 아이콘이 들어갈 공간 확보 */
        }

        .password-wrapper .toggle-password {
            position: absolute;
            right: 10px; /* 입력 필드의 오른쪽 끝에서 약간 떨어진 위치 */
            top: 50%;
            transform: translateY(-50%); /* 세로 가운데 정렬 */
            cursor: pointer;
            color: #aaa; /* 기본 색상 */
            transition: color 0.2s ease;
        }

        .password-wrapper .toggle-password:hover {
            color: #333; /* 호버 시 색상 변경 */
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
        .email-wrapper {
    position: relative;
    display: flex;
    align-items: center;
    width: 500px;
}

.email-wrapper input {
    flex: 1;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}

.cert-btn {
    background-color: #007bff;
    color: white;
    font-size: 14px;
    border: none;
    border-left: 1px solid #ddd;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    padding: 10px 15px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

.cert-btn:hover {
    background-color: #0056b3;
}

.cert-wrapper {
    position: relative;
    display: flex;
    align-items: center;
    width: 500px;
}

.cert-wrapper input {
    flex: 1;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}

.validate-btn {
    background-color: #28a745;
    color: white;
    font-size: 14px;
    border: none;
    border-left: 1px solid #ddd;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    padding: 10px 15px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

.validate-btn:hover {
    background-color: #1e7e34;
}
#pwd_hint {
	font-size : 11px;
}

    </style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous">
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
                <form method="post" action="insert.me" id="enrollForm">
                    <div class="form-group">
                        <label for="memberId">아이디 *</label>
                        <input type="text" id="memberId" name="memberId" placeholder="아이디 입력(5~20자)" required>
                        <div id="checkResult" style="font-size: 0.8em; display: none;"></div>
                    </div>

                    <div class="form-group">
                        <label for="memberPwd">비밀번호 *</label>
                        <div class="password-wrapper">
                            <input type="password" id="memberPwd" name="memberPwd"
                                   placeholder="비밀번호는 영문 소문자, 대문자, 숫자, 특수기호(~!@#$^*)를 포함한 8 ~ 20자 이상입니다." required>
                            <i class="fa fa-eye fa-lg toggle-password"></i> <!-- 눈 모양 아이콘 -->
                        </div>
                        <div id="passwordMessage" class="message"></div> <!-- 비밀번호 메시지 -->
                        <span id="pwd_hint" style="color:red;"></span>
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
						<div class="email-wrapper">
						    <input type="email" id="email" name="email" placeholder="이메일 주소 입력" required>
						    <button type="button" id="cert" class="cert-btn">인증 요청</button>
						</div>
                    </div>
                    
                    <!-- 인증번호 입력란과 인증 버튼 -->
					<div id="cert-area" style="display: none;">
					    <div class="form-group">
					        <label for="certNo">인증번호 입력 *</label>
					        <div class="cert-wrapper">
					            <input type="text" id="certNo" placeholder="인증번호를 입력하세요" disabled>
					            <button type="button" id="validate" class="validate-btn" readonly>인증</button>
					        </div>
					    </div>
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
    const $idInput = $("#memberId");
    const $checkResult = $("#checkResult");
    const $submitButton = $(".submit");

    const $passwordInput = $("#memberPwd");
    const $passwordCheckInput = $("#checkPwd");
    const $passwordMessage = $("#passwordMessage");
    const $passwordCheckMessage = $("#passwordCheckMessage");

    // 정규식: 아이디는 5~20자의 영어 대소문자, 숫자만 허용
    const idRegex = /^[a-zA-Z0-9]{5,20}$/;
    // 비밀번호 정규식
    const passwordRegex = /^(?=.*[A-Z])(?=.*[!@#$%^&])[0-9a-zA-Z!@#$%^&]{8,15}$/;

    let isEmailValidated = false; // 이메일 인증 여부를 확인하기 위한 변수

    function checkFormValidity() {
        const idValid = idRegex.test($idInput.val());
        const passwordValid = passwordRegex.test($passwordInput.val());
        const passwordCheckValid = $passwordInput.val() === $passwordCheckInput.val();

        if (idValid && passwordValid && passwordCheckValid && isEmailValidated) {
            $submitButton.prop("disabled", false); // 모든 조건 만족 시 활성화
        } else {
            $submitButton.prop("disabled", true); // 조건 불충족 시 비활성화
        }
    }

    // 아이디 입력 이벤트
    $idInput.on("keyup", function () {
        const idValue = $(this).val();

        if (idRegex.test(idValue)) {
            // 아이디 중복 체크 Ajax 요청
            $.ajax({
                url: "idCheck.me",
                type: "get",
                data: { checkId: idValue },
                success: function (result) {
                    if (result.trim() === "NNNNN") {
                        $checkResult.text("중복된 아이디가 이미 존재합니다. 다시 입력해 주세요.")
                            .css("color", "red")
                            .show();
                        $submitButton.prop("disabled", true); // 버튼 비활성화
                    } else {
                        $checkResult.text("멋진 아이디네요!").css("color", "green").show();
                        checkFormValidity(); // 폼 유효성 확인
                    }
                },
                error: function () {
                    $checkResult.text("중복 체크 중 문제가 발생했습니다.").css("color", "red").show();
                    $submitButton.prop("disabled", true);
                },
            });
        } else {
            $checkResult.text("아이디는 5~20자의 영어 대소문자와 숫자만 가능합니다.")
                .css("color", "red")
                .show();
            $submitButton.prop("disabled", true); // 버튼 비활성화
        }
    });

    $passwordInput.on("keyup", function () {
        const password = $(this).val();

        if (passwordRegex.test(password)) {
            $passwordMessage.text("사용 가능한 비밀번호입니다.").css("color", "green").show();
        } else {
            $passwordMessage
                .text("비밀번호는 8~20자이며, 최소 하나의 영문자, 숫자, 특수기호(~!@#$^*)를 포함해야 합니다.")
                .css("color", "red")
                .show();
        }
        checkFormValidity();
    });

    $passwordCheckInput.on("keyup", function () {
        const password = $passwordInput.val();
        const passwordCheck = $(this).val();

        if (password === passwordCheck) {
            $passwordCheckMessage.text("비밀번호가 일치합니다.").css("color", "green").show();
        } else {
            $passwordCheckMessage.text("비밀번호가 일치하지 않습니다.").css("color", "red").show();
        }
        checkFormValidity();
    });

    $("#cert").on("click", function () {
        let email = $("#email").val();

        $.ajax({
            url: "cert.do",
            type: "post",
            data: { email: email },
            success: function (result) {
                alert(result);
                $("#cert-area").show();
                $("#certNo").attr("disabled", false);
                $("#validate").attr("disabled", false);
                $("#email").attr("readonly", true);
                $("#cert").attr("disabled", true);
            },
            error: function () {
                console.log("인증번호 발급용 ajax 통신 실패");
            },
        });
    });

    $("#validate").on("click", function () {
        let email = $("#email").val();
        let certNo = $("#certNo").val();

        $.ajax({
            url: "validate.do",
            type: "post",
            data: { email: email, certNo: certNo },
            success: function (result) {
                if (result === "인증 성공") {
                    isEmailValidated = true; // 인증 성공
                    $("#result").text("이메일 인증이 완료되었습니다!").css("color", "green");
                    $("#certNo").attr("disabled", true);
                    $("#validate").attr("disabled", true);
                } else {
                    isEmailValidated = false; // 인증 실패
                    $("#result").text("인증번호가 일치하지 않습니다.").css("color", "red");
                }
                checkFormValidity(); // 폼 상태 재확인
            },
            error: function () {
                console.log("인증번호 확인용 ajax 통신 실패!");
            },
        });
    });

    $(".toggle-password").on("click", function () {
        const $passwordInput = $(this).siblings("input");
        const inputType = $passwordInput.attr("type");

        if (inputType === "password") {
            $passwordInput.attr("type", "text");
            $(this).removeClass("fa-eye").addClass("fa-eye-slash");
        } else {
            $passwordInput.attr("type", "password");
            $(this).removeClass("fa-eye-slash").addClass("fa-eye");
        }
    });

    function createSnowflake() {
        var snowflake = document.createElement("div");
        snowflake.classList.add("snowflake");
        snowflake.textContent = "❄";
        snowflake.style.left = Math.random() * 100 + "vw";
        snowflake.style.animationDuration = 15 + Math.random() * 15 + "s";
        snowflake.style.fontSize = 10 + Math.random() * 10 + "px";
        document.body.appendChild(snowflake);

        snowflake.addEventListener("animationend", function () {
            snowflake.remove();
        });

        setTimeout(createSnowflake, 1000);
    }

    createSnowflake();
});
document.querySelector('input[name=memberPwd]').addEventListener('keyup', function(e){
    if (e.getModifierState){
        if (e.getModifierState('CapsLock')) {
            $("#pwd_hint").html('CAPS LOCK 켜져 있습니다.');
            $("#pwd_hint").css('display', 'block');
        }else {
            $("#pwd_hint").css('display', 'none');
        }
        
    }
  });

</script>


</body>
</html>
