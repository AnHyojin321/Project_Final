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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>

<!-- Flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<!-- Flatpickr JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>

<style>
 
		
		
			.hero {
	    position: relative;
	    background: url('${pageContext.request.contextPath}/resources/images/locker/22.png') no-repeat center center;
	    background-size: cover;
	    height: 500px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.flatpickr-calendar {
    background-color: #f9f9f9;
    border: 1px solid #2a2a72;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.flatpickr-day {
    font-size: 14px;
    border-radius: 50%;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.flatpickr-day:hover {
    background-color: #2a2a72;
    color: white;
}

.flatpickr-day.selected {
    background-color: #4a90e2;
    color: white;
}

.flatpickr-month {
    font-size: 16px;
    color: #2a2a72;
    font-weight: bold;
}
	
	
	
</style>
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
                <img src="resources/images/locker/locker.png" alt="락커 이미지">
            </div>
        
            <h2>락커 예약</h2>
            <!-- 예약 폼태그 잠시 보류 -->
          <!-- <form id="reservationForm">    --> 
                <p><strong>시작 날짜:</strong> 
    <input type="text" id="lockerStartDate" name="lockerStartDate" required>
</p>
<p><strong>종료 날짜:</strong> 
    <input type="text" id="lockerEndDate" name="lockerEndDate" required>
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
   
<button id="openModalBtn" class="fixed-reserve-button">락커 예약</button>



<script>
document.addEventListener("DOMContentLoaded", function () {
    const startDateInput = document.getElementById("lockerStartDate");
    const endDateInput = document.getElementById("lockerEndDate");

    // Flatpickr 초기화
    flatpickr(startDateInput, {
        locale: "ko", // 한국어 로케일 설정
        dateFormat: "Y-m-d", // 날짜 형식
    });

    flatpickr(endDateInput, {
        locale: "ko", // 한국어 로케일 설정
        dateFormat: "Y-m-d", // 날짜 형식
    });
});

</script>


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
      설레눈 리조트는 이용객의 편리함과 안전을 위해 최신식 락커를 제공합니다. <br>
        <strong>다양한 크기와 타입의 락커</strong>가 준비되어 있으며, 개인 물품 및 장비를 안전하게 보관할 수 있습니다. <br>
        락커는 <strong>스키하우스 1층과 2층</strong>에 위치하고 있어 쉽게 접근 가능하며, <strong>24/25 시즌</strong> 동안 리조트 운영 시간에 맞춰 이용할 수 있습니다.
    </p> 
    </div>
     
    <div class="locker-gallery">
    <h3>락커 위치</h3>
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
        <strong>락커타입</strong>
        <p>싱글/롱바디</p>
    </div>
    <div class="room-info-item">
        <strong>락커 추가금액</strong>
        <p>2인 이상 이용 시 추가 결제 필요</p>
    </div>
    <div class="room-info-item">
        <strong>크기</strong>
        <p>가로 200 세로 400</p>
    </div>
   
    <div class="room-info-item">
        <strong>위치</strong>
        <p>스키하우스 1층 / 2층</p>
    </div>
    <div class="room-info-item">
        <strong>보관소 운영 시간</strong>
        <p> "24/25" 시즌 스키장 운영시간 내</p>
    </div>
   
    <div class="room-info-item">
        <strong>기타사항</strong>
        <p>시즌보관소의 사물함 열쇠는 본인이 휴대하여야 하며, 분실 시 재발급 비용이 발생됩니다.
</p>
    </div>
</div>

<div class="info-container">
    <h3>이용안내</h3>
    <div class="info-section">
        <h4>락커 안내</h4>
        <p>22:00 이후 락커를 사용하시는 경우 사전에 프런트 데스크 또는 설레눈리조트에 연락해 주세요.</p>
        <p>리조트 운영정책: 회원 본인이 아닌 경우 제휴조건 금액이 적용되며 추가요금이 발생할 수 있습니다.</p>
    </div>
    <div class="info-section">
        <h4>락커 교환 안내</h4>
        <p>원칙상 예매번호로 명시된 락커 번호만 사용가능하며 락커 문제 시 교환 가능합니다.</p>
    </div>
    <div class="info-section">
        <h4>추가요금 안내 Extra charge</h4>
        <p>락커 정원 추가: 2인 이상 락커 이용 시 인당 (3000원 추가요금 발생)</p>
        <p>스키 장비 / 보드 장비 보관 필요할 시(10,000원 추가요금 발생)</p>
    </div>
    <div class="info-section">
        <h4>락커 분실물 안내</h4>
        <p>분실 물건은 데스크 또는 분실물 페이지를 이용해주세요.</p>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
 <script>
 
 // GSAP 애니메이션
 const timeline = gsap.timeline();

 timeline
     // 왼쪽 문 열기
     .to(".door.left", {
         x: "-100%",
         duration: 2.5, // 더 천천히 열림
         ease: "power3.inOut",
     })
     // 오른쪽 문 열기
     .to(
         ".door.right",
         {
             x: "100%",
             duration: 2.5, // 더 천천히 열림
             ease: "power3.inOut",
         },
         "<" // 동시에 실행
     )
     // 콘텐츠 나타내기
     .to(
         ".content",
         {
             opacity: 1,
             duration: 1,
             ease: "power2.out",
         },
         "-=1" // 문이 열리는 중간에 실행
     );
 
 
 
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