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

.room-card h3 {
	margin-bottom : 10px;
}

.container {
    width: 90%;
    max-width: 1200px;
    margin: 50px auto;
    background: #fff;
    padding: 20px;
    min-height:500px;
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
    margin-bottom: 50px;
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
.QRCodeBtn, .QRCodeShowBtn {
    background-color: #cfe2f3; /* 연한 초록색 배경 */
    color: #3d85c6; /* 초록색 텍스트 */
    display: inline-block;
    padding: 5px 10px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    border : none;
    cursor : pointer;
}

.status.pending {
    color: #e74c3c;
    background-color: #fdecea;
}
.cancel-button {
	color: #e74c3c;
    background-color: #fdecea;
    border : none;
    cursor : pointer;
	display: inline-block;
    padding: 5px 10px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
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
#liftTicketDiv {
	display:none;
	border : 3px solid rgb(200, 200, 200);
	border-radius : 5px;
	padding: 7px;
	box-sizing: border-box;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <div class="container">
        <h2>리프트권 구매 내역</h2>
        <p class="smallTitle">설레눈 리조트를 이용해주셔서 감사합니다.</p>
        <div class="room-cards">
            <c:forEach var="l" items="${list}">
            <div class="room-card" data-liftPurchaseNo="${l.liftPurchaseNo}">
				<h3>${fn:substring(l.liftPurchaseDate, 0, 10)}</h3>
                <div class="room-info">
                    <h3>리프트권 ${l.totalCount}매</h3>
                    <p>구매 번호: #${l.liftPurchaseNo}</p>
                    <p>결제 가격: <fmt:formatNumber value="${l.totalPrice}" type="number" pattern="#,###"/> 원</p>
                    <p>구매 상태: 
                        <c:choose>
                            <c:when test="${l.liftLrefundStatus == 'N'}">
                                <span class="status confirmed">결제완료</span>
                                <c:choose>
                                	<c:when test="${l.QRCode == 'N'}">
       	                                <span class="status confirmed">환불가능</span>
                                	</c:when>
                                	<c:otherwise>
       	                                <span class="status pending">환불불가</span>    								                            
                                	</c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <span class="status pending">환불완료</span>
                            </c:otherwise>
                        </c:choose>
                    </p>
                    <p>
                    	<c:choose>
                            <c:when test="${l.liftLrefundStatus == 'N' and l.QRCode == 'N'}">
                            	<button class="QRCodeBtn">리프트권 발급받기</button>
                                <button class="cancel-button">환불하기</button>
                            </c:when>
                            <c:when test="${l.liftLrefundStatus == 'N' and l.QRCode == 'Y'}">
                               	<button class="QRCodeShowBtn">리프트권 보기</button>
                            </c:when>
                            <c:otherwise></c:otherwise>
                        </c:choose>
                    </p>
                </div>
                <div id="liftTicketDiv">
                	<img src="resources/images/LiftTicket.png" width="100%">
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
<script> 
    // 환불 관련
    $(document).ready(function () {
    	
    	
    	$(".QRCodeShowBtn").on("click", function () {
    	    $("#liftTicketDiv").toggle(); // #liftTicketDiv를 보이거나 숨김
    	});

    	
        $(".QRCodeBtn").on("click", function (e) {
            e.preventDefault();
            
            // 사용자 확인
            if (!confirm("리프트권 발급 시 환불이 불가합니다. 발급 받으시겠습니까?")) {
                return; // 취소 시 종료
            }
            var roomCard = $(this).closest(".room-card"); // 클릭된 버튼이 포함된 room-card 찾기
			var liftPurchaseNo = roomCard.data("liftpurchaseno"); // data-roomreservno 값 가져오기
            console.log("구매 번호: " + liftPurchaseNo);

            // AJAX 요청으로 서버에 취소 요청 전송
            $.ajax({
                url: "qrCode.me", // 예약 취소 처리 API URL
                type: "POST",
                data: {
                	liftPurchaseNo: liftPurchaseNo // 구매 번호 전송
                },
                success: function (response) {
                    if (response === "success") {
                        alert("리프트권 발급이 완료되었습니다.");
                        location.reload(); // 페이지 새로고침
                    } else if (response === "fail") {
                        alert("리프트권 발급에 실패하였습니다.");
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
    
    // 환불 관련
    $(document).ready(function () {
        $(".cancel-button").on("click", function (e) {
            e.preventDefault();

            // 현재 클릭된 버튼의 부모 room-card를 기준으로 totalPrice 값 가져오기
            var roomCard = $(this).closest(".room-card"); // 클릭된 버튼이 포함된 room-card 찾기
            var totalPriceText = roomCard.find(".room-info p:contains('결제 가격')").text(); // 결제 가격 텍스트 가져오기
            var totalPrice = parseInt(totalPriceText.replace("결제 가격: ", "").replace("원", "").replace(/,/g, "").trim()); // 숫자로 변환

            console.log("환불 금액: " + totalPrice);

            // 사용자 확인
            if (!confirm("환불 금액: " + totalPrice + "원입니다. 리프트권을 환불하시겠습니까?")) {
                return; // 취소 시 종료
            }

			var liftPurchaseNo = roomCard.data("liftpurchaseno"); // data-roomreservno 값 가져오기
            console.log("구매 번호: " + liftPurchaseNo);

            // AJAX 요청으로 서버에 취소 요청 전송
            $.ajax({
                url: "canclePurchase.me", // 예약 취소 처리 API URL
                type: "POST",
                data: {
                	liftPurchaseNo: liftPurchaseNo // 구매 번호 전송
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
