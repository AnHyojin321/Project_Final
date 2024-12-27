<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 구매 내역</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    width: 90%;
    max-width: 1200px;
    margin: 50px auto;
    background: #fff;
    padding: 20px;
}

.smallTitle {
	text-align : center;
	color : darkgray;
	font-size : 18px;
	font-weight : 600;
}

h2 {
    text-align: center;
    margin-bottom: 30px;
    color: #333;
}

.package-cards {
    display: flex;
    flex-direction: column; /* 세로 방향으로 배치 */
    gap: 20px; /* 카드 사이 간격 */
    align-items: center; /* 카드 중앙 정렬 */
}

.package-card {
    width: 100%; /* 카드가 전체 너비를 차지 */
    max-width: 1000px; /* 카드의 최대 너비 제한 */
    box-sizing: border-box; /* 내부 여백 포함 */
    
}

.package-card.expanded {
    width: 90%; /* 확장된 상태 */
}

.package-info {
	border-top : 2px solid black;
}

.package-info h3 {
    font-size: 1.5em;
    margin-bottom: 20px;
    color: #555;
}

.package-info p {
    font-size: 1em;
    margin: 5px 0;
    color: #666;
}

.package-detail {
    display: flex; /* Flexbox로 수평 배치 */
    justify-content: space-between; /* 두 영역 간 간격 균등 */
    align-items: flex-start; /* 수직 정렬 */
    gap: 20px; /* 두 영역 사이 간격 */
    padding: 20px;
    border-radius: 5px;
    display: none; /* 기본적으로 숨김 처리 */
    background-color : #f4f4f4;
    border-radius : 10px;
    border-top : 2px dashed black;
    border-bottom : 2px dashed black;
}

.reserver-info,
.package-info-detail {
    flex: 1; /* 각 영역이 동일한 너비로 나란히 배치 */
    padding: 10px;
    background-color: #ffffff;
    box-sizing: border-box; /* 내부 여백 포함 계산 */
    width : 100%;
    background-color : #f4f4f4;
}

.reserver-info p,
.package-info-detail p {
    margin: 5px 0;
    font-size: 1em;
    color: #333;
}


.package-actions {
    text-align: right;
}

.package-actions a {
    text-decoration: none;
    color: black;
}

.status {
    display: inline-block;
    padding: 5px 10px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
}

.status.confirmed {
    background-color: #eafbea; /* 연한 초록색 배경 */
    color: #28a745; /* 초록색 텍스트 */
}

.status.pending {
    color: #e74c3c;
    background-color: #fdecea;
}
.cancel-button {
	border: none; /* 테두리 제거 */
    border-radius: 5px; /* 둥근 모서리 */
    padding: 10px 20px; /* 버튼 내부 여백 */
    font-size: 1em; /* 글자 크기 */
    font-weight: bold; /* 글자 굵기 */
    cursor: pointer; /* 클릭 커서 */
    color: #e74c3c;
    background-color: #fdecea;
    border : 1px solid #e74c3c;

}

.open-modal-btn {
	border: none; /* 테두리 제거 */
    border-radius: 5px; /* 둥근 모서리 */
    padding: 10px 20px; /* 버튼 내부 여백 */
    font-size: 1em; /* 글자 크기 */
    font-weight: bold; /* 글자 굵기 */
    cursor: pointer; /* 클릭 커서 */
    color: #e74c3c;
    background-color: #eafbea; /* 연한 초록색 배경 */
    color: #28a745; /* 초록색 텍스트 */
    border : 1px solid #28a745;
}

/*예약 취소 버튼 관련 css */



.package-detail button:hover {
    background-color: #d9363e; /* 호버 시 조금 더 어두운 색 */
}

.package-detail button:active {
    background-color: #b02a31; /* 클릭 시 더 어두운 색 */
    transform: scale(0.95); /* 클릭 시 살짝 축소 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 클릭 시 그림자 감소 */
}

/* 모달창 관련 css */
/* 모달 배경 */
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
    z-index: 9999;
}

/* 모달 컨텐츠 */
.modal-content {
    padding: 20px;
    border : none;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    perspective: 1000px; /* 3D 효과 */
}

/* 닫기 버튼 (X 아이콘) */
.close-btn {
    position: absolute;
    top: -10px; /* 모달 컨텐츠 상단 바깥쪽으로 이동 */
    right: -10px; /* 모달 컨텐츠 오른쪽 바깥쪽으로 이동 */
    font-size: 13px;
    font-weight: bold;
    color: #2747a5;
    width: 30px;
    height: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    z-index: 1000; /* 버튼이 항상 위에 표시되도록 설정 */
    transition: background-color 0.3s, color 0.3s;
}



/* 티켓 컨테이너 */
.ticket-container {
    width: 600px;
    height: 250px;
}

/* 티켓 */
/* 티켓 컨테이너 */
.ticket-container {
    width: 600px;
    height: 250px;
}

/* 티켓 */
.ticket {
    width: 100%;
    height: 100%;
    transform-style: preserve-3d;
    transition: transform 0.6s;
    cursor: pointer;
    position: relative;
}

.ticketTitle {
	margin-bottom : 0px !important;
}

/* 티켓 앞면, 뒷면 */
.ticket-front, .ticket-back {
    position: absolute;
    width: 100%;
    height: 100%;
    backface-visibility: hidden;
    border: 2px solid #2747a5;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
}

/* 티켓 앞면 */
.ticket-front {
    background-color: white;
    display: flex;
}

.ticket-left {
    background-color: #2747a5;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    flex: 1;
    writing-mode: vertical-rl;
    text-orientation: mixed;
    font-size: 18px;
    font-weight: bold;
    height: 100%;
}

.ticket-main {
    flex: 4;
    padding: 20px;
    display: flex;
    flex-direction: column; /* 세로로 나열 */
    justify-content: center; /* 수직 중앙 정렬 */
    align-items: center; /* 수평 중앙 정렬 */
    font-family: Arial, sans-serif;
    font-size: 14px; /* 기본 폰트 크기 */
    color: #333; /* 기본 색상 */
    text-align: left; /* 텍스트 중앙 정렬 */
    line-height: 1.8; /* 줄 간격 */
    background-color: white; /* 배경 흰색 */
    border-radius: 10px; /* 모서리 둥글게 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 부드러운 그림자 */
    width: 100%; /* 박스 넓이 */
    height: 100%; /* 박스 높이 */
    
}


/* 주요 텍스트 (이벤트 코드) 강조 */
.ticket-main .event-code {
    font-size: 24px; /* 폰트 크기 키우기 */
    font-weight: bold; /* 굵게 */
    margin-bottom: 10px; /* 아래 간격 추가 */
    color: #000; /* 검은색 */
}

/* 섹션 정보 */
.ticket-main .section,
.ticket-main .seat,
.ticket-main .row-box,
.ticket-main .price {
    font-size: 16px; /* 일반 텍스트보다 살짝 크기 */
    font-weight: 500; /* 중간 굵기 */
    margin: 5px 0; /* 각 줄 간격 */
}

/* 메시지 스타일 */
.ticket-main .message {
    font-size: 14px; /* 기본 크기 */
    font-style: italic; /* 기울임체 */
    color: #666; /* 부드러운 회색 */
    margin: 10px 0; /* 위아래 간격 */
}

/* 티켓 뒷면 */
.ticket-back {
    background-color: #f8f9fa;
    transform: rotateY(180deg);
    justify-content: center;
}

.ticket-back .barcode {
    width: 80%;
    height: auto;
}

/* 티켓 회전 효과 */
.ticket.flipped {
    transform: rotateY(180deg);
}


/* 예약 상태 관련 css */
.status {
    display: inline-block;
    padding: 5px 10px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
}

.status.confirmed {
    background-color: #eafbea; /* 연한 초록색 배경 */
    color: #28a745; /* 초록색 텍스트 */
}

.status.pending {
    color: #e74c3c;
    background-color: #fdecea;
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <div class="container">
        <h2>패키지 구매 내역</h2>
        <p class="smallTitle">설레눈 리조트를 이용해주셔서 감사합니다.</p>
        <div class="package-cards">
            <c:forEach var="p" items="${list}">
            <div class="package-card" data-tid="${p.tid}" data-packageno="${p.packageNo}" data-packagereservno="${p.packageReservNo}">
                <div class="package-info">
                    <h4 title="${p.packageName}">${fn:substring(p.packageName, 0, 28)}...</h4>
                    <p>예약번호: #${p.packageReservNo}</p>
                    <p>체크인/체크아웃 : ${fn:substring(p.checkInDate, 0, 10)} - ${fn:substring(p.checkOutDate, 0, 10)} </p>
                    <p>결제 가격:  <fmt:formatNumber value="${p.packagePrice}" type="number" pattern="#,###"/> 원</p>
                    <p>결제일: ${fn:substring(p.payDate, 0, 10)}</p>
                    <p>예약 상태 : 
					    <c:choose>
					        <c:when test="${p.prefundStatus == 'N'}">
					             <span class="status confirmed">예약완료</span>
					        </c:when>
					        <c:when test="${p.prefundStatus == 'Y'}">
					            <span class="status pending">예약취소</span>
					        </c:when>
					        <c:otherwise>
					            상태 미정
					        </c:otherwise>
					    </c:choose>
					</p>
                </div>
                <div class="package-actions">
                    <a href="#" class="detail-link" data-id="${p.packageReservNo}" data-member="${sessionScope.loginMember.memberNo}"> &gt; 자세히보기</a>
                </div>
                <!-- 상세 정보를 표시할 영역 -->
                <div class="package-detail">
				    <!-- 예약자 정보 영역 -->
				    <h4>예약자 정보</h4>
				    <div class="reserver-info"></div>
				    <hr>
				    <!-- 객실 정보 영역 -->
				    <h4>객실정보</h4>
				    <div class="package-info-detail"></div>
				    <c:if test="${p.prefundStatus == 'N'}">
				    <div class="cancel-button-wrapper" style="display: flex; justify-content: flex-end; margin-right; gap:20px;">
					    <button class="cancel-button">예약 취소</button>
				    	<button class="open-modal-btn" data-id="${p.packageReservNo}">패키지 티켓</button>
				    </div>
				    </c:if>	
				</div>

            </div>
            </c:forEach>
        </div>
    </div>
    
      <!-- 모달 -->
    <div id="ticketModal" class="modal">
        <div class="modal-content">
            <!-- 닫기 버튼 -->
            <span class="close-btn" id="closeModal">&times;</span>

            <!-- 티켓 -->
            <div class="ticket-container">
                <div class="ticket" id="ticket">
                    <!-- 티켓 앞면 -->
                    <div class="ticket-front">
                        <div class="ticket-left">
                            <h3>SEOLLENEUN</h3>
                        </div>
                        <div class="ticket-main">
                           <!-- 동적으로 화면이 보여질 영역 -->
                        </div>
                    </div>
                    <!-- 티켓 뒷면 -->
                    <div class="ticket-back">
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
    

<script>
    $(document).ready(function () {
    	
    	
   	 // 날짜 변환 함수
       function formatDate(dateString) {
           var date = new Date(dateString); // 문자열을 Date 객체로 변환
           var year = date.getFullYear();
           var month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1
           var day = ('0' + date.getDate()).slice(-2); // 항상 두 자리로 유지
           return year + '-' + month + '-' + day;
       }
   	
        // 상세보기 링크 클릭 처리
        $(".detail-link").on("click", function (e) {
            e.preventDefault();

            var packageReservNo = $(this).data("id"); // 예약 번호
            var memberNo = $(this).data("member"); // 회원 번호
            var card = $(this).closest(".package-card"); // 클릭된 카드
            var link = $(this); // 클릭된 링크
            var packageNo = $(this).closest(".package-card").data("packageno"); 
            var tid = $(this).closest(".package-card").data("tid"); // 결제코드 가져오기
            
 
            
            console.log(packageReservNo);
            console.log(memberNo);
            console.log(packageNo);
            console.log(tid);
            
            // AJAX 요청
            $.ajax({
                url: "myPackDetail.me",
                type: "POST",
                data: {
                    packageReservNo: packageReservNo,
                    memberNo: memberNo,
                    packageNo: packageNo
                },
                dataType: "json",
                success: function (data) {
                    var p = data.packageDetail;
                    var m = data.memberInfo;
                    var no = data.packageReservNo;
                    console.log("바코드 : ",no);

                    // 예약자 정보
                    var reserverHtml = '<p>이름: ' + m.memberName + '</p>' +
                                       '<p>이메일: ' + m.email + '</p>' +
                                       '<p>전화번호: ' + m.phone + '</p>';

                    // 객실 정보
                    var roomHtml = '<p>상품 번호: ' + p.packageNo + '</p>' +
                                   '<p>패키지 구성: ' + p.productComposit + '</p>' +
                                   '<p>이용날짜: ' + formatDate(p.availableStartDate) + ' ~ ' + formatDate(p.availableEndDate) + '</p>' +
                                   '<p>결제금액: ' + p.packagePrice + '</p>' +
                                   '<p>결제코드: ' + tid + '</p>';

                    // 상세 정보 영역 갱신
                    var detailDiv = card.find(".package-detail");
                    detailDiv.find(".reserver-info").html(reserverHtml);
                    detailDiv.find(".package-info-detail").html(roomHtml);

                    // 카드 확장
                    if (!card.hasClass("expanded")) {
                        card.addClass("expanded");
                        detailDiv.show(); // 상세 정보 표시
                        gsap.to(card[0], { width: "1000px", duration: 0.5 }); // 가로로 확장
                        link.text("< 접기"); // 링크 텍스트를 '접기'로 변경
                    } else {
                        card.removeClass("expanded");
                        detailDiv.hide(); // 상세 정보 숨기기
                        gsap.to(card[0], { width: "1000px", duration: 0.5 }); // 가로로 축소
                        link.text("> 자세히보기"); // 링크 텍스트를 '자세히보기'로 복구
                    }
                },
                error: function (xhr, status, error) {
                    console.error("데이터 요청 실패:", error);
                }
            });

        });

        //--------------------
        // 예약 취소 버튼 클릭 처리
$(".cancel-button").on("click", function (e) {
    e.preventDefault();

    var card = $(this).closest(".package-card");
    var packageReservNo = card.data("packagereservno"); // 예약 번호 가져오기
    console.log("예약 번호:", packageReservNo); // 콘솔에 예약 번호 출력

    var detailDiv = card.find(".package-info-detail"); // 상세 정보 영역

    // 이용날짜 가져오기
    var availableStartDate = detailDiv.find("p:contains('이용날짜')").text();
    console.log("원본 이용날짜 텍스트:", availableStartDate); // 원본 텍스트 확인

    // 날짜 문자열에서 시작 날짜 추출
    var startDateMatch = availableStartDate.match(/(\d{4}-\d{2}-\d{2})/); // YYYY-MM-DD 형식 추출
    if (startDateMatch) {
        var startDate = startDateMatch[0]; // 시작 날짜 문자열
        console.log("시작 이용날짜:", startDate);
    } else {
        console.log("이용날짜를 찾을 수 없습니다.");
        alert("이용날짜 정보를 확인할 수 없습니다.");
        return;
    }

    // 시작 날짜와 현재 날짜 객체 생성
    var available = new Date(startDate); // 시작 날짜
    var today = new Date(); // 오늘 날짜
    today.setHours(0, 0, 0, 0); // 시간을 00:00:00으로 초기화
    console.log("오늘 날짜:", today);
    console.log("시작 날짜:", available);
    
    
    // 날짜 차이 계산 (일 단위)
    var diffInTime = available - today; // 밀리초 단위 차이
    var diffInDays = Math.ceil(diffInTime / (1000 * 60 * 60 * 24)); // 밀리초 -> 일 단위
    console.log("며칠 남았나:", diffInDays);

    // 환불 가능 여부 확인
    if (diffInDays <= 1) { // 하루 전날 또는 당일 취소는 환불 불가능
        alert("이용 당일 또는 하루 전 날에는 환불이 불가능합니다.");
        return; // 취소 프로세스 종료
    }

    // 사용자 확인
    if (!confirm("예약을 취소하시겠습니까?")) {
        return; // 취소 시 종료
    }

    // AJAX 요청으로 서버에 취소 요청 전송
    $.ajax({
        url: "cancelMyPackage.me", // 예약 취소 처리 API URL
        type: "POST",
        data: {
            packageReservNo: packageReservNo
        },
        success: function (response) {
            if (response === "success") {
                alert("예약이 취소되었습니다.");
                location.reload(); // 페이지 새로고침
            } else if (response === "fail") {
                alert("예약 취소에 실패했습니다.");
            } else {
                alert("예상치 못한 응답: " + response);
            }
        },
        error: function (xhr, status, error) {
            alert("서버와의 통신 중 오류가 발생했습니다.");
            console.error("에러 메시지:", error);
        }
    });
});
        
        
     // "패키지 티켓" 버튼 클릭 시 모달 열기
        $(".open-modal-btn").on("click", function (e) {
        	
            e.preventDefault();
            
            var packageReservNo = $(this).data("id"); // 예약 번호 가져오기
            console.log("패키지 예약 번호:", packageReservNo); // 콘솔에 packageReservNo 출력


         // 티켓 클릭 시 뒤집기
            ticket.addEventListener('click', () => {
                ticket.classList.toggle('flipped');
            });




            
           
            // 모달 열기
            $("#ticketModal").css("display", "flex");

            // AJAX 요청
            $.ajax({
                url: "myPackageTicket.me",  // 패키지 정보 가져오는 URL
                type: "POST",
                data: {
                    packageReservNo: packageReservNo  // 패키지 예약 번호를 서버로 전달
                },
                dataType: "json",
                success: function (data) {
                  
					console.log("패키지 티켓 조회 ajax 통신 성공");
					var p = data.p;
					console.log(p);
					
					 var ticketMain = $(".ticket-main");
			            ticketMain.html(  // ticket-main에 정보 삽입
			            	"<h2 class='ticketTitle'><strong>Package Ticket</strong></h2>" + 
			                '<p><strong>패키지명:</strong> ' + p.packageName + '</p>' +
			                '<p><strong>패키지 구성:</strong> ' + p.productComposit + '</p>' +
			                '<p><strong>이용 가능 기간:</strong> ' + formatDate(p.availableStartDate) + ' ~ ' + formatDate(p.availableEndDate) + '</p>'
			            );  
			            
			            // 바코드 이미지 경로 생성
			            var barcodeImagePath = "${pageContext.request.contextPath}/resources/uploadFiles/barcode/2.png";
			            console.log("바코드 경로 : ", barcodeImagePath);  // 경로 확인용 로그

			            // 티켓 뒷면에 바코드 이미지를 동적으로 추가
			            var ticketBack = $(".ticket-back");
			            var imgTag = '<img src="' + barcodeImagePath + '" class="barcode">';
			            ticketBack.html(imgTag);  // 기존 내용을 지우고 이미지를 추가
               

                },
                error: function (xhr, status, error) {
                    console.error("데이터 요청 실패:", error);
                }
            });
        });
        // 닫기 버튼 클릭 시 모달 닫기
        $("#closeModal").on("click", function () {
            $("#ticketModal").css("display", "none");  // 모달 숨기기
            $(".ticket").removeClass("flipped");  // 티켓 뒤집기 상태 리셋
        });

        // 모달 외부 클릭 시 모달 닫기
        $(window).on("click", function (event) {
            if ($(event.target).is("#ticketModal")) {
                $("#ticketModal").css("display", "none");
                $(".ticket").removeClass("flipped");  // 티켓 뒤집기 상태 리셋
            }
        });

    });
</script>




<jsp:include page="../common/footer.jsp" />
</body>
</html>
