<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/pack/packagePayStep.css">
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
            packageNo: ${p.packageNo}
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
	    <span class="step active">STEP2. 예약정보 확인</span>
	    <span class="step">STEP3. 예약완료</span>
    </div>

<div class="package-container">
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
                    <td>${m.phone}</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${m.email}</td>
                </tr>
            </table>
        </div>
        
     

        <!-- 예약 취소 규정 -->
        <div class="package-cancel-container">
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
    <div class="package-info">
        <h2>예약정보</h2>
        <div class="info-section">
            <h3>01. 패키지 정보</h3>
		    <ul>
		        <li>
		            <span>패키지명</span>
		            <span class="right">${p.packageName}</span>
		        </li>
		        <li>
		            <span>이용기간</span>
		            <span class="right">${p.availableStartDate} ~ ${p.availableEndDate}</span>
		        </li>
		    </ul>
        </div>
         <hr style="margin-top:25px;">
        <div class="info-section">
            <h3>02. 금액</h3>
            <ul>
                <li>${p.packagePrice}원 * 1매</li>
            </ul>
        </div>
        <div class="total-amount">
            <p>요금합계</p>
            <strong id="totalPrice">${p.packagePrice}원</strong>
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
                    이 규정은 당산 설레눈 리조트 이용하기 위하여 예약접수를 한 고객(이하 “예약자”)이 체결한 예약의 세부 이행 및 준수사항을 정함을 목적으로 합니다.
                </p>
                <p><strong>제 2조 (당산 설레눈 리조트와 예약자의 의무)</strong></p>
                <p>
                    당산 설레눈 리조트는 예약자에게 예약서비스를 제공하기 위하여 예약수립 및 실행과정에서 맡은 바 임무를 충실히 수행하여야 합니다.<br>
                    예약자는 안전하고 즐거운 여행을 위하여 당산 설레눈 리조트의 예약규정 및 질서 유지에 적극 협조하여야 합니다.
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
            <button class="prev-btn">결제 취소</button>
            <button class="next-btn" id="nextButton" onclick="serverAuth();" disabled>결제하기</button>
        </div>
    </div>

    <script>

	    // 총 가격 계산
	    const totalPrice = ${p.packagePrice};
	
	    // 세 자리마다 콤마 추가
	    const formattedPrice = totalPrice.toLocaleString() + "원";
	
	    // HTML에 표시
	    document.getElementById("totalPrice").textContent = formattedPrice;    	
	    
    
        // 약관 동의 여부에 따라 버튼 활성화/비활성화
        document.getElementById('agreeCheckbox').addEventListener('change', function() {
            document.getElementById('nextButton').disabled = !this.checked;
        });

	
    </script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>