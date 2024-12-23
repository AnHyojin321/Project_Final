<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lift Payment Information</title>
<script src="https://pay.nicepay.co.kr/v1/js/"></script> <!-- Server 승인 운영계 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <h1>Lift Payment Information</h1>

    <!-- 총 개수와 총 가격을 저장할 변수를 초기화 -->
    <c:set var="totalCount" value="0" />
    <c:set var="totalPrice" value="0" />

    <!-- 각 Lift 정보를 출력하면서 총합 계산 -->
    <c:forEach var="order" items="${list}">
        <p>
            Lift No: ${order.liftNo} 
            <c:choose>
                <c:when test="${order.liftNo == 400 || order.liftNo == 401}">
                    (오전권)
                </c:when>
                <c:when test="${order.liftNo == 402 || order.liftNo == 403}">
                    (오후권)
                </c:when>
                <c:when test="${order.liftNo == 404 || order.liftNo == 405}">
                    (종일권)
                </c:when>
                <c:when test="${order.liftNo == 406 || order.liftNo == 407}">
                    (시즌권)
                </c:when>
                <c:otherwise>
                    (알 수 없음)
                </c:otherwise>
            </c:choose>
        </p>
        <p>Lift Count: ${order.liftCount}</p>
        <p>Lift Total Price: ${order.liftTotalPrice}</p>
        
        <!-- 총 개수와 총 가격을 업데이트 -->
        <c:set var="totalCount" value="${totalCount + order.liftCount}" />
        <c:set var="totalPrice" value="${totalPrice + order.liftTotalPrice}" />
    </c:forEach>

    <hr>

    <!-- 총 개수와 총 가격 출력 -->
    <p>총 Lift Count: ${totalCount}</p>
    <p>총 Lift Price: ${totalPrice}</p>

    <p>예약자 아이디: ${list[0].memberId}</p>

    <button class="pay-btn" onclick="serverAuth()">결제하기</button>
</body>
<script>
function serverAuth() {
    console.log("호출됨");
    const memberId = "${list[0].memberId}";
    const totalPrice = ${totalPrice};
    const totalCount = ${totalCount};

    $.ajax({
        url: 'storeSessionData.li',
        type: 'POST',
        data: {
            memberId: memberId,
            totalPrice: totalPrice,
            totalCount: totalCount
        },
        success: function(data) {
            if (data.status === 'success') {
                AUTHNICE.requestPay({
                    clientId: 'S2_99ba9edee4764a5991018289cfd6308e',
                    method: 'card',
                    orderId: '02e16b8c-779d-497f-b54d-07521212175d',
                    amount: totalPrice,
                    goodsName: "리프트권 1매외 " + (totalCount - 1) + "건",
                    returnUrl: "http://localhost:8090/ski/payResult.li",
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
</body>

</html>
