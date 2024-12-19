<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/locker/locker.css">
<script src="https://pay.nicepay.co.kr/v1/js/"></script> <!-- Server 승인 운영계 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<script>
function serverAuth() {
    // 시작 날짜, 종료 날짜, 총 금액, 락커 번호, 회원 번호 가져오기
    const lockerStartDate = document.getElementById("lockerStartDate").value;
    const lockerEndDate = document.getElementById("lockerEndDate").value;
    const lockerTotalPrice = document.getElementById("lockerTotalPrice").value;
    const lockerNo = document.getElementById("lockerNo").value;
    const memberNo = document.getElementById("memberNo").value;
    console.log(lockerStartDate, lockerEndDate, lockerTotalPrice, lockerNo, memberNo);

    // AJAX 요청
    $.ajax({
        url: 'storeSessionData.lo',
        type: 'POST',
        data: {
            lockerStartDate: lockerStartDate,
            lockerEndDate: lockerEndDate,
            lockerTotalPrice: lockerTotalPrice,
            lockerNo: lockerNo,
            memberNo: memberNo
        },
        success: function(data) {
            if (data.status === 'success') {
                // 세션 저장 성공 후 결제 요청 실행
                AUTHNICE.requestPay({
                    clientId: 'S2_99ba9edee4764a5991018289cfd6308e',
                    method: 'card',
                    orderId: '02e16b8c-779d-497f-b54d-07521212175d',
                    amount: lockerTotalPrice,
                    goodsName: "설레눈리조트 락커",
                    returnUrl: "http://localhost:8090/ski/payResult.lo",
                    fnError: function(result) {
                        alert('결제 실패: ' + result.errorMsg);
                    }
                });
            } else {
                alert('세션 데이터 저장 실패: ' + data.message);
            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX 오류: ", error);
        }
    });
}
</script>
<body>

	<jsp:include page="../common/header.jsp" />

 
        <div class="hero">
        </div>
        

	 <!-- 예약 모달창 -->
    <div id="lockerModal" class="modal">
        <div class="modal-content">
          <div class="image-section">
                <img src="resources/images/locker/89.jpg" alt="락커 이미지">
            </div>
        
            <h2>락커 예약</h2>
            <!-- 예약 폼태그 잠시 보류 -->
          <!-- <form id="reservationForm">    --> 
                <p><strong>시작 날짜:</strong> 
                    <input type="date" id="lockerStartDate" name="lockerStartDate" required>
                </p>
                <p><strong>종료 날짜:</strong> 
                    <input type="date" id="lockerEndDate" name="lockerEndDate" required>
                </p>
                <p><strong>하루 가격:</strong> 5,000 원</p>
                <p><strong>이용 일수:</strong> <span id="daysCount">0</span> 일</p>
                <p><strong>총 금액:</strong> <span id="totalPrice">0</span> 원</p>
                <input type="hidden" name="lockerTotalPrice" id="lockerTotalPrice" value="0">
                <input type="hidden" name="lockerNo" id="lockerNo" value="1"> <!-- 예시 락커 번호 -->
				<input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.loginMember.memberNo}">

                <div class="button-section">
                    <button type="button" id="reserveBtn" onclick="serverAuth();">결제하기</button>
                </div>
           <!--  </form>  --> 
        </div>
    </div>

    <!-- 결과 모달창 -->
    <div id="resultModal" class="modal">
        <div class="modal-content">
            <h2 id="resultTitle"></h2>
            <p id="resultMessage"></p>
            <div class="button-section">
                <button onclick="closeResultModal()">확인</button>
            </div>
        </div>
    </div>

  <div class="content">
    <h2>SEOLLENEUN RESORT</h2>
    <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>
<button id="openModalBtn" class="fixed-reserve-button">락커 예약</button>

<script>
var isLoggedIn = ${sessionScope.loginMember != null};

document.addEventListener("DOMContentLoaded", function () {
    const openModalBtn = document.getElementById("openModalBtn");
    const lockerModal = document.getElementById("lockerModal");

    openModalBtn.addEventListener("click", function () {
        if (isLoggedIn) {
            lockerModal.style.display = "flex"; // 로그인 상태일 때 모달 열기
        } else {
            alert("로그인이 필요한 서비스입니다.");
            // 로그인 페이지로 이동
            window.location.href = "login.me";
        }
    });
});


</script>

	<div style="height:600;">
     <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p> 
    </div>
     
    <div class="locker-gallery">
    <h3>락커 이미지</h3>
    <div class="locker-images">
        <div class="locker-item">
                    <img src="${pageContext.request.contextPath}/resources/images/locker/2.jpg" alt="락커 이미지 2">
        
        </div>
        <div class="locker-item">
                    <img src="${pageContext.request.contextPath}/resources/images/locker/1.jpg" alt="락커 이미지 1">
        
        </div>
    </div>
</div>
    
    
    
  </div>
  
  
<div class="room-info-container">
    <div class="room-info-item">
        <strong>객실타입</strong>
        <p>취사/미취사</p>
    </div>
    <div class="room-info-item">
        <strong>정원 (최대 정원: 추가요금 발생)</strong>
        <p>6인(최대 9인)</p>
    </div>
    <div class="room-info-item">
        <strong>면적</strong>
        <p>134.28m²</p>
    </div>
    <div class="room-info-item">
        <strong>객실구성</strong>
        <p>침실2, 거실, 주방 겸 식당, 욕실, 화장실</p>
    </div>
    <div class="room-info-item">
        <strong>위치</strong>
        <p>Tower A~C, Tower F~H</p>
    </div>
    <div class="room-info-item">
        <strong>체크인/체크아웃</strong>
        <p>15:00 / 11:00</p>
    </div>
    <div class="room-info-item">
        <strong>침대타입</strong>
        <p>더블</p>
    </div>
    <div class="room-info-item">
        <strong>전망</strong>
        <p>1~6층: 산마르코광장 잔디정원<br>7~17층: 매봉산 및 오션월드</p>
    </div>
</div>

<div class="info-container">
    <h3>이용안내</h3>
    <div class="info-section">
        <h4>입실 안내 Check-in</h4>
        <p>22:00 이후 입실하는 경우 사전에 프런트 데스크 또는 소노호텔앤리조트에 연락해 주세요.</p>
        <p>리조트 운영정책: 회원 본인이 아닌 경우 제휴조건 금액이 적용되며 추가요금이 발생할 수 있습니다.</p>
    </div>
    <div class="info-section">
        <h4>퇴실 안내 Check-out</h4>
        <p>퇴실 전 객실 정리 (흡연 청소 및 쓰레기 분리수거 포함) 후 객실 시 제공된 퇴실증을 작성하여 프런트 데스크에 제출해 주세요.</p>
    </div>
    <div class="info-section">
        <h4>추가요금 안내 Extra charge</h4>
        <p>객실 정원 추가: 1인당 1박에 ₩11,000(VAT 포함), 만 7세 미만 어린이 추가요금 제외</p>
        <p>침구류 추가: 최대 객실 정원 대비하여 1박당 ₩25,000(VAT 포함)</p>
    </div>
    <div class="info-section">
        <h4>객실 정비안내 Cleaning Service</h4>
        <p>전날 15:00까지 프런트 데스크로 요청 필수</p>
        <p>3박 이상 투숙하는 경우, 3박 무료 객실정비가 제공됩니다.</p>
    </div>
</div>


<jsp:include page="../common/footer.jsp" />
</body>
 <script>
 
        document.addEventListener("DOMContentLoaded", function () {
            const openModalBtn = document.getElementById("openModalBtn");
            const lockerModal = document.getElementById("lockerModal");
            const resultModal = document.getElementById("resultModal");
            const resultTitle = document.getElementById("resultTitle");
            const resultMessage = document.getElementById("resultMessage");
            const startDateInput = document.getElementById("lockerStartDate");
            const endDateInput = document.getElementById("lockerEndDate");
            const daysCount = document.getElementById("daysCount");
            const totalPrice = document.getElementById("totalPrice");
            const lockerTotalPrice = document.getElementById("lockerTotalPrice");

            const pricePerDay = 5000; // 하루 가격

            // 모달 열기
            openModalBtn.addEventListener("click", () => lockerModal.style.display = "flex");

            // 날짜 변경 시 가격 계산
            function calculatePrice() {
            	const startDate = new Date(startDateInput.value);
                const endDate = new Date(endDateInput.value);
                
                // 날짜를 YYYY-MM-DD 형식으로 변환 후 출력
                if (startDateInput.value) {
                    console.log("선택된 시작 날짜: " + formatDate(startDate));
                }
                if (endDateInput.value) {
                    console.log("선택된 종료 날짜: " + formatDate(endDate));
                }


                if (startDate && endDate) {
                    if (startDate > endDate) {
                        alert("시작 날짜는 종료 날짜보다 앞서야 합니다.");
                        endDateInput.value = "";
                        return;
                    }
                    const dayDiff = (endDate - startDate) / (1000 * 60 * 60 * 24) + 1;
                    daysCount.textContent = dayDiff;
                    const total = dayDiff * pricePerDay;
                    totalPrice.textContent = total.toLocaleString();
                    lockerTotalPrice.value = total;
                }
            }
            
         	// 날짜 포맷 변환 함수
            function formatDate(date) {
                const year = date.getFullYear();
                const month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 필요
                const day = date.getDate().toString().padStart(2, '0'); // 두 자리로 변환
                return year + "-" + month + "-" + day;
            }

            startDateInput.addEventListener("change", calculatePrice);
            endDateInput.addEventListener("change", calculatePrice);
			
           

            // 결과 모달 닫기
            window.closeResultModal = function () {
                resultModal.style.display = "none";
            };

            // 모달 닫기 (외부 클릭)
            window.addEventListener("click", function (event) {
                if (event.target === lockerModal) lockerModal.style.display = "none";
                if (event.target === resultModal) resultModal.style.display = "none";
            });
        });
    </script>
</html>