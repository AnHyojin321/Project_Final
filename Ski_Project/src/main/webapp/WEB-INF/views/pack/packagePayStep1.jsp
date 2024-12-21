<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/pack/packagePayStep.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<style>
/* 공통 스타일 */
.conditional-inputs {
    display: flex;
    flex-direction: row; /* 가로 배치 */
    gap: 16px; /* 입력란 간 간격 */
    width: 760px;
    max-width: 800px; /* 넓이를 늘려서 두 개가 나란히 보이게 */
    justify-content: space-between; /* 입력란 간 간격 조정 */
    margin-left : 25px;
    border-top : 2px solid black;
    border-bottom : 2px solid black;
}

.styled-input {
    display: flex;
    flex-direction: column;
    padding: 10px;
    flex: 1; /* 입력란 너비를 균등하게 */
}

.styled-input label {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 8px;
    color: #333;
}

.styled-input input[type="date"] {
    width: 100%;
    font-size: 14px;
    padding: 8px;
    box-sizing: border-box;
    border : none;
}

.styled-input input[type="date"]:focus {
    border-color: #000;
    outline: none;
}

#dateInputs {
    display: none; /* 기본적으로 숨김 */
}

#dateInputs.active {
    display: flex; /* 'active' 클래스가 추가되면 표시 */
}






</style>

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
	    <span class="step">STEP3. 결제하기</span>
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
        
	   <div class="conditional-inputs" id="dateInputs">
	        <div class="styled-input" data-type="date">
	            <label class="input-label" for="checkInDate">체크인 날짜</label>
	            <input type="date" id="checkInDateInput">
	        </div>
	
	        <div class="styled-input" data-type="date">
	            <label class="input-label" for="checkOutDate">체크아웃 날짜</label>
	            <input type="date" id="checkOutDateInput">
	        </div>
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
            <button class="prev-btn">이전으로</button>
            <button type="submit" class="next-btn" id="nextButton" disabled>다음단계</button>
        </div>
    </div>
    
    <form id="packagePayForm" action="payStep2.pk" method="post">
	    <!-- 회원번호와 패키지번호는 숨김 필드로 전송 -->
	    <input type="hidden" name="memberNo" value="${m.memberNo}">
	    <input type="hidden" name="packageNo" value="${p.packageNo}">
	    <input type="hidden" id="checkInDate" name="checkInDate" value="">
	    <input type="hidden" id="checkOutDate" name="checkOutDate" value="">
	</form>

    <script>
	    $(document).ready(function () {
	        const packageNameSpan = $('.right');
	        const maxLength = 25;
	
	        packageNameSpan.each(function () {
	            const fullText = $(this).text();
	            if (fullText.length > maxLength) {
	                $(this).text(fullText.substring(0, maxLength) + '...');
	            }
	        });
	    });


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
        
     // Simulating packageSet
        const packageSet = ${p.packageSet}; // Replace this with dynamic data
        console.log(packageSet);

        // Wait for DOM to fully load
        document.addEventListener('DOMContentLoaded', () => {
            const dateInputs = document.getElementById('dateInputs');

            // Reset classes
            dateInputs.classList.remove('active');

            // Conditionally show date inputs
            if (packageSet === 1 || packageSet === 3) {
                dateInputs.classList.add('active');
            }
        });

        
     // 체크인 날짜와 체크아웃 날짜를 제한하고, 잘못된 선택 시 경고를 표시하는 스크립트

        const checkInDateInput = document.getElementById('checkInDateInput');
        const checkOutDateInput = document.getElementById('checkOutDateInput');
        
        

        // 가용 날짜 범위 설정 (백엔드에서 제공된 데이터로 설정)
        let availableStartDate = "${p.availableStartDate}"; // 예시 값, 실제 데이터로 대체
        let availableEndDate = "${p.availableEndDate}"; // 예시 값, 실제 데이터로 대체
     	
        // 현재 날짜
        const day = new Date();
        day.setHours(0, 0, 0, 0); // 시간을 00:00:00으로 초기화

        // 로컬 날짜를 YYYY-MM-DD 형식으로 변환
        const today = day.getFullYear() + '-' +
            String(day.getMonth() + 1).padStart(2, '0') + '-' +
            String(day.getDate()).padStart(2, '0');

        console.log(today); // 결과 확인


        checkInDateInput.addEventListener('change', () => {
            const checkInDate1 = new Date(checkInDateInput.value);
            if (checkInDate1) {
            	// 체크인 날짜가 현재 날짜 이후인지 확인
                if (checkInDate1 < today) {
                    alert("체크인 날짜는 오늘(" + today + ") 이후여야 합니다.");
                    checkInDateInput.value = '';
                    return;
                }
                // 체크인 날짜가 범위 내인지 확인
                if (checkInDate1 < new Date(availableStartDate) || checkInDate1 > new Date(availableEndDate)) {
                    alert("패키지 이용가능일은 " + availableStartDate + " ~ " + availableEndDate + " 입니다.");
                    checkInDateInput.value = '';
                    return;
                }
            }
        });

        checkOutDateInput.addEventListener('change', () => {
        	const checkInDate1 = new Date(checkInDateInput.value);
            const checkOutDate2 = new Date(checkOutDateInput.value);

            if (checkOutDate2) {
                // 체크아웃 날짜가 범위 내인지 확인
                if (checkOutDate2 < new Date(availableStartDate) || checkOutDate2 > new Date(availableEndDate)) {
                    alert("패키지 이용가능일은 " + availableStartDate + " ~ " + availableEndDate + " 입니다.");
                    checkOutDateInput.value = '';
                    return;
                }

                // 체크아웃 날짜가 체크인 날짜보다 이전인지 확인
                if (checkInDate1 && checkOutDate2 <= checkInDate1) {
                    alert("체크아웃 날짜는 체크인 날짜 이후여야 합니다.");
                    checkOutDateInput.value = '';
                    return;
                }
     

                // 체크아웃 날짜가 체크인 날짜의 하루 뒤인지 확인
                if (checkInDate1) {
                    const nextDay = new Date(checkInDate1);
                    nextDay.setDate(checkInDate1.getDate() + 1);

                    if (checkOutDate2.getTime() !== nextDay.getTime()) {
                        alert("패키지 상품의 경우 객실은 1박만 가능합니다.");
                        checkOutDateInput.value = '';
                        return;
                    }
                }
            }
        });
        
        $(document).ready(function () {
            $('#nextButton').on('click', function () {

            	const checkInDateInput = document.getElementById('checkInDateInput');
                const checkOutDateInput = document.getElementById('checkOutDateInput');
                
                const checkInDate = checkInDateInput.value;
                const checkOutDate = checkOutDateInput.value;
                
                console.log(checkInDate);
                console.log(checkOutDate);
                

                
                // 숨겨진 필드에 값 설정
                $('#checkInDate').val(checkInDate);
                $('#checkOutDate').val(checkOutDate);
                
                if(!checkInDate || !checkOutDate) {
                	alert("체크인/체크아웃 날짜를 선택해주세요.");
                	return;
                }
                
             // 폼 제출 (POST 방식)
              $('#packagePayForm').submit();
            	
            });
        });
        





	
    </script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>