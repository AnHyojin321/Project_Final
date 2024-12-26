<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>락커 예약 내역</title>

<style>
/* 전체 레이아웃 */
.container {
    width: 90%;
    max-width: 1200px;
    margin: 30px auto;
    font-family: Arial, sans-serif;
}

h2 {
    text-align: center;
    margin-bottom: 30px;
    color: #333;
}

.card {
    border: 1px solid #ccc;
    border-radius: 10px;
    margin-bottom: 20px;
    padding: 20px;
    background: #f9f9f9;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.card:hover {
    transform: scale(1.02);
}

.card h3 {
    margin: 0 0 15px;
    color: #333;
}

.card p {
    margin: 5px 0;
    color: #666;
}

.card .status {
    font-weight: bold;
    margin-top: 10px;
}

.card .status.confirmed {
    color: green;
}

.card .status.pending {
    color: red;
}

.card-actions {
    text-align: right;
    margin-top: 20px;
}

.card-actions a {
    text-decoration: none;
    color: #007bff;
    font-weight: bold;
    margin-right: 15px;
}

.card-actions button {
    background-color: #ff4d4f;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.card-actions button:hover {
    background-color: #d9363e;
}

.card-actions button:active {
    background-color: #b02a31;
    transform: scale(0.95);
}

/* QR 코드 스타일 */
.qrcode {
    margin-top: 20px;
    text-align: center;
}
</style>

<!-- jQuery 포함 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('dc02060907b4ccb8c6417c5af8b8a228'); // 발급받은 JavaScript 키 입력
console.log("카카오 초기화 완료: " + Kakao.isInitialized());
function shareLockerInfo(lockerReservNo, lockerStartDate, lockerEndDate, lockerTotalPrice) {
    console.log("Debug - 예약 번호:", lockerReservNo);
    console.log("Debug - 시작 날짜:", lockerStartDate);
    console.log("Debug - 종료 날짜:", lockerEndDate);
    console.log("Debug - 총 결제 금액:", lockerTotalPrice);

    // 공유 링크 확인
    const detailPageUrl = `http://localhost:8090/ski/lockerDetails?reservNo=${lockerReservNo}`;
    console.log("Debug - 상세 페이지 URL:", detailPageUrl);

    // 카카오 공유하기 실행
    Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
            title: `락커 예약 정보`,
            description: `예약 번호: ${lockerReservNo}\n이용 기간: ${lockerStartDate} ~ ${lockerEndDate}\n총 결제 금액: ${lockerTotalPrice}원`,
            imageUrl: 'https://ifh.cc/g/T9snYO.jpg',
            link: {
                webUrl: detailPageUrl,
                mobileWebUrl: detailPageUrl
            }
        },
        buttons: [
            {
                title: '자세히 보기',
                link: {
                    webUrl: detailPageUrl,
                    mobileWebUrl: detailPageUrl
                }
            }
        ]
    });
}




</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2>락커 예약 내역</h2>
    <c:forEach var="reservation" items="${reservations}">
<div class="card">
    <h3>락커 1/2인 [보통]</h3>
    <p>예약 번호: ${reservation.lockerReservNo}</p>
    <p>이용 기간: 
        ${fn:substringBefore(reservation.lockerStartDate, ' ')} ~ 
        ${fn:substringBefore(reservation.lockerEndDate, ' ')}
    </p>
    <p>총 결제 금액: <fmt:formatNumber value="${reservation.lockerTotalPrice}" type="number" pattern="#,###"/> 원</p>
    <p>환불 상태: 
        <span class="status ${reservation.lrefundStatus == 'Y' ? 'confirmed' : 'pending'}">
            ${reservation.lrefundStatus == 'Y' ? '환불 완료' : '환불 전'}
        </span>
    </p>
    <div class="card-actions">
        <button class="cancel-button" data-lockerreservno="${reservation.lockerReservNo}" 
                data-totalprice="${reservation.lockerTotalPrice}" 
                data-startdate="${reservation.lockerStartDate}">
            예약 취소
        </button>
        <button onclick="shareLockerInfo(
            '${reservation.lockerReservNo}',
            '${fn:substringBefore(reservation.lockerStartDate, ' ')}',
            '${fn:substringBefore(reservation.lockerEndDate, ' ')}',
            '${reservation.lockerTotalPrice}'
        )">
            공유하기
        </button>
    </div>
</div>

    </c:forEach>
</div>


<jsp:include page="../common/footer.jsp" />



</body>

<script>
$(document).ready(function () {
    $(".card").each(function () {
        // 데이터 추출
        var lockerNo = $(this).find("h3").text().replace("락커 번호: ", "").trim();
        var reservNo = $(this).find("p:nth-of-type(2)").text().replace("예약 번호: ", "").trim();
        var period = $(this).find("p:nth-of-type(3)").text().replace("이용 기간: ", "").trim();
        var price = $(this).find("p:nth-of-type(4)").text().replace("총 결제 금액: ", "").replace(" 원", "").replace(",", "").trim();

        console.log("락커 번호:", lockerNo);
        console.log("예약 번호:", reservNo);
        console.log("이용 기간:", period);
        console.log("총 결제 금액:", price);

     
    });

  
    

    $(".cancel-button").on("click", function (e) {
        e.preventDefault();

        var lockerReservNo = $(this).data("lockerreservno");
        var totalPrice = parseInt($(this).data("totalprice"));
        var startDate = $(this).data("startdate");

        var today = new Date();
        var checkInDate = new Date(startDate);
        var diffInDays = Math.ceil((checkInDate - today) / (1000 * 60 * 60 * 24));

        let refundRate = 0;
        if (diffInDays >= 7) refundRate = 1;
        else if (diffInDays >= 5) refundRate = 0.7;
        else if (diffInDays >= 2) refundRate = 0.5;
        else if (diffInDays >= 0) refundRate = 0;
        else {
            alert("이미 이용 기간이 시작된 예약은 취소할 수 없습니다.");
            return;
        }

        var refundAmount = Math.floor(totalPrice * refundRate);
        if (!confirm(`환불 금액: ${refundAmount}원. 예약을 취소하시겠습니까?`)) return;

        $.ajax({
            url: "/ski/cancelLockerReservation",
            type: "POST",
            data: { lockerReservNo: lockerReservNo },
            success: function (response) {
                if (response.status === "success") {
                    alert("예약이 성공적으로 취소되었습니다.");
                    location.reload();
                } else {
                    alert("예약 취소에 실패했습니다.");
                }
            },
            error: function (xhr, status, error) {
                alert("서버와의 통신 중 오류가 발생했습니다.");
                console.error("에러 메시지:", error);
            },
        });
    });
});


</script>
</html>
