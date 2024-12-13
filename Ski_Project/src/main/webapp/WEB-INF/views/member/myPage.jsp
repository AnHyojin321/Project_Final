<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .content {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            padding: 30px;
            margin-top: 50px;
            transition: all 0.3s ease;
        }
        .content:hover {
            box-shadow: 0 0 30px rgba(0,0,0,0.2);
        }
        .form-control {
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
            transform: translateY(-2px);
        }
        .btn {
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
            transform: translateY(-2px);
        }
        .modal-content {
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,.5);
        }
        .modal-header {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            background: linear-gradient(45deg, #007bff, #00c6ff);
        }
		.message {
		    position: absolute; /* 메시지를 입력 필드 아래 고정 */
		    left: 0; /* 입력 필드의 왼쪽과 맞춤 */
		    top: 100%; /* 입력 필드 바로 아래 */
		    margin-top: 0px; /* 입력 필드와의 간격 */
		    font-size: 0.875rem; /* 메시지 텍스트 크기 */
		    color: red; /* 메시지 색상 */
		    display: block; /* 초기 상태는 숨김 */
		    white-space: nowrap; /* 긴 메시지도 한 줄에 표시 */
		}
		.form-group {
		    position: relative; /* 메시지의 위치 기준을 입력 필드 컨테이너로 설정 */
		        margin-bottom: 20px; /* 기본 간격을 더 넓게 설정 */
		}


		.toggle-password {
		    position: absolute;
		    right: 10px; /* 입력 필드 오른쪽에 배치 */
		    top: 50%; /* 세로 중앙 정렬 */
		    transform: translateY(40%);
		    cursor: pointer;
		    color: #aaa;
		    transition: color 0.2s ease;
		}
        .toggle-password:hover {
            color: #333;
        }

        label {
            font-weight: 600;
            color: #495057;
        }
        .modal-title {
            font-weight: 600;
        }
        .close {
            opacity: 1;
            text-shadow: none;
        }
        .close:hover {
            color: #f8f9fa;
        }
		#pwd_hint {
			font-size : 12px;
		}
        @media (min-width: 576px) {
          .modal-dialog.modal-lg {
              max-width: 800px; /* Increase the width of the modal */
          }
        }
        .modal-body {
            padding: 2rem;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="content">
            <h2 class="text-center mb-4">마이페이지</h2>
            <form action="update.me" method="post">
                <div class="form-group">
                    <label for="memberId">* ID :</label>
                    <input type="text" class="form-control" id="memberId" value="${sessionScope.loginMember.memberId}" name="memberId" readonly>
                </div>
                <div class="form-group">
                    <label for="memberName">* Name :</label>
                    <input type="text" class="form-control" id="memberName" value="${sessionScope.loginMember.memberName}" name="memberName" required>
                </div>
                <div class="form-group">
                    <label for="email">Email :</label>
                    <input type="email" class="form-control" id="email" value="${sessionScope.loginMember.email}" name="email" readonly>
                </div>
                <div class="form-group">
                    <label for="birthDate">Birth Date :</label>
                    <input type="date" class="form-control" id="birthDate" value="${sessionScope.loginMember.birthDate}" name="birthDate">
                </div>
                <div class="form-group">
                    <label for="phone">Phone :</label>
                    <input type="tel" class="form-control" id="phone" value="${sessionScope.loginMember.phone}" name="phone">
                </div>
                <div class="form-group">
                    <label for="address">Address :</label>
                    <input type="text" class="form-control" id="address" value="${sessionScope.loginMember.address}" name="address">
                </div>
                <div class="text-center mt-4">
                    <button type="button" class="btn btn-primary mr-2" data-toggle="modal" data-target="#changePwdForm">비밀번호 변경</button>
                    <button type="submit" class="btn btn-success mr-2">수정하기</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 회원탈퇴 모달 -->
    <div class="modal fade" id="deleteForm" tabindex="-1" role="dialog" aria-labelledby="deleteFormLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="deleteFormLabel">회원탈퇴</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="delete.me" method="post">
                    <div class="modal-body">
                        <p class="text-danger font-weight-bold">탈퇴 후 복구가 불가능합니다. 정말로 탈퇴 하시겠습니까?</p>
                        <div class="form-group">
                            <label for="memberPwd">Password:</label>
                            <input type="password" class="form-control" id="memberPwd" name="memberPwd" required>
                            <i class="fa fa-eye toggle-password"></i>
                        </div>
                        <input type="hidden" name="memberId" value="${sessionScope.loginMember.memberId}">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 비밀번호 변경 모달 -->
    <div class="modal fade" id="changePwdForm" tabindex="-1" role="dialog" aria-labelledby="changePwdFormLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="changePwdFormLabel">비밀번호 변경</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="changePwd.me" method="post" onsubmit="return validatePassword();">
                    <div class="modal-body">
						<div class="form-group">
						    <label for="currentPwd">현재 비밀번호</label>
						    <input type="password" class="form-control" id="currentPwd" name="currentPwd" required>
						    <i class="fa fa-eye toggle-password"></i>
						    <div id="pwd_hint" class="message">CAPS LOCK 켜져 있습니다.</div>
						</div>

						<div class="form-group position-relative">
						    <label for="newPwd">새 비밀번호</label>
						    <input type="password" class="form-control" id="newPwd" name="newPwd" required>
						    <i class="fa fa-eye toggle-password"></i>
						    <!-- 비밀번호 메시지 -->
						    <div id="newPasswordMessage" class="message"></div>
						</div>
						
						<div class="form-group position-relative">
						    <label for="checkPwd">새 비밀번호 확인</label>
						    <input type="password" class="form-control" id="checkPwd" name="checkNewPwd" required>
						    <i class="fa fa-eye toggle-password"></i>
						    <!-- 확인 메시지 -->
						    <div id="checkPasswordMessage" class="message"></div>
						</div>
						<div id="passwordMessage" class="message"></div>
                        <input type="hidden" name="memberId" value="${sessionScope.loginMember.memberId}">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
    $(function () {
        // 초기 메시지 숨김
        $("#pwd_hint").hide();
        $("#newPasswordMessage").hide();
        $("#checkPasswordMessage").hide();

        const $newPwdInput = $("#newPwd");
        const $checkPwdInput = $("#checkPwd");
        const $newPasswordMessage = $("#newPasswordMessage");
        const $checkPasswordMessage = $("#checkPasswordMessage");
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~!@#$^*])[A-Za-z\d~!@#$^*]{8,20}$/;

        const $hintElement = $("#pwd_hint");
        const $currentPwdInput = $("#currentPwd");
	

        // 비밀번호 유효성 검사 함수
        function validateNewPassword() {
            const newPwd = $newPwdInput.val();
            if (newPwd === "") {
                $newPasswordMessage.hide(); // 비어 있을 경우 메시지 숨김
                return;
            }
            if (passwordRegex.test(newPwd)) {
                $newPasswordMessage.text("사용 가능한 비밀번호입니다.").css("color", "green").show();
            } else {
                $newPasswordMessage
                    .text("비밀번호는 8~20자이며, 최소 하나의 영문 대문자, 소문자, 숫자, 특수기호(~!@#$^*)를 포함해야 합니다.")
                    .css("color", "red")
                    .show();
            }
        }

        // 비밀번호 확인 일치 여부 확인 함수
        function checkPasswordMatch() {
            const newPwd = $newPwdInput.val();
            const checkPwd = $checkPwdInput.val();

            if (checkPwd === "") {
                $checkPasswordMessage.hide(); // 확인 입력이 없을 경우 메시지 숨김
                return;
            }

            if (newPwd === checkPwd) {
                $checkPasswordMessage.text("비밀번호가 일치합니다.").css("color", "green").show();
            } else {
                $checkPasswordMessage.text("비밀번호가 일치하지 않습니다.").css("color", "red").show();
            }
        }

        // 이벤트 연결
        $newPwdInput.on("keyup", function () {
            validateNewPassword(); // 비밀번호 유효성 검사
            checkPasswordMatch(); // 비밀번호 확인 일치 여부 확인
        });

        $checkPwdInput.on("keyup", function () {
            checkPasswordMatch(); // 비밀번호 확인 일치 여부 확인
        });

        // 비밀번호 입력란 토글 기능 (비밀번호 보이기/숨기기)
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

        // 비밀번호 변경 폼 검증
        $("#changePwdForm").on("submit", function (e) {
            const newPwd = $newPwdInput.val();
            const checkPwd = $checkPwdInput.val();

            // 비밀번호 유효성 검사
            if (!passwordRegex.test(newPwd)) {
                alert("비밀번호는 8~20자이며, 최소 하나의 영문 대문자, 소문자, 숫자, 특수기호(~!@#$^*)를 포함해야 합니다.");
                e.preventDefault();
                return false;
            }

            // 비밀번호 확인
            if (newPwd !== checkPwd) {
                alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
                e.preventDefault();
                return false;
            }

            return true; // 폼 전송 허용
        });
    });


    </script>
</body>
</html>