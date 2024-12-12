<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	
	/* 예약자 정보 관련 css */
	/* 기본 스타일 */
	body {
	    font-family: 'Arial', sans-serif;
	    margin: 0;
	    padding: 0;
	}
	
	h1, h2 {
	    margin: 0;
	    font-weight: bold;
	}
	
	h1.page-title {
	    margin-top: 20px;
	    font-size: 24px;
	}
	
	hr {
	    border: 1px solid #ddd;
	    margin: 10px 0;
	}
	
	.reservation-check-container {
	    max-width: 1000px;
	    margin: 20px auto;
	    margin-top : 50px;
	    background: #fff;
	    padding: 20px;
	}
	
	.reservation-details {
	    margin-top: 20px;
	}
	
	.hotel-info, .customer-info {
	    flex: 1;
	    margin-right: 20px;
	}
	
	.hotel-info {
		margin-bottom : 20px; 
	}
	
	.customer-info {
		margin-top : 20px;
	}
	
	.hotel-info ul, .customer-info ul {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}
	
	.hotel-info ul li, .customer-info ul li {
	    margin: 5px 0;
	    font-size: 16px;
	}
	
	.hotel-info ul li span, .customer-info ul li span {
	    float: right;
	    font-weight: bold;
	}
	
	.total-price {
	    margin-top: 20px;
	    font-size: 23px;
	    color: #333;
	    font-weight: bold;
	    text-align: right;
	}
	
	.info-message {
	    margin-top: 20px;
	    text-align: center;
	    font-size: 16px;
	    color: #666;
	}
	
	.button-group {
	    display: flex;
	    justify-content: space-between;
	    margin-top: 20px;
	}
	
	button {
		width : 300px;
	    padding: 10px 20px;
	    border: none;
	    cursor: pointer;
	    font-size: 14px;
	}
	
	.prev-btn {
	    background-color: #f0f0f0;
	    color: #333;
	}
	
	.pay-btn {
	    background-color: #8c6b4f;
	    color: #fff;
	}
	
	button:hover {
	    opacity: 0.8;
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
	    <span class="step">STEP2. 예약정보 입력</span>
	    <span class="step active">STEP3. 예약정보 확인</span>
	    <span class="step">STEP4. 예약완료</span>
    </div>
    
    
        <div class="reservation-check-container">
        <h1 class="page-title">예약 정보 확인</h1>
        <hr>
        <div class="reservation-details">
            <div class="hotel-info">
                <h2>설레눈 리조트</h2>
                <p>${r.roomType} ${r.roomName}</p>
               <!--<p>(2 Single Standard Ondol Furnished Balcony)</p>  --> 
                <ul>
                    <li>· 체크인 <span>${checkInDate}</span></li>
                    <li>· 체크아웃 <span>${checkOutDate}</span></li>
                    <li>· 숙박일수 <span>${stayDays}박</span></li>
                    <li>· 투숙인원 <span>성인 ${adult}명 어린이 ${child}명</span></li>
                    <li>· 결제금액 <span>${r.roomPrice} X ${stayDays}박</span></li>
                </ul>
                <div class="total-price">
                    <strong id="totalPrice"> </strong><strong>&nbsp;&nbsp; (VAT 포함)</strong>
                </div>
            </div>
            <hr>
            <div class="customer-info">
                <h2>고객 정보</h2>
                <ul>
                    <li>· 성명(한글) <span>안효진</span></li>
                    <li>· 휴대전화 <span>${phone}</span></li>
                    <li>· 이메일 <span>anhj321@naver.com</span></li>
                </ul>
            </div>
        </div>
        <p class="info-message">예약 정보를 확인하신 후, 결제를 진행해 주세요.</p>
        <div class="button-group">
            <button class="prev-btn">이전단계</button>
            <button class="pay-btn">결제하기</button>
        </div>
    </div>
    
    <script>
	 	// 객실 전체 가격에 콤마 찍기
	    // 예제 데이터
	    const r = { roomPrice: 100000 }; // 객실 가격
	    const stayDays = 3; // 숙박일 수
	
	    // 총 가격 계산
	    const totalPrice = ${r.roomPrice * stayDays};
	
	    // 세 자리마다 콤마 추가
	    const formattedPrice = totalPrice.toLocaleString() + "원";
	
	    // HTML에 표시
	    document.getElementById("totalPrice").textContent = formattedPrice;    
    </script>
	
<jsp:include page="../common/footer.jsp" />

</body>
</html>