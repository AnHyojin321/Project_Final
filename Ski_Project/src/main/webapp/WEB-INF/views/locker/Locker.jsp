<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
    }


	.hero {
	    position: relative;
	    background: url('${pageContext.request.contextPath}/resources/images/locker/22.png') no-repeat center center;
    	background-size: 100% 100%; /* 가로는 100%, 세로는 비율에 맞게 자동 조정 */
	    height: 500px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}


  .overlay {
    text-align: center;
    color: #fff;
    background: rgba(0, 0, 0, 0.5);
    padding: 20px;
    border-radius: 10px;
  }

  .hero .overlay h1 {
      font-size: 36px;
      margin: 0;
    }

    .hero .overlay p {
      font-size: 18px;
      margin: 10px 0;
    }

  .search-box {
    margin-top: 100px;
    background: rgba(255, 255, 255, 0.9);
    padding: 15px 20px;
    border-radius: 10px;
    display: inline-block;
    text-align: left;
  }

  .search-box form {
    display: flex;
    gap: 15px;
    align-items: center;
  }

  .input-group {
    display: flex;
    flex-direction: column;
  }

  .input-group label {
    font-size: 14px;
    margin-bottom: 5px;
    color: #333;
  }

  .input-group input,
  .input-group select {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
  }

  .search-btn {
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
  }

  .search-btn:hover {
    background-color: #555;
  }

    .content {
      text-align: center;
      padding: 40px 20px;
    }

    .content h2 {
      font-size: 28px;
      margin-bottom: 10px;
    }

    .content p {
      color: #555;
      font-size: 18px;
      line-height: 1.5;
    }
    
    a {
	    text-decoration: none; /* 밑줄 제거 */
	    color: black; /* 글씨 색상을 검정색으로 */
	}

    .rooms {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 20px;
      padding: 20px;
      max-width: 1200px;
      margin: 0 auto;
    }

    .room {
      background: #fff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      transition: transform 0.3s;
    }

    .room:hover {
      transform: scale(1.05);
    }

    .room img {
      width: 100%;
      height: 300px;
      object-fit: cover;
    }

    .room-details {
      padding: 15px;
    }

    .room-details h3 {
      margin: 0;
      font-size: 20px;
    }

    .room-details p {
      color: #777;
      font-size: 14px;
      margin: 10px 0;
    }

    .room-details .btn {
      display: inline-block;
      background: #c9a53b;
      color: #fff;
      padding: 8px 12px;
      border-radius: 4px;
      text-decoration: none;
      font-size: 14px;
    }

    /*-------------------*/

	.garden {
	  display: flex;
	  align-items: center;
	  padding: 40px 20px;
	  background-color: #f5f5f5;
	}
	
	.garden-content {
	  display: flex;
	  gap: 20px;
	  max-width: 1200px;
	  margin: 0 auto;
	  padding-left: 20px; /* 왼쪽 간격을 넓힘 */
	}
	
	.garden-img {
	  width: 50%;
	  border-radius: 8px;
	}
	
	.garden-text {
	  padding-left : 20px;
	  width: 50%;
	  display: flex;
  	  flex-direction: column;
  	  justify-content: center; /* 텍스트 수직 중앙 정렬 */
	}
	
	.garden-text h2 {
	  font-size: 28px;
	  margin-bottom: 10px;
	}
	
	.garden-text p {
	  
	  font-size: 16px;
	  color: #555;
	  line-height: 1.8; /* 문장 간격을 넓힘 */
	  letter-spacing: 0.5px; /* 문자 간격을 넓힘 */
	}

	.garden-text a {
	    text-align : right;
		padding-bottom : 10px;
	}


	
	  .facilities {
	    padding: 40px 20px;
	    text-align: center;
	  }
	
	  .facilities h2 {
	    font-size: 28px;
	    margin-bottom: 20px;
	  }
	
  /* 슬라이드 편의시설 */
  .carousel {
    position: relative;
    overflow: hidden;
    max-width: 1200px;
    margin: 0 auto;
  }

  .carousel-track {
    display: flex;
    transition: transform 0.3s ease-in-out;
  }

  .carousel-item {
    min-width: 33.33%; /* 한 번에 3개씩 보여지도록 */
    text-align: center;
    padding: 10px;
  }

  .carousel-item img {
    width: 100%;
    height: 350px;
    border-radius: 8px;
  }

  .carousel-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 50%;
    padding: 10px;
    cursor: pointer;
  }

  .prev-btn {
    left: 10px;
  }

  .next-btn {
    right: 10px;
  }
	  .prev-btn {
	    left: 10px;
	  }
	
	  .next-btn {
	    right: 10px;
	  }
	  
	     .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        /* 모달 내용 */
        .modal-content {
            background-color: #fff;
            overflow: hidden;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }

        /* 버튼 스타일 */
        .button-section button {
            background-color: #2a2a72;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1rem;
            cursor: pointer;
        }

        .button-section button:hover {
            background-color: white;
            color: #2a2a72;
        }

        /* 성공 및 실패 모달 메시지 */
        .success-message {
            color: green;
            font-size: 1.2rem;
        }

        .error-message {
            color: red;
            font-size: 1.2rem;
        }
        
          /* 이미지 섹션 */
        .image-section img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        /* 화면 하단에 고정된 버튼 */
.fixed-reserve-button {
    position: fixed;
    bottom: 0; /* 화면 하단에 고정 */
    left: 0;
    width: 100%; /* 전체 화면 너비 */
    background-color: white; /* 버튼 배경색 */
    color: #2a2a72;
    text-align: center;
    padding: 15px 0;
    font-size: 18px;
    font-weight: bold;
    border: none;
    cursor: pointer;
    z-index: 1000; /* 다른 요소 위에 표시되도록 설정 */
}

.fixed-reserve-button:hover {
    background-color: #2a2a72; /* 호버 시 색상 변경 */
    color:white;
}
        .room-info-container {
    display: grid;
    grid-template-columns: 1fr 1fr; /* 두 개의 컬럼 */
    gap: 20px;
    background-color: #f9f9f9;
    padding: 20px;
    margin: 20px auto;
    max-width: 1200px;
    border-radius: 10px;
}

.room-info-item {
    display: flex;
    flex-direction: column;
    padding: 10px 0;
}

.room-info-item strong {
    font-size: 16px;
    color: #2a2a72;
    margin-bottom: 5px;
}

.room-info-item p {
    font-size: 14px;
    color: #555;
    margin: 0;
}
        .info-container {
    background-color: #f9f9f9;
    padding: 20px;
    margin: 20px auto;
    max-width: 1200px;
    border-radius: 10px;
}

.info-container h3 {
    font-size: 24px;
    color: #2a2a72;
    margin-bottom: 20px;
}

.info-section h4 {
    font-size: 18px;
    color: #333;
    margin-top: 15px;
}

.info-section p {
    font-size: 14px;
    color: #555;
    line-height: 1.5;
    margin: 5px 0;
}
        
        .locker-gallery {
    max-width: 1200px;
    margin: 40px auto;
    text-align: center;
}

.locker-gallery h3 {
    font-size: 24px;
    color: #2a2a72;
    margin-bottom: 20px;
}

.locker-images {
    display: grid;
    grid-template-columns: repeat(2, 1fr); /* 두 개의 이미지가 가로로 정렬 */
    gap: 20px;
}

.locker-item {
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease-in-out;
}

.locker-item:hover {
    transform: scale(1.05);
}

.locker-item img {
    width: 100%;
    height: 400px;
    object-fit: cover;
    display: block;
}
        
  </style>
</head>
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
            <!-- 예약 폼 -->
            <form id="reservationForm">
                <p><strong>시작 날짜:</strong> 
                    <input type="date" id="startDate" name="startDate" required>
                </p>
                <p><strong>종료 날짜:</strong> 
                    <input type="date" id="endDate" name="endDate" required>
                </p>
                <p><strong>하루 가격:</strong> 5,000 원</p>
                <p><strong>이용 일수:</strong> <span id="daysCount">0</span> 일</p>
                <p><strong>총 금액:</strong> <span id="totalPrice">0</span> 원</p>
                <input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="0">
                <input type="hidden" name="lockerNo" value="1"> <!-- 예시 락커 번호 -->
				<input type="hidden" name="memberNo" value="${loginMember.memberNo}">

                <div class="button-section">
                    <button type="button" id="reserveBtn">예약하기</button>
                </div>
            </form>
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
      <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>  <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>  <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>  <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>  <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>
      <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>  <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>  <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>  <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>  <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>  <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>
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
            const startDateInput = document.getElementById("startDate");
            const endDateInput = document.getElementById("endDate");
            const daysCount = document.getElementById("daysCount");
            const totalPrice = document.getElementById("totalPrice");
            const hiddenTotalPrice = document.getElementById("hiddenTotalPrice");

            const pricePerDay = 5000; // 하루 가격

            // 모달 열기
            openModalBtn.addEventListener("click", () => lockerModal.style.display = "flex");

            // 날짜 변경 시 가격 계산
            function calculatePrice() {
                const startDate = new Date(startDateInput.value);
                const endDate = new Date(endDateInput.value);

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
                    hiddenTotalPrice.value = total;
                }
            }

            startDateInput.addEventListener("change", calculatePrice);
            endDateInput.addEventListener("change", calculatePrice);

            // 예약 처리 (AJAX)
            document.getElementById("reserveBtn").addEventListener("click", function () {
                const formData = new FormData(document.getElementById("reservationForm"));
                fetch("${pageContext.request.contextPath}/lockerReserve", {
                    method: "POST",
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    lockerModal.style.display = "none"; // 기존 예약 모달 닫기
                    resultModal.style.display = "flex"; // 결과 모달 열기

                    if (data.success) {
                        resultTitle.textContent = "예약 성공!";
                        resultMessage.textContent = "락커 예약이 성공적으로 완료되었습니다.";
                        resultTitle.className = "success-message";
                    } else {
                        resultTitle.textContent = "예약 실패";
                        resultMessage.textContent = "예약 처리 중 오류가 발생했습니다. 다시 시도해주세요.";
                        resultTitle.className = "error-message";
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    lockerModal.style.display = "none";
                    resultModal.style.display = "flex";
                    resultTitle.textContent = "오류 발생";
                    resultMessage.textContent = "서버와의 통신 중 문제가 발생했습니다.";
                    resultTitle.className = "error-message";
                });
            });

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