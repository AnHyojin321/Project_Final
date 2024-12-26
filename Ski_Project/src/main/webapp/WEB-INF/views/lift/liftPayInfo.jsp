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
<style>
	#outer{
		width: 80%;
		margin:auto;
		min-height:75vh;
	}
	h1 {
		padding-top : 30px;
		padding-bottom: 15px;
	}
	#btnDiv {
		text-align: right;
		padding-right:10px;
		padding-bottom : 50px;
		padding-top:20px;
	}
	.pay-btn {
		width:200px;
		height:50px;
		border:none;
		border-radius:7px;
		background-color : rgba(0, 10, 50, 0.7);
		color : white;
		cursor : pointer;
		transition: background-color 0.3s ease;
	}
	.pay-btn:hover {
		background-color : rgba(0, 10, 50, 0.8);
		
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div id="outer">
    <h1>리프트권 주문 정보</h1>

    <c:set var="totalCount" value="0" />
    <c:set var="totalPrice" value="0" />
    
	<hr><hr>
    <c:forEach var="order" items="${list}">
        <p>
        	<br>
            리프트권 종류 : ${order.liftType}
            <c:choose>
                <c:when test="${order.liftNo == 400}">
                    오전권 (대인)
                </c:when>
                <c:when test="${order.liftNo == 401}">
                    오전권 (소인)
                </c:when>
                <c:when test="${order.liftNo == 402}">
                    오후권 (대인)
                </c:when>
                <c:when test="${order.liftNo == 403}">
                    오후권 (소인)
                </c:when>
                <c:when test="${order.liftNo == 404}">
                    종일권 (대인)
                </c:when>
                <c:when test="${order.liftNo == 405}">
                    종일권 (소인)
                </c:when>
                <c:when test="${order.liftNo == 406}">
                    시즌권 (대인)
                </c:when>
                <c:when test="${order.liftNo == 407}">
                    시즌권 (소인)
                </c:when>
                <c:otherwise>
                    알 수 없음
                </c:otherwise>
            </c:choose>
            <br>
        </p>
        <p>리프트권 개수 : ${order.liftCount} 개</p>
        <p>리프트권 금액 : ${order.liftTotalPrice} 원</p>
        <br>
        <hr>
        
        <!-- 총 개수와 총 가격을 업데이트 -->
        <c:set var="totalCount" value="${totalCount + order.liftCount}" />
        <c:set var="totalPrice" value="${totalPrice + order.liftTotalPrice}" />
    </c:forEach>

    <hr>

	<br>
    <p>총 리프트권 개수: ${totalCount} 개</p>
    <p>총 금액: ${totalPrice} 원</p>
    <p>구매자 : ${list[0].memberId}</p>
    <br>
    <hr><hr>

	<div id="btnDiv">
	    <button class="pay-btn" onclick="serverAuth()">${totalPrice}원 결제하기</button>	
	</div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
<script>
function serverAuth() {
    console.log("호출됨");
    const memberId = "${list[0].memberId}";
    const totalPrice = ${totalPrice};
    const totalCount = ${totalCount};
    console.log(memberId);
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
                    goodsName: "리프트권 1매 외 " + (totalCount - 1) + "건",
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
function formatPrice(price) {
    return price.toLocaleString();
}
</script>
</body>

</html>
