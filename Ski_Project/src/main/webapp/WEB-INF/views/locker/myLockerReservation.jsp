<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2>락커 예약 내역</h2>
    <c:forEach var="reservation" items="${reservations}">
        <div class="card">
            <h3>락커 번호: ${reservation.lockerNo}</h3>
            <p>예약 번호: ${reservation.lockerReservNo}</p>
            <p>이용 기간: ${reservation.lockerStartDate} ~ ${reservation.lockerEndDate}</p>
            <p>총 결제 금액: <fmt:formatNumber value="${reservation.lockerTotalPrice}" type="number" pattern="#,###"/> 원</p>
            <p>결제 상태: 
                <c:choose>
                    <c:when test="${reservation.packLockerUsed == 'Y'}">
                        <span class="status confirmed">사용 완료</span>
                    </c:when>	
                    <c:otherwise>
                        <span class="status pending">미사용</span>
                    </c:otherwise>
                </c:choose>
            </p>
            <p>환불 상태: 
                <c:choose>
                    <c:when test="${reservation.lrefundStatus == 'Y'}">환불 완료</c:when>
                    <c:otherwise>환불 미완료</c:otherwise>
                </c:choose>
            </p>
            <p>환불 처리일: ${reservation.lrefundDate != null ? reservation.lrefundDate : '-'}</p>
            <div class="qrcode" id="qrcode-${reservation.lockerReservNo}"></div>
            <div class="card-actions">
                <a href="#">자세히 보기</a>
                <button>예약 취소</button>
            </div>
        </div>
    </c:forEach>
</div>

<button id="authButton">카카오 인증</button>
<button id="sendMessageButton">메시지 전송</button>


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

        // 로그를 통해 각 값 확인
        console.log("락커 번호:", lockerNo);
        console.log("예약 번호:", reservNo);
        console.log("이용 기간:", period);
        console.log("총 결제 금액:", price);

        // 체크인 날짜만 추출
        var checkInDate = period.split("~")[0].trim(); // "2024-12-25"

        // QR 코드 데이터 생성
        var qrData = `L${lockerNo},R${reservNo},D${checkInDate},P${price}`;
        console.log("QR 데이터:", qrData); // QR 데이터 확인

        // QR 코드를 생성할 div 선택
        var qrContainer = $(this).find(".qrcode")[0];

        // QR 코드 생성
        new QRCode(qrContainer, {
            text: qrData,
            width: 150,
            height: 150,
            correctLevel: QRCode.CorrectLevel.L, // 최소 오류 수정 수준
            version: 5 // QR 코드 버전 설정
        });
    });
});

$(document).ready(function () {
    // 카카오 인증 버튼
    $("#authButton").click(function () {
        // 인증 코드 요청
        window.location.href = "https://kauth.kakao.com/oauth/authorize?client_id=0cd68bfa45da0864628e982003503e2e&redirect_uri=http://localhost:8090/ski/kakao/auth&response_type=code";
    });

    document.getElementById("sendMessageButton").addEventListener("click", function () {
        fetch("/send-message", {
            method: "POST", // POST 요청
            headers: {
                "Content-Type": "application/json"
            }
        })
        .then(response => response.text())
        .then(data => {
            alert("응답: " + data);
        })
        .catch(error => {
            console.error("에러 발생:", error);
            alert("메시지 전송 중 오류가 발생했습니다.");
        });
    });
});

</script>
</html>
