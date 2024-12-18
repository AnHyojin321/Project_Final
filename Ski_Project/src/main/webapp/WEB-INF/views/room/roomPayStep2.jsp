<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	body {
	    font-family: Arial, sans-serif;
	    margin: 0;
	    padding: 20px;
	}

	/* step1 과 공통 css 영역 */
	.reservation-menu {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  background-color: #f8f8f8;
	  padding: 20px 0;
	  gap: 60px;
	}
	
	.menu-item {
	  text-align: center;
	}
	
	.menu-item .icon {
	  width: 100px;
	  height: 100px;
	  border-radius: 50%;
	  background-color: #fff;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  margin-bottom: 5px;
	  transition: background-color 0.3s ease;
	}
	
	.menu-item img {
	  width: 50px;
	  height: 50px;
	}
	
	.menu-item span {
	  font-size: 14px;
	  color: #333;
	}
	
	.menu-item.active .icon {
	  background-color: #2a4d9e;
	}
	
	.menu-item.active span {
	  color: #2a4d9e;
	}
	
	.reservation-steps {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  margin-top: 20px;
	  gap: 20px;
	}
	
	.step {
	  font-size: 14px;
	  color: #333;
	  position: relative;
	}
	
	.step.active {
	  font-weight: bold;
	}
	
	.step:not(:last-child)::after {
	  content: '>';
	  margin-left: 10px;
	  color: #aaa;
	}
	
	/* 전체 레이아웃 */
	.reservation-container {
	    display: flex;
	    gap: 20px;
	    max-width: 1200px;
	    margin: 0 auto;
	}
	
	/* 왼쪽 기존 내용 */
	.content-container {
	    width: 70%;
	}
	
	/* 오른쪽 예약 정보 */
	.reservation-info {
		margin-top : 130px;
	    width: 30%;
	    height : 550px;
	    background-color: #fff;
	    border: 1px solid #ddd;
	    padding: 15px;
	}
	
	/* 전화번호 입력 필드 스타일 */
	.customer-info-table input[type="text"] {
	    width: 50%; /* 입력 필드가 테이블 셀의 너비를 차지하도록 설정 */
	    padding: 10px; /* 입력 필드 안의 내용에 여백 추가 */
	    border: 1px solid #ccc; /* 기본 테두리 */
	    border-radius: 5px; /* 둥근 모서리 */
	    font-size: 16px; /* 텍스트 크기 */
	    color: #333; /* 텍스트 색상 */
	    background-color: #f9f9f9; /* 입력 필드 배경색 */
	    outline: none; /* 클릭 시 기본 파란 테두리 제거 */
	    transition: border-color 0.3s, background-color 0.3s; /* 부드러운 전환 효과 */
	}
	
	/* 입력 필드에 포커스가 있을 때 스타일 */
	.customer-info-table input[type="text"]:focus {
	    border-color: #007bff; /* 포커스 시 테두리 색상 변경 */
	    background-color: #fff; /* 포커스 시 배경색 변경 */
	    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* 포커스 시 외곽선 효과 */
	}
	
	/* 입력 필드가 비활성화된 상태 */
	.customer-info-table input[type="text"]:disabled {
	    background-color: #e9ecef; /* 비활성화된 필드 배경색 */
	    color: #6c757d; /* 비활성화된 필드 텍스트 색상 */
	    cursor: not-allowed; /* 커서 표시 */
	}

	
	.reservation-info h2 {
	    font-size: 18px;
	    margin-bottom: 10px;
	    color: #333;
	    background-color: #b89c73;
	    padding: 8px;
	    color: white;
	    text-align: center;
	}
	
	.info-section {
		margin-top : 20px;
	}
	
	.info-section h3 {
	    font-size: 16px;
	    margin-bottom: 15px;
	    color: #555;
	}
	
	.info-section ul {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}
	
	.info-section li {
	    display: flex; /* Flexbox로 정렬 */
	    justify-content: space-between; /* 왼쪽과 오른쪽 요소를 양쪽 정렬 */
	    font-size: 14px;
	    margin-bottom: 10px; /* 간격 조정 */
	}
	
	.info-section li span {
	    font-weight: bold;
	    color: #333;
	}
	
	.info-section li .right {
	    font-weight: normal; /* 오른쪽 텍스트는 기본 글꼴 */
	    color: #555;
	}
	
	
	.total-amount {
	    text-align: center;
	    background-color: #f9f9f9;
	    padding: 10px;
	    border: 1px solid #ddd;
	    margin-top: 70px;
	}
	
	.total-amount p {
	    font-size: 14px;
	    margin: 0;
	    color: #555;
	}
	
	.total-amount strong {
	    font-size: 18px;
	    color: #333;
	}
	
	.total-amount span {
	    font-size: 12px;
	    color: #888;
	}
		



	/* step2 단계 관련 css */
	.customer-info-container {
	    max-width: 800px;
	    margin: 0 auto;
	    margin-top: 50px;
	    background-color: #ffffff;
	    padding: 20px;
	}
	
	.customer-info-container h2 {
	    font-size: 20px;
	    margin-bottom: 15px;
	    color: #333;
	}
	
	/* 전체 테이블 스타일 */
	.customer-info-table {
	    width: 100%;
	    border-collapse: collapse;
	    border-top: 2px solid black; /* 맨 위 테두리 검정색 */
	    border-bottom: 2px solid black; /* 맨 아래 테두리 검정색 */
	}
	
	/* 테이블 헤더 스타일 */
	.customer-info-table th {
	    background-color: #f5f5f5;
	    text-align: left;
	    padding: 10px;
	    font-weight: normal;
	    color: #666;
	    border: 1px solid #ddd;
	    width: 30%;
	}
	
	/* 테이블 셀 스타일 */
	.customer-info-table td {
	    padding: 10px;
	    border: 1px solid #ddd;
	    color: #333;
	}
	
	/* 맨 왼쪽 테두리 제거 */
	.customer-info-table th:first-child,
	.customer-info-table td:first-child {
	    border-left: none;
	}
	
	/* 맨 오른쪽 테두리 제거 */
	.customer-info-table th:last-child,
	.customer-info-table td:last-child {
	    border-right: none;
	}

	
	/* 예약 환불 규정 관련 CSS */
	.reservation-cancel-container {
	    max-width: 800px;
	    margin: 0 auto;
	    background-color: #ffffff;
	    padding: 20px;
	}
	
	.reservation-cancel-container h2 {
	    font-size: 20px;
	    margin-bottom: 20px;
	    color: #333;
	}
	
	/* 전체 표 기본 스타일 */
	.cancel-table {
	    width: 100%;
	    border-collapse: collapse;
	    text-align: center;
	    border-top: 2px solid black; /* 맨 위 테두리 검정색 */
	    border-bottom: 2px solid black; /* 맨 아래 테두리 검정색 */
	}
	
	/* 기본 셀 테두리 */
	.cancel-table th, 
	.cancel-table td {
	    border: 1px solid #ddd; /* 기본 테두리 */
	    padding: 12px;
	    font-size: 14px;
	    color: #333;
	}
	
	/* 맨 왼쪽 테두리 제거 */
	.cancel-table th:first-child, 
	.cancel-table td:first-child {
	    border-left: none;
	}
	
	/* 맨 오른쪽 테두리 제거 */
	.cancel-table th:last-child, 
	.cancel-table td:last-child {
	    border-right: none;
	}

	/* 이용 약관 관련 css */
.terms-container {
    max-width: 770px;
    margin: 0 auto;
    margin-right : 550px;
    background-color: #ffffff;
    padding: 20px;
}

.terms-title {
    font-size: 24px;
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

.terms-section {
    margin-bottom: 20px;
}

.terms-subtitle {
    font-size: 18px;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
}

.terms-content {
    max-height: 200px;
    overflow-y: scroll;
    border: 1px solid #ddd;
    padding: 10px;
    background-color: #f9f9f9;
    font-size: 14px;
    line-height: 1.6;
    color: #555;
}

.agreement {
    text-align: center;
    margin: 20px 0;
    font-size: 14px;
    color: #333;
}

.agreement input[type="checkbox"] {
    margin-right: 5px;
}

.button-group {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

button {
	width : 300px;
    padding: 10px 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    background-color: #fff;
    transition: background-color 0.3s ease, color 0.3s ease;
}

button:hover {
    background-color: #f0f0f0;
}

.prev-btn {
    color: #333;
}

.next-btn {
    color: #fff;
    background-color: #8b7e6a;
    border-color: #8b7e6a;
}

.next-btn:disabled {
    background-color: #ddd;
    color: #888;
    cursor: not-allowed;
}

/* 투숙인원 영역 관련 css */
    .guest-container {
        width: 100%;
        max-width: 760px;
        margin: 0 auto;
        border-collapse: collapse;
        font-size: 18px;
    }

    .guest-header {
        background-color: #f5f5f5;
        color: #333;
        font-size : 18px;
        padding: 10px 15px;
        font-weight: bold;
        text-align: left;
        border-top: 2px solid black; /* 맨 위 테두리 검정색 */
    }

    .guest-row {
        display: flex;
        justify-content: space-between;
        font-size : 16px;
        align-items: center;
        padding: 10px 15px;
        border-left: none; /* 왼쪽 테두리 제거 */
        border-right: none; /* 오른쪽 테두리 제거 */
    }
    
     /* 두 번째 guest-row의 마지막 테두리 추가 */
    .guest-row:last-child {
        border-bottom: 2px solid black; /* 맨 아래 테두리 검정색 */
    }

    .guest-controls {
        display: flex;
        align-items: center;
        gap: 10px;
    }

.guest-controls button {
    display: flex; /* Flexbox 활성화 */
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    width: 30px;
    height: 30px;
    border: 1px solid #ccc;
    background-color: #fff;
    color: #333;
    font-size: 16px; /* 글씨 크기 조정 */
    cursor: pointer;
    border-radius: 4px;
    transition: all 0.3s;
}

    .guest-controls button:disabled {
        color: #ccc;
        border-color: #eee;
        cursor: not-allowed;
    }

    .guest-controls button:hover:not(:disabled) {
        background-color: #f0f0f0;
    }

    .guest-number {
        min-width: 50px;
        text-align: center;
        font-size: 14px;
        color: #000;
        visibility: visible; /* 보이도록 설정 */
    }

        



</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	  <div class="reservation-menu">
	    <div class="menu-item active">
	      <div class="icon">
	        <img src="${pageContext.request.contextPath}/resources/images/room/bed.png">
	      </div>
	      <span>객실</span>
	    </div>
	    <div class="menu-item">
	      <div class="icon">
	        <img src="${pageContext.request.contextPath}/resources/images/room/locker.png">
	      </div>
	      <span>락커</span>
	    </div>
	    <div class="menu-item">
	      <div class="icon">
	        <img src="${pageContext.request.contextPath}/resources/images/room/lift.png">
	      </div>
	      <span>리프트</span>
	    </div>
	    <div class="menu-item">
	      <div class="icon">
	        <img src="${pageContext.request.contextPath}/resources/images/room/package.png">
	      </div>
	      <span>패키지</span>
	    </div>
	  </div>
  
    <div class="reservation-steps">
	    <span class="step">STEP1. 객실/날짜 선택</span>
	    <span class="step active">STEP2. 예약정보 입력</span>
	    <span class="step">STEP3. 예약정보 확인</span>
	    <span class="step">STEP4. 예약완료</span>
    </div>

<div class="reservation-container">
    <!-- 왼쪽 고객 정보 및 취소 규정 (수직 배치) -->
    <div class="content-container">
        <!-- 고객 정보 -->
        <div class="customer-info-container">
            <h2>고객 정보</h2>
            <table class="customer-info-table">
                <tr>
                    <th>성명 (한글)</th>
                    <td>${m.memberName}</td>
                </tr>
                <tr>
                    <th>휴대전화</th>
                    <td><input type="text" name="phone" placeholder=" - 포함"/></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${m.email}</td>
                </tr>
            </table>
        </div>
        
        
    <div class="guest-container">
        <div class="guest-header">투숙 인원</div>
        <div class="guest-row">
            <span>성인</span>
            <div class="guest-controls">
                <button id="adultMinus" disabled>-</button>
                <span id="adultCount" class="guest-number">0명</span>
                <button id="adultPlus">+</button>
            </div>
        </div>
        <div class="guest-row">
            <span>어린이</span>
            <div class="guest-controls">
                <button id="childMinus" disabled>-</button>
                <span id="childCount" class="guest-number">0명</span>
                <button id="childPlus">+</button>
            </div>
        </div>
    </div>        

        <!-- 예약 취소 규정 -->
        <div class="reservation-cancel-container">
            <h2>예약 취소 규정</h2>
            <table class="cancel-table">
                <thead>
                    <tr>
                        <th rowspan="2">취소 및 변경 구분</th>
                        <th colspan="2">피크 시즌</th>
                        <th colspan="2">피크 시즌 이외</th>
                    </tr>
                    <tr>
                        <th>주중</th>
                        <th>주말<br>(금,토,공휴일 전일)</th>
                        <th>주중</th>
                        <th>주말<br>(금,토,공휴일 전일)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>사용예정일 7일 전 취소/변경</td>
                        <td>없음</td>
                        <td>없음</td>
                        <td>없음</td>
                        <td>없음</td>
                    </tr>
                    <tr>
                        <td>사용예정일 6~5일 전 취소/변경</td>
                        <td>총 요금의 20%</td>
                        <td>총 요금의 30%</td>
                        <td>없음</td>
                        <td>총 요금의 10%</td>
                    </tr>
                    <tr>
                        <td>사용예정일 4일 전 취소/변경</td>
                        <td>총 요금의 30%</td>
                        <td>총 요금의 40%</td>
                        <td>총 요금의 20%</td>
                        <td>총 요금의 30%</td>
                    </tr>
                    <tr>
                        <td>사용예정일 3일 전 취소/변경</td>
                        <td>총 요금의 50%</td>
                        <td>총 요금의 60%</td>
                        <td>총 요금의 30%</td>
                        <td>총 요금의 50%</td>
                    </tr>
                    <tr>
                        <td>사용예정일 2일 전 취소/변경</td>
                        <td>총 요금의 80%</td>
                        <td>총 요금의 90%</td>
                        <td>총 요금의 50%</td>
                        <td>총 요금의 80%</td>
                    </tr>
                    <tr>
                        <td>사용예정일 1일 전 취소/변경</td>
                        <td>총 요금의 90%</td>
                        <td>총 요금의 90%</td>
                        <td>총 요금의 80%</td>
                        <td>총 요금의 90%</td>
                    </tr>
                    <tr>
                        <td>사용예정일 당일 취소</td>
                        <td>총 요금의 100%</td>
                        <td>총 요금의 100%</td>
                        <td>총 요금의 90%</td>
                        <td>총 요금의 100%</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 오른쪽 예약 정보 -->
    <div class="reservation-info">
        <h2>예약정보</h2>
        <div class="info-section">
            <h3>01. 일정</h3>
		    <ul>
		        <li>
		            <span>체크인</span>
		            <span class="right">${checkInDate}</span>
		        </li>
		        <li>
		            <span>체크아웃</span>
		            <span class="right">${checkOutDate}</span>
		        </li>
		        <li>
		            <span>숙박일수</span>
		            <span class="right">${stayDays}박</span>
		        </li>
		        <li>
		            <span>투숙인원</span>
		            <span class="right">${r.capacity}인</span>
		        </li>
		    </ul>
        </div>
        <hr style="margin-top:25px;">
        <div class="info-section">
            <h3>02. 객실</h3>
            <ul>
                <li>${r.roomType} ${r.roomName}</li>
                <li>${r.roomPrice} X ${stayDays}박</li>
            </ul>
        </div>
        <div class="total-amount">
            <p>요금합계</p>
            <strong id="totalPrice"></strong>
            <span>(VAT 포함)</span>
        </div>
    </div>
</div>
<div class="terms-container">
        <h1 class="terms-title">이용 약관 동의</h1>
        <div class="terms-section">
            <h2 class="terms-subtitle">예약규약 (필수)</h2>
            <div class="terms-content">
                <p><strong>제 1조 (목적)</strong></p>
                <p>
                    이 규정은 평창 알펜시아 리조트 이용하기 위하여 예약접수를 한 고객(이하 “예약자”)이 체결한 예약의 세부 이행 및 준수사항을 정함을 목적으로 합니다.
                </p>
                <p><strong>제 2조 (평창 알펜시아 리조트와 예약자의 의무)</strong></p>
                <p>
                    평창 알펜시아 리조트는 예약자에게 예약서비스를 제공하기 위하여 예약수립 및 실행과정에서 맡은 바 임무를 충실히 수행하여야 합니다.<br>
                    예약자는 안전하고 즐거운 여행을 위하여 평창 알펜시아 리조트의 예약규정 및 질서 유지에 적극 협조하여야 합니다.
                </p>
                <p>... (추가 내용)</p>
            </div>
        </div>
        <div class="agreement">
            <label>
                <input type="checkbox" id="agreeCheckbox">
                아래 약관에 동의합니다.
            </label>
        </div>
        <div class="button-group">
            <button class="prev-btn">이전단계</button>
            <button class="next-btn" id="nextButton" disabled>다음단계</button>
        </div>
    </div>
    
    <form id="reservationForm" action="payStep3.ro" method="post">
   		<input type="hidden" id="memberNo" name="memberNo" value="${m.memberNo}">
    	<input type="hidden" id="checkInDate" name="checkInDate" value="${checkInDate}">
    	<input type="hidden" id="checkOutDate" name="checkOutDate" value="${checkOutDate}">
    	<input type="hidden" id="stayDays" name="stayDays" value="${stayDays}">
    	<input type="hidden" id="phone" name="phone" value="">
    	<input type="hidden" id="adult" name="adult" value="">
    	<input type="hidden" id="child" name="child" value="">
   		<input type="hidden" id="roomNo" name="roomNo" value="${r.roomNo}">
	</form>
    <script>
    	// 객실 전체 가격에 콤마 찍기 
	    // 총 가격 계산
	    const totalPrice = ${r.roomPrice * stayDays};
	
	    // 세 자리마다 콤마 추가
	    const formattedPrice = totalPrice.toLocaleString() + "원";
	
	    // HTML에 표시
	    document.getElementById("totalPrice").textContent = formattedPrice;    	
	    
    
        // 약관 동의 여부에 따라 버튼 활성화/비활성화
        document.getElementById('agreeCheckbox').addEventListener('change', function() {
            document.getElementById('nextButton').disabled = !this.checked;
        });
        
     // 객실의 최대 투숙 인원을 설정 (예: 4명)
		// 최대 투숙 인원 설정
		const maxCapacity = ${r.capacity};
		
		// 초기 인원 설정
		let adultCount = 0;
		let childCount = 0;
		
		// DOM 요소 가져오기
		const adultMinus = document.getElementById("adultMinus");
		const adultPlus = document.getElementById("adultPlus");
		const childMinus = document.getElementById("childMinus");
		const childPlus = document.getElementById("childPlus");
		const adultCountSpan = document.getElementById("adultCount");
		const childCountSpan = document.getElementById("childCount");
		
		// 인원 업데이트 함수
		function updateCounts() {
		    const totalGuests = adultCount + childCount;
		
		    // 마이너스 버튼 비활성화 조건
		    adultMinus.disabled = adultCount === 0;
		    childMinus.disabled = childCount === 0;
		
		    // 플러스 버튼 비활성화 조건
		    adultPlus.disabled = totalGuests >= maxCapacity;
		    childPlus.disabled = totalGuests >= maxCapacity;
		
		    // 화면에 인원 업데이트
		    adultCountSpan.textContent = adultCount + "명";
		    childCountSpan.textContent = childCount + "명";
		}
		
		// 이벤트 리스너 추가
		adultPlus.addEventListener("click", function () {
		    if (adultCount + childCount < maxCapacity) {
		        adultCount++;
		        updateCounts();
		    }
		});
		
		adultMinus.addEventListener("click", function () {
		    if (adultCount > 0) {
		        adultCount--;
		        updateCounts();
		    }
		});
		
		childPlus.addEventListener("click", function () {
		    if (adultCount + childCount < maxCapacity) {
		        childCount++;
		        updateCounts();
		    }
		});
		
		childMinus.addEventListener("click", function () {
		    if (childCount > 0) {
		        childCount--;
		        updateCounts();
		    }
		});
		
		// 초기 상태 업데이트
		updateCounts();
		
		
		// 다음단계 버튼 클릭 시 전화번호랑 투숙인원 데이터 넘기면서 컨트롤러로 요청
$(document).ready(function () {
    $('#nextButton').on('click', function () {
        // 입력된 데이터 가져오기
        const phone = $('.customer-info-table input[type="text"]').val().trim(); // 전화번호 입력값
        const adult = adultCount; // 
        const child = childCount;

        const roomNo = $('#roomNo').val(); // 숨겨진 필드에서 객실 번호 가져오기
        const checkInDate = $('#checkInDate').val();
        const checkOutDate = $('#checkOutDate').val();
        const stayDays = $('#stayDays').val();

        // 유효성 검사
        if (!phone) {
            alert("전화번호를 입력해주세요.");
            return;
        }
        if (adult === 0 && child === 0) {
            alert("투숙 인원을 선택해주세요.");
            return;
        }
        if (!roomNo) {
            alert("객실 번호가 누락되었습니다.");
            return;
        }

        // 숨겨진 필드 업데이트
        $('#phone').val(phone); 
        $('#adult').val(adult);
        $('#child').val(child);
        $('#roomNo').val(roomNo);
        $('#checkInDate').val(checkInDate);
        $('#checkOutDate').val(checkOutDate);
        $('#stayDays').val(stayDays);

        // 폼 제출 (POST 방식)
       $('#reservationForm').submit();
    });
});

 


    </script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>