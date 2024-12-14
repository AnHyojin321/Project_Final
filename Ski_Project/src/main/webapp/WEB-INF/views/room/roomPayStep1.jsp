<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
<style>
    body {
	  font-family: Arial, sans-serif;
	  margin: 0;
	  padding: 0;
	}
	
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
	  cursor: pointer;
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

	/* 풀캘린더 */
	#calendar {
	  max-width: 600px;
	  margin: 0 auto;
	  background-color: white;
	  border-radius: 8px;
	}
	
	 .reserv-info {
	    display: flex;
	    justify-content: space-between;
	    align-items: flex-start;
	    gap: 20px; /* 요소 간 간격 조정 */
	    margin: 50px; /* 전체 여백 */
	  }

	  .info1, .info2 {
	    flex: 1; /* 동일한 크기로 배치 */
	  }
	
	  .info1 {
	    margin-right: 20px; /* 오른쪽 간격 */
	  }
	
	  .info2 {
	    display: flex;
	    flex-direction: column; /* 수직 정렬 */
	    gap: 20px; /* 내부 요소 간 간격 */
	    margin-top : 50px;
	  }
	  
	  /* 이용가능한 객실이름 조회 */
		#roomResults {
		    display: flex;
		    flex-wrap: wrap; /* 다음 줄로 넘기기 */
		    gap: 20px; /* 버튼 간격 */
		}
		
		#roomResults button {
		    flex: 0 0 calc(20% - 10px); /* 5개씩 배치 (100% ÷ 5 - 간격) */
		    text-align: center;
		    padding: 10px;
		    margin: 0; /* 추가 여백 제거 */
		    cursor: pointer;
		    border: 1px solid #ddd;
		    border-radius: 4px;
		    background-color: #f8f8f8;
		}
		
	/* 체크인-체크아웃 관련 css */
	.date-info {
	    text-align: center;
	    margin: 20px 0; /* 위아래 간격 */
	    font-family: Arial, sans-serif;
	}
	
	.date-label {
	    font-size: 20px;
	    color: gray;
	    margin-bottom: 5px; /* 레이블과 값 간격 */
	}
	
	.date-value {
	    font-size: 40px;
	    font-weight: 400;
	    color: black;
	    margin-top : 25px;
	}
	
	
	/* 조회하기 버튼 관련 css  */
	.minimal-button {
	    font-size: 14px; /* 글씨 크기 */
	    font-weight: bold; /* 글씨 두께 */
	    color: #000; /* 텍스트 색상 */
	    background-color: transparent; /* 투명한 배경 */
	    border: 1px solid #000; /* 검은색 테두리 */
	    border-radius: 5px; /* 살짝 둥근 모서리 */
	    padding: 10px 20px; /* 내부 여백 */
	    text-transform: uppercase; /* 텍스트 대문자 변환 */
	    cursor: pointer; /* 클릭 시 포인터 표시 */
	    transition: all 0.3s ease; /* 애니메이션 효과 */
	}
	
	.minimal-button:hover {
	    background-color: #f8f8f8; /* 호버 시 밝은 배경색 */
	    color: #000; /* 텍스트 색상 유지 */
	}
	
	.minimal-button:active {
	    transform: scale(0.95); /* 클릭 시 살짝 작아지는 효과 */
	}
	
	.selected {
	    background-color: skyblue !important;
	    border: 2px solid #007bff;
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
    <span class="step active">STEP1. 객실/날짜 선택</span>
    <span class="step">STEP2. 예약정보 입력</span>
    <span class="step">STEP3. 얘약정보 확인</span>
    <span class="step">STEP4. 예약완료</span>
  </div>
  
  <div class="reserv-info">
  	<div class="info1">
	  <div id="calendar" style="margin: 50px;"></div>
	</div>  
	<div class="info2">	
		 <div class="date-info">
		    <p class="date-label">Check in — Check out</p>
		    <div class="date-value">
		        <span id="checkIn"></span> ~
		        <span id="checkOut"></span>
		    </div>
		 </div>
		 <!-- 숨겨진 폼 -->
		<form id="reservationForm" action="payStep2.ro" method="post">
			<input type="hidden" id="memberNo" name="memberNo" value="${memberNo}"> 
		    <input type="hidden" id="roomNo" name="roomNo" value=""> <!-- 예: 객실 번호 -->
		    <input type="hidden" id="checkInDate" name="checkInDate" value=""> <!-- 체크인 날짜 -->
		    <input type="hidden" id="checkOutDate" name="checkOutDate" value=""> <!-- 체크아웃 날짜 -->
		</form> 
	
	     
	      	<button id="searchRooms" class="minimal-button">SEARCH</button>
			<div id="roomResults" style="height:190px"></div>
			<button id="nextButton" class="minimal-button" style="margin-top: 20px;">다음 예약 페이지로</button>
     </div>
    </div>
  <script>
  let checkInDate = null;
  let checkOutDate = null;
  let selectedRoomNo = null;
  
  document.addEventListener('DOMContentLoaded', function () {

	    // FullCalendar 초기화
	    const calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
	        initialView: 'dayGridMonth',
	        locale: 'ko',
	        headerToolbar: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'dayGridMonth'
	        },
	        dateClick: function (info) {
	            if (!checkInDate) {
	                checkInDate = info.dateStr;
	                console.log(checkInDate);
	                // $('#checkInDate').val(checkInDate); // 숨겨진 필드 업데이트
	                document.getElementById('checkIn').innerText = checkInDate;
	            } else if (!checkOutDate) {
	                checkOutDate = info.dateStr;

	                if (new Date(checkOutDate) <= new Date(checkInDate)) {
	                    alert("체크아웃 날짜는 체크인 날짜보다 이후여야 합니다!");
	                    checkOutDate = null;
	                    return;
	                }

	                // $('#checkOutDate').val(checkOutDate); // 숨겨진 필드 업데이트
	                console.log(checkOutDate);
	                document.getElementById('checkOut').innerText = checkOutDate;
	            } else {
	                alert("날짜를 다시 선택하려면 체크인 날짜를 다시 선택하세요.");
	                checkInDate = null;
	                checkOutDate = null;
	                $('#checkInDate').val("");
	                $('#checkOutDate').val("");
	                document.getElementById('checkInDate').innerText = "";
	                document.getElementById('checkOutDate').innerText = "";
	            }
	        }
	    });

	    calendar.render();

	    // "SEARCH" 버튼 클릭 이벤트
	    $('#searchRooms').click(function () {
	        if (!checkInDate || !checkOutDate) {
	            alert("체크인/체크아웃 기간을 지정해주세요.");
	            return;
	        }

	        console.log("체크인 날짜:", checkInDate);
	        console.log("체크아웃 날짜:", checkOutDate);

	        const roomType = '${roomType}'; // 서버에서 제공된 roomType 변수

	        // AJAX 요청
	        $.ajax({
	            url: 'searchRoom.ro', // 서버에서 매핑된 URL
	            type: 'post',
	            data: {
	                checkInDate: checkInDate,
	                checkOutDate: checkOutDate,
	                roomType: roomType
	            },
	            success: function (result) {
	                console.log('서버 응답 성공:', result);

	                // roomResults 영역 선택
	                const roomResultsContainer = $('#roomResults');

	                // 기존 데이터 초기화
	                roomResultsContainer.empty();

	                // 결과 데이터 순회
	                result.forEach(function (room) {
	                    // STATUS가 'N'이면 버튼 비활성화
	                    const isDisabled = room.status === 'N' ? 'disabled' : '';

	                    // 버튼 생성 (roomNo를 data-roomno 속성으로 추가)
	                    const button = '<button style="margin: 5px; padding: 10px; cursor: pointer;" '
	                        + isDisabled + ' data-roomno="' + room.roomNo + '">'
	                        + room.roomName
	                        + '</button>';
	                    roomResultsContainer.append(button);
	                });
	            },
	            error: function (error) {
	                console.error('객실 조회 실패:', error);
	                alert("객실 조회 중 오류가 발생했습니다.");
	            }
	        });
	    });

	    // 동적으로 생성된 객실 버튼 클릭 이벤트
	    $(document).on('click', '#roomResults button', function () {
	        if (!$(this).attr('disabled')) {
	            $('#roomResults button').removeClass('selected'); // 기존 선택된 버튼 스타일 제거
	            $(this).addClass('selected'); // 현재 선택된 버튼에 스타일 추가

	            // 선택된 객실 번호 저장 및 숨겨진 필드 업데이트
	            selectedRoomNo = $(this).data('roomno');
	            $('#roomNo').val(selectedRoomNo); // 숨겨진 필드 업데이트
	            console.log('선택된 객실 번호:', selectedRoomNo);
	            

                console.log(checkInDate);

                console.log(checkOutDate);
                
                console.log($('#checkInDate'));
                console.log($('#checkOutDate'));
	            
		        $('#checkInDate').val(checkInDate);
		        $('#checkOutDate').val(checkOutDate);
	        }
	    });

	    // "다음 예약 페이지로" 버튼 클릭 이벤트
	    $('#nextButton').click(function () {
	        // const roomNo = $('#roomNo').val(); // 숨겨진 필드에서 객실 번호 가져오기
	        // const checkInDate = $('#checkInDate').val(); // 숨겨진 필드에서 체크인 날짜 가져오기
	        // const checkOutDate = $('#checkOutDate').val(); // 숨겨진 필드에서 체크아웃 날짜 가져오기

	        console.log("숨겨진 필드 값 확인:");
	        console.log("객실 번호:", roomNo);
	        console.log("체크인 날짜:", checkInDate);
	        console.log("체크아웃 날짜:", checkOutDate);
	        
	        // $('#checkInDate').val(checkInDate);
	        // $('#checkOutDate').val(checkOutDate);

	        // 유효성 검사
	        if (roomNo && checkInDate && checkOutDate) {
	             $('#reservationForm').submit(); // 폼 제출
	        } else {
	            alert('객실과 체크인/체크아웃 날짜를 모두 선택하세요.');
	        }
	    });
	});

  </script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>