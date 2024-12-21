<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://pay.nicepay.co.kr/v1/js/"></script> <!-- Server 승인 운영계 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
function serverAuth() {

    // HTML에서 totalPrice 값을 가져오기
    var totalPrice = document.getElementById("totalPrice").innerText.trim();

    // 숫자 값만 추출
    totalPrice = parseInt(totalPrice.replace(/[^0-9]/g, ''), 10);

   
    // 세션에 데이터 저장을 요청 (FormData 형태로 전송)
    $.ajax({
        url: 'storeSessionData.pk', // 서버 URL
        type: 'POST', // 요청 방식
        data: {
            memberNo: ${m.memberNo},
            packageNo: ${p.packageNo},
            checkInDate : '${checkInDate}',
            checkOutDate : '${checkOutDate}'
        },
        success: function(data) {
            if (data.status === 'success') {
                // 세션 저장 성공 후 결제 요청 실행
                AUTHNICE.requestPay({
                    clientId: 'S2_99ba9edee4764a5991018289cfd6308e',
                    method: 'card',
                    orderId: '02e16b8c-779d-497f-b54d-07521212175d',
                    amount: totalPrice,
                    goodsName: "${p.packageName}",
                    returnUrl: "http://localhost:8090/ski/payResult.pk",
                    fnError: function(result) {
                        alert('결제 실패: ' + result.errorMsg);
                    }
                });
            } else {
                alert('세션 데이터 저장 실패: ' + data.message);
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류: ", error);
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });

}



</script>

<style>
	/* step1 과 공통 css 영역 */
	.package-menu {
	  display: flex;
	  justify-content: center;
	  align-items: center;
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
	
	.package-steps {
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
	
	
	/* 쿠폰 사용 모달창 관련 css */
/* 모달 기본 스타일 */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    z-index: 1000;
    justify-content: center;
    align-items: center;
}

/* 모달 내용 스타일 */
.modal-content {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    width: 400px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    position: relative;
}

/* 제목 스타일 */
.modal-content h2 {
    font-size: 20px;
    margin-bottom: 20px;
    font-weight: bold;
}

/* 라디오 버튼 스타일 */
.modal-content label {
    display: block;
    font-size: 14px;
    margin-bottom: 10px;
    text-align: left;
}

/* 버튼 스타일 */
.apply-btn {
    padding: 10px 20px;
    background-color: white;
    color: black;
    border: 1px solid black;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    margin-top: 20px;
    width: 100%;
}

.coupon-btn:hover, .apply-btn:hover {
    background-color: #f2f2f2;
}

/* 닫기 버튼 스타일 */
.close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
}



</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	  <div class="package-menu">
	    <div class="menu-item">
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
	    <div class="menu-item active">
	      <div class="icon">
	        <img src="${pageContext.request.contextPath}/resources/images/room/package.png">
	      </div>
	      <span>패키지</span>
	    </div>
	  </div>
  
    <div class="package-steps">
	    <span class="step">STEP1. 패키지 선택</span>
	    <span class="step">STEP2. 예약정보 확인</span>
	    <span class="step active">STEP3. 결제하기</span>
    </div>
    
    
        <div class="reservation-check-container">
        <h1 class="page-title">예약 정보 확인</h1>
        <hr>
        <div class="reservation-details">
            <div class="hotel-info">
                <h2>설레눈 리조트</h2>
                <p>${p.packageName }</p>
               <!--<p>(2 Single Standard Ondol Furnished Balcony)</p>  --> 
                <ul>
                    <li>· 상품번호 <span>#${p.packageNo}</span></li>
                    <li>· 패키지 구성 <span>${p.productComposit}</span></li>
                    <li>· 예약 날짜 <span>${checkInDate} ~ ${checkOutDate}</span></li>
                    <li>· 결제금액 <span>${p.packagePrice}원</span></li>
                </ul>
                <div class="total-price">
                    <strong id="totalPrice"> </strong><strong>&nbsp;&nbsp; (VAT 포함)</strong>
                </div>
            </div>
            <hr>
            <div class="customer-info">
                <h2>고객 정보</h2>
                <ul>
                    <li>· 성명(한글) <span>${m.memberName}</span></li>
                    <li>· 휴대전화 <span>${m.phone}</span></li>
                    <li>· 이메일 <span>${m.email}</span></li>
                </ul>
            </div>
        </div>
        <p class="info-message">예약 정보를 확인하신 후, 결제를 진행해 주세요.</p>
        <div class="button-group">
            <button class="prev-btn" onclick="history.back();">이전단계</button>
            <button class="pay-btn" onclick="serverAuth()">결제하기</button>
        </div>
    </div>

    

    
    <script>
    
    // 총 가격 계산
    const totalPrice = ${p.packagePrice};

    // 세 자리마다 콤마 추가
    const formattedPrice = totalPrice.toLocaleString() + "원";

    // HTML에 표시
    document.getElementById("totalPrice").textContent = formattedPrice;  
    


    </script>
    
	
<jsp:include page="../common/footer.jsp" />

</body>
</html>