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
<title>객실 예약 내역</title>
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

.room-cards {
    display: flex;
    flex-direction: column; /* 세로 방향으로 배치 */
    gap: 20px; /* 카드 사이 간격 */
    align-items: center; /* 카드 중앙 정렬 */
}

.room-card {
    width: 100%; /* 카드가 전체 너비를 차지 */
    max-width: 500px; /* 카드의 최대 너비 제한 */
    box-sizing: border-box; /* 내부 여백 포함 */
    
}

.room-card.expanded {
    width: 90%; /* 확장된 상태 */
}

.room-info {
	border-top : 2px solid black;
}

.room-info h3 {
    font-size: 1.5em;
    margin-bottom: 20px;
    color: #555;
}

.room-info p {
    font-size: 1em;
    margin: 5px 0;
    color: #666;
}

.room-detail {
    display: flex; /* Flexbox로 수평 배치 */
    justify-content: space-between; /* 두 영역 간 간격 균등 */
    align-items: flex-start; /* 수직 정렬 */
    gap: 20px; /* 두 영역 사이 간격 */
    display: none; /* 기본적으로 숨김 처리 */
    border-bottom : 2px solid black;
}

.reserver-info,
.room-info-detail {
    flex: 1; /* 각 영역이 동일한 너비로 나란히 배치 */
    padding: 10px;
    background-color: #ffffff;
    box-sizing: border-box; /* 내부 여백 포함 계산 */
    width : 100%;
}

.reserver-info p,
.room-info-detail p {
    margin: 5px 0;
    font-size: 1em;
    color: #333;
}


.room-actions {
    text-align: right;
}

.room-actions a {
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

/*예약 취소 버튼 관련 css */
.room-detail button {
    background-color: #ff4d4f; /* 붉은색 배경 */
    color: #fff; /* 흰색 텍스트 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 둥근 모서리 */
    padding: 10px 20px; /* 버튼 내부 여백 */
    font-size: 1em; /* 글자 크기 */
    font-weight: bold; /* 글자 굵기 */
    cursor: pointer; /* 클릭 커서 */
    transition: all 0.3s ease; /* 부드러운 전환 효과 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 살짝 튀어나온 느낌 */
}

.room-detail button:hover {
    background-color: #d9363e; /* 호버 시 조금 더 어두운 색 */
}

.room-detail button:active {
    background-color: #b02a31; /* 클릭 시 더 어두운 색 */
    transform: scale(0.95); /* 클릭 시 살짝 축소 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 클릭 시 그림자 감소 */
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <div class="container">
        <h2>객실 내역</h2>
        <p class="smallTitle">설레눈 리조트를 이용해주셔서 감사합니다.</p>
        <div class="room-cards">
            <c:forEach var="r" items="${list}">
            <div class="room-card" data-roomreservno="${r.roomReservNo}">
				<h3>${fn:substring(r.reservDate, 0, 10)}</h3>
                <div class="room-info">
                    <h3>${r.roomType} ${r.roomName}</h3>
                    <p>예약번호: #${r.roomReservNo}</p>
                    <p>결제 가격: <fmt:formatNumber value="${r.amount}" type="number" pattern="#,###"/> 원</p>
                    <p>예약 상태: 
                        <c:choose>
                            <c:when test="${r.payStatus == 'Y'}">
                                <span class="status confirmed">결제완료</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status pending">환불완료</span>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
                <div class="room-actions">
                    <a href="#" class="detail-link" data-id="${r.roomReservNo}" data-member="${sessionScope.loginMember.memberNo}"> &gt; 자세히보기</a>
                </div>
             
                <!-- 상세 정보를 표시할 영역 -->
                <div class="room-detail">
				    <!-- 예약자 정보 영역 -->
				    <h4>예약자 정보</h4>
				    <div class="reserver-info"></div>
				    <hr>
				    <!-- 객실 정보 영역 -->
				    <h4>객실정보</h4>
				    <div class="room-info-detail"></div>
				    <button class="cancel-button" style="<c:if test='${r.payStatus == "N"}'>display:none;</c:if>">예약 취소</button>
				</div>

            </div>
            </c:forEach>
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
    	
        $(".detail-link").on("click", function (e) {
            e.preventDefault();

            var roomReservNo = $(this).data("id"); // 예약 번호
            var memberNo = $(this).data("member"); // 회원 번호
            var card = $(this).closest(".room-card"); // 클릭된 카드
            var link = $(this); // 클릭된 링크

            // 다른 카드 축소
            $(".room-card").not(card).each(function () {
                $(this).removeClass("expanded");
                $(this).find(".room-detail").hide(); // 숨기기
                gsap.to(this, { width: "500px", duration: 0.5 }); // 너비 축소
                $(this).find(".detail-link").text("> 자세히보기"); // 링크 텍스트 복구
            });

            // AJAX 요청
            $.ajax({
                url: "myRoomDetail.ro",
                type: "POST",
                data: {
                    roomReservNo: roomReservNo,
                    memberNo: memberNo
                },
                dataType: "json",
                success: function (data) {
                    var roomDetail = data.roomDetail;
                    var memberInfo = data.memberInfo;

                    // 예약자 정보
                    var reserverHtml = '<p>이름: ' + memberInfo.memberName + '</p>' +
                                       '<p>이메일: ' + memberInfo.email + '</p>' +
                                       '<p>전화번호: ' + memberInfo.phone + '</p>';

                    // 객실 정보
                    var roomHtml = '<p>객실명: ' + roomDetail.roomType + ' ' + roomDetail.roomName + '</p>' +
                    		  	   '<p>체크인: ' + formatDate(roomDetail.checkInDate) + '</p>' + // formatDate 적용
                  				   '<p>체크아웃: ' + formatDate(roomDetail.checkOutDate) + '</p>' + // formatDate 적용s
                  	               '<p>입/퇴실 : 15:00 ~ 11:00 </p>' + 
                                   '<p>결제금액: ' + roomDetail.amount + '</p>' +
                                   '<p>결제코드: ' + roomDetail.tid + '</p>';

                    // 상세 정보 영역 갱신
                    var detailDiv = card.find(".room-detail");
                    detailDiv.find(".reserver-info").html(reserverHtml);
                    detailDiv.find(".room-info-detail").html(roomHtml);

                    // 카드 확장
                    if (!card.hasClass("expanded")) {
                        card.addClass("expanded");
                        detailDiv.show(); // 상세 정보 표시
                        gsap.to(card[0], { width: "90%", duration: 0.5 }); // 가로로 확장
                        link.text("< 접기"); // 링크 텍스트를 '접기'로 변경
                    } else {
                        card.removeClass("expanded");
                        detailDiv.hide(); // 상세 정보 숨기기
                        gsap.to(card[0], { width: "500px", duration: 0.5 }); // 가로로 축소
                        link.text("> 자세히보기"); // 링크 텍스트를 '자세히보기'로 복구
                    }
                },
                error: function (xhr, status, error) {
                    console.error("데이터 요청 실패:", error);
                }
            });
        });
    });
    
    //-------------------- 
    // 환불관련 
    $(document).ready(function () {
	    $(".cancel-button").on("click", function (e) {
	        e.preventDefault();
	
	        var card = $(this).closest(".room-card");
	        var roomReservNo = card.data("roomreservno");
	        var checkInDate = card.find(".room-info-detail p:contains('체크인')").text().replace("체크인: ", "").trim(); // 체크인 날짜 가져오기
	        var amount = parseInt(card.find(".room-info-detail p:contains('결제금액')").text().replace("결제금액: ", "").replace("원", "").trim()); // 결제 금액 가져오기
	
	        var today = new Date(); // 오늘 날짜
	        var checkIn = new Date(checkInDate); // 체크인 날짜
	
	        console.log(checkIn);
	
	        // 날짜 차이 계산 (일 단위)
	        var diffInTime = checkIn - today; // 밀리초 단위 차이
	        var diffInDays = Math.ceil(diffInTime / (1000 * 60 * 60 * 24)); // 밀리초 -> 일 단위
	        
	        // 환불 비율 결정
	        let refundRate = 0;
	        if (diffInDays >= 7) {
	            refundRate = 1; // 100% 환불
	        } else if (diffInDays >= 5) {
	            refundRate = 0.7; // 70% 환불
	        } else if (diffInDays >= 2) {
	            refundRate = 0.5; // 50% 환불
	        } else if (diffInDays >= 0) {
	            refundRate = 0; // 0% 환불
	        } else {
	            alert("이미 체크인이 진행된 예약은 취소할 수 없습니다.");
	            return;
	        }

	        
	     // 환불 금액 계산
	        var refundAmount = Math.floor(amount * refundRate);
	     
	     console.log("환불금액 : " + refundAmount);
	     
	  	// 사용자 확인
	     if (!confirm("환불 금액: " + refundAmount + "원. 예약을 취소하시겠습니까?")) {
	         return; // 취소 시 종료
	     }
	  	
	  	// AJAX 요청으로 서버에 취소 요청 전송
	        $.ajax({
	            url: "cancelReservation.", // 예약 취소 처리 API URL
	            type: "POST",
	            data: {
	                roomReservNo: roomReservNo
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
	});

</script>



<jsp:include page="../common/footer.jsp" />
</body>
</html>
