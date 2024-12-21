<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            color: #333;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #ddd;
            margin-bottom: 30px;
            overflow-x: auto;
            white-space: nowrap;
        }

        .nav a {
            text-decoration: none;
            color: #666;
            padding: 0 15px;
        }

        .profile {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .profile-image {
            width: 60px;
            height: 60px;
            background-color: #666;
            border-radius: 50%;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            font-size: 24px;
        }

        .profile-info h2 {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .profile-info p {
            color: #666;
            font-size: 14px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 30px;
        }

        .member-info, .my-posts, .password-change {
            background: white;
            border-radius: 8px;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .info-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 1px solid #eee;
        }

        .info-item {
            display: grid;
            grid-template-columns: 100px 1fr;
            padding: 12px 0;
            border-bottom: 1px solid #f5f5f5;
            align-items: center;
        }

        .info-item:last-child {
            border-bottom: none;
        }

        .info-label {
            color: #666;
            font-size: 14px;
        }

        .info-value {
            color: #333;
            font-size: 14px;
        }

        .account-links {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            display: flex;
            justify-content: space-between;
        }

        .account-link {
            color: #666;
            text-decoration: none;
            padding: 8px 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            background: white;
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .account-link:hover {
            background: #f5f5f5;
            color: #333;
        }

        .account-link.delete {
            color: #e54d4d;
            border-color: #e54d4d;
        }

        .account-link.delete:hover {
            background: #fdd;
        }

        .my-posts h3 {
            font-size: 18px;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 1px solid #eee;
        }

        .inquiry-stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            margin-bottom: 20px;
        }

        .inquiry-stat {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 15px;
        }

        .inquiry-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 8px;
        }

        .inquiry-number {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .inquiry-number.pending {
            color: #333;
        }

        .inquiry-buttons {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .inquiry-button {
            padding: 10px;
            border: 1px solid #2c3e50;
            background: white;
            color: #333;
            border-radius: 4px;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .inquiry-button:hover {
            background-color: #f5f5f5;
        }

        /* 주문 통계 스타일 */
        .order-stats {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            background: white;
            border: 1px solid #eee;
            margin-bottom: 30px;
            border-radius: 8px;
        }

        .order-stat-item {
            text-align: center;
            flex: 1;
        }

        .order-stat-number {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        /* 주문 목록 스타일 */
        .order-list {
            background: white;
            border: 1px solid #eee;
            margin-bottom: 30px;
            border-radius: 8px;
            overflow: hidden;
        }

        .order-header {
            display: grid;
            grid-template-columns: 1fr 2fr 1fr 1fr;
            padding: 15px;
            background: #2c3e50;
            color: white;
            font-weight: 500;
        }

        .order-item {
            display: grid;
            grid-template-columns: 1fr 2fr 1fr 1fr;
            padding: 15px;
            border-bottom: 1px solid #eee;
            align-items: center;
        }

        .order-item:last-child {
            border-bottom: none;
        }

        .order-item img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 4px;
        }

        .btn-view {
            padding: 6px 16px;
            border: 1px solid #76a77c;
            color: #76a77c;
            background: white;
            border-radius: 20px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.2s;
        }

        .btn-view:hover {
            background: #76a77c;
            color: white;
        }

        /* VIP 태그 스타일 */
        .vip-tag {
            display: inline-block;
            padding: 2px 8px;
            background: #f0f0f0;
            border-radius: 12px;
            font-size: 12px;
            margin-right: 10px;
        }

.pwd-form-group {
    margin-bottom: 24px;
    position: relative;
}

.pwd-form-group input {
    width: 100%;
    padding: 12px;
    padding-right: 40px; /* 아이콘 공간 확보 */
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
}

.toggle-password {
    position: absolute;
    top: 12px; /* 입력 필드의 높이에 맞춰 고정 */
    right: 12px;
    cursor: pointer;
        transform: translateY(190%); /* 정확히 중앙 정렬 */
    color: #999;
    font-size: 16px;
    z-index: 10;
}


        .pwd-form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }
.message {
    min-height: 20px; /* 메시지 영역의 고정 높이 설정 */
    margin-top: 4px; /* 입력 필드와 메시지 간의 간격 */
    font-size: 12px; /* 메시지 글자 크기 */
    color: #ff0000; /* 에러 메시지 색상 */
    display: flex;
    align-items: center; /* 텍스트 수직 정렬 */
    visibility: hidden; /* 초기에는 메시지를 숨김 */
}

.message.visible {
    visibility: visible; /* 메시지가 표시될 때만 보이도록 설정 */
}

.success {
    color: #28a745; /* 성공 메시지 색상 */
}

.error {
    color: #dc3545; /* 에러 메시지 색상 */
}
        .submit-btn {
            color: #666;
            text-decoration: none;
            padding: 8px 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            background: white;
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .submit-btn:hover {
            background: #f5f5f5;
            color: #333;
        }

        /* 모달 전체 스타일 */
.modal {
    display: none; /* 기본적으로 숨김 */
    position: fixed;
    z-index: 1000;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 어두운 배경 */
    justify-content: center;
    align-items: center;
}

/* 모달 내용 */
.modal-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 500px;
    max-width: 90%;
    text-align: center;
    color : red;
}

/* 닫기 버튼 */
.modal-content .close {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 24px;
    font-weight: bold;
    color: #333;
    cursor: pointer;
}

.modal-content .close:hover {
    color: #ff0000;
}
        
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="container">
        <nav class="nav">
            <a href="${pageContext.request.contextPath}/myPage.me">마이페이지</a>
            <a href="${pageContext.request.contextPath}/storeSessionData.lo">락커 예약</a>
            <a href="${pageContext.request.contextPath}/list.pk">패키지</a>
            <a href="${pageContext.request.contextPath}/liftList.li">리프트권</a>
            <a href="${pageContext.request.contextPath}/list.ro">객실 예약</a>
            <a href="${pageContext.request.contextPath}/list.le">강습 예약</a>
            <a href="#">결제 관리</a>
        </nav>


        <div class="profile">
            <div class="profile-image">S</div>
            <div class="profile-info">
                <h2>${sessionScope.loginMember.memberName} <span class="vip-tag">VIP</span></h2>
                <p>고객님의 총 예약 금액은 350,000원입니다.</p>
            </div>
        </div>

        <div class="info-grid">
            <!-- 회원 정보 섹션 -->
            <div class="member-info" id="memberInfoSection">
                <h3 class="info-title">회원 정보</h3>
                <div class="info-item">
                    <span class="info-label">이름</span>
                    <span class="info-value">${sessionScope.loginMember.memberName}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">이메일</span>
                    <span class="info-value">${sessionScope.loginMember.email}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">전화번호</span>
                    <span class="info-value">${sessionScope.loginMember.phone}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">생년월일</span>
                    <span class="info-value">${sessionScope.loginMember.birthDate}</span>
                </div>
                <div class="account-links">
                    <button onclick="showPasswordChangeForm()" class="account-link">비밀번호 변경</button>
					<button type="button" class="account-link delete" onclick="showModal()">회원 탈퇴</button>


                </div>
            </div>

            <!-- 비밀번호 변경 폼 -->
 <!-- 비밀번호 변경 폼 -->
    <!-- 비밀번호 변경 폼 수정 -->
    <div class="member-info" id="passwordChangeSection" style="display: none;">
        <h3 class="info-title">비밀번호 변경</h3>
        <form id="changePwdForm" action="changePwd.me" method="post">
            <div class="pwd-form-group">
                <label for="currentPwd">현재 비밀번호</label>
                <input type="password" id="currentPwd" name="currentPwd" required>
                <i class="fas fa-eye toggle-password"></i>
            </div>
			<div class="pwd-form-group">
			    <label for="newPwd">새 비밀번호</label>
			    <input type="password" id="newPwd" name="newPwd" required>
			    <i class="fas fa-eye toggle-password"></i>
			    <div id="newPasswordMessage" class="message"></div>
			</div>
			<div class="pwd-form-group">
			    <label for="checkPwd">새 비밀번호 확인</label>
			    <input type="password" id="checkPwd" name="checkNewPwd" required>
			    <i class="fas fa-eye toggle-password"></i>
			    <div id="checkPasswordMessage" class="message"></div>
			</div>

            <button type="submit" class="submit-btn">변경</button>
			<button type="button" class="submit-btn" onclick="showMemberInfo()">취소</button>

        </form>
    </div>
		<!-- 모달 -->
		<div id="withdrawalModal" class="modal" style="display: none;">
		    <div class="modal-content">
		        <span class="close">&times;</span>
		        <h2>회원탈퇴</h2>
		        <p>탈퇴 후 복구가 불가능합니다. 정말로 탈퇴 하시겠습니까?</p>
		        <form id="withdrawalForm" action="delete.me" method="post">
		            <div class="pwd-form-group">
		                <label for="memberPwd">비밀번호:</label>
		                <input type="password" id="memberPwd" name="memberPwd" required>
		                <i class="fas fa-eye toggle-password"></i>
		            </div>
		            <input type="hidden" name="memberId" value="${sessionScope.loginMember.memberId}">
		            <div style="text-align: center; margin-top: 20px;">
		                <button type="submit" class="submit-btn">탈퇴하기</button>
		                <button type="button" class="submit-btn" onclick="closeModal()">취소</button>
		            </div>
		        </form>
		    </div>
		</div>


            <!-- 내 문의 섹션 -->

            <div class="my-posts">
                <h3>내 문의</h3>
                <div class="inquiry-stats">
                    <div class="inquiry-stat">
                        <span class="inquiry-label">전체 문의</span>
                        <span class="inquiry-number">0</span>
                    </div>
                    <div class="inquiry-stat">
                        <span class="inquiry-label">답변 완료</span>
                        <span class="inquiry-number">0</span>
                    </div>
                    <div class="inquiry-stat">
                        <span class="inquiry-label">답변 대기중</span>
                        <span class="inquiry-number pending">0</span>
                    </div>
                </div>
                <div class="inquiry-buttons">
                    <a href="#" class="inquiry-button">문의 내역 보기</a>
                    <a href="#" class="inquiry-button">신규 문의하기</a>
                </div>
            </div>
        </div>

        <!-- 주문 통계 -->
        <div class="order-stats">
            <div class="order-stat-item">
                <div class="order-stat-number">2</div>
                <div>락커</div>
            </div>
            <div class="order-stat-item">
                <div class="order-stat-number">1</div>
                <div>객실</div>
            </div>
            <div class="order-stat-item">
                <div class="order-stat-number">0</div>
                <div>패키지</div>
            </div>
            <div class="order-stat-item">
                <div class="order-stat-number">1</div>
                <div>리프트</div>
            </div>
        </div>

        <!-- 주문 목록 -->
        <div class="order-list">
            <div class="order-header">
                <div>예약번호</div>
                <div>상품정보</div>
                <div>결제 금액</div>
                <div>상세 보기</div>
            </div>
            <div class="order-item">
                <div>
                    [#202334]<br>
                    2024.12.20
                </div>
                <div>
                    <img src="locker.jpg" alt="락커">
                    개인 락커 1박 2일
                </div>
                <div>15,000원</div>
                <div><button class="btn-view">조회</button></div>
            </div>
            <div class="order-item">
                <div>
                    [#202310]<br>
                    2024.12.15
                </div>
                <div>
                    <img src="lift.jpg" alt="리프트권">
                    리프트권 종일권 (2인)
                </div>
                <div>70,000원</div>
                <div><button class="btn-view">조회</button></div>
            </div>
        </div>
    </div>

<script>
    // 비밀번호 변경 섹션 열기
    function showPasswordChangeForm() {
        document.getElementById('memberInfoSection').style.display = 'none';
        document.getElementById('passwordChangeSection').style.display = 'block';
    }

    // 회원 정보 섹션으로 돌아가기
    function showMemberInfo() {
        document.getElementById('memberInfoSection').style.display = 'block';
        document.getElementById('passwordChangeSection').style.display = 'none';
    }

    $(document).ready(function () {
        // 기존 비밀번호 표시/숨김 기능 유지
        $(".toggle-password").on("click", function () {
            const $input = $(this).siblings("input");
            const currentType = $input.attr("type");

            if (currentType === "password") {
                $input.attr("type", "text");
                $(this).removeClass("fa-eye").addClass("fa-eye-slash");
            } else {
                $input.attr("type", "password");
                $(this).removeClass("fa-eye-slash").addClass("fa-eye");
            }
        });

        // 기존 비밀번호 유효성 검사 유지
        const $newPwdInput = $("#newPwd");
        const $checkPwdInput = $("#checkPwd");
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~!@#$^*])[A-Za-z\d~!@#$^*]{8,20}$/;

        function validateNewPassword() {
            const newPwd = $newPwdInput.val();
            const message = $("#newPasswordMessage");
            if (newPwd === "") {
                message.removeClass("visible success error");
                return;
            }
            if (passwordRegex.test(newPwd)) {
                message.text("사용 가능한 비밀번호입니다.")
                    .removeClass("error")
                    .addClass("success visible");
            } else {
                message.text("비밀번호는 8~20자이며, 대문자, 소문자, 숫자, 특수기호(~!@#$^*)를 포함해야 합니다.")
                    .removeClass("success")
                    .addClass("error visible");
            }
        }

        function checkPasswordMatch() {
            const newPwd = $newPwdInput.val();
            const checkPwd = $checkPwdInput.val();
            const message = $("#checkPasswordMessage");
            if (newPwd === checkPwd) {
                message.text("비밀번호가 일치합니다.")
                    .removeClass("error")
                    .addClass("success visible");
            } else {
                message.text("비밀번호가 일치하지 않습니다.")
                    .removeClass("success")
                    .addClass("error visible");
            }
        }

        $newPwdInput.on("keyup", function () {
            validateNewPassword();
            checkPasswordMatch();
        });

        $checkPwdInput.on("keyup", checkPasswordMatch);

        $("#changePwdForm").on("submit", function (e) {
            const newPwd = $newPwdInput.val();
            const checkPwd = $checkPwdInput.val();

            if (!passwordRegex.test(newPwd)) {
                alert("비밀번호 조건을 확인해주세요.");
                e.preventDefault();
                return;
            }
            if (newPwd !== checkPwd) {
                alert("비밀번호가 일치하지 않습니다.");
                e.preventDefault();
            }
        });

        // 모달 관련 스크립트 유지
        var modal = document.getElementById("withdrawalModal");
        var span = document.getElementsByClassName("close")[0];

        function showModal() {
            $("#withdrawalModal").css("display", "flex");
        }

        function closeModal() {
            $("#withdrawalModal").hide();
        }

        $(document).on("click", ".account-link.delete", function () {
            showModal();
        });

        $(window).on("click", function (event) {
            if (event.target === modal) {
                closeModal();
            }
        });

        $(document).on("click", ".close", function () {
            closeModal();
        });
    });


    function closeModal() {
        document.getElementById("withdrawalModal").style.display = "none";
    }

</script>

        <jsp:include page="../common/footer.jsp" />
</body>
</html>