<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    box-sizing: border-box;
    background-color: white;
}

.product-detail {
    width: 80%;
    max-width: 800px;
    margin: 50px auto;
    background-color: white;
    padding: 20px;
}

.product-header {
    border-bottom: 1px solid #ddd;
    padding-bottom: 15px;
    margin-bottom: 20px;
}

.product-title {
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 10px;
}

.status {
    font-size: 1rem;
    color: green;
    font-weight: bold;
    margin-left: 10px;
}

.category {
    text-align: right;
}

.product-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    border-top: 2px solid black; /* 테이블 위쪽 테두리 검정색 */
    border-bottom: 2px solid black; /* 테이블 아래쪽 테두리 검정색 */
    border-left: none; /* 테이블 왼쪽 테두리 제거 */
    border-right: none; /* 테이블 오른쪽 테두리 제거 */
}

.product-table th,
.product-table td {
    text-align: left;
    padding: 10px;
    border-bottom: 1px solid #ddd;
    font-size: 1rem;
}

.product-table th {
    background-color: #f4f4f4;
    font-weight: bold;
    width: 30%;
}

.product-table td {
    width: 70%;
}

.purchase-btn {
    width: 30%;
    height: 50px;
    background-color: #8b7d6b;
    color: white;
    border: none;
    font-size: 1.2rem;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
    display: flex; /* 글씨를 버튼 중앙에 정렬하기 위한 설정 */
    align-items: center; /* 수직 정렬 */
    justify-content: center; /* 수평 정렬 */
    margin: 20px auto; /* 버튼 자체를 가운데 정렬 */
}

.purchase-btn:hover {
    background-color: #705f50;
}

.purchase-btn:hover {
    background-color: #705f50;
}

/* 패키지 상품 안내사항 관련 css */
.info-container {
    width: 80%;
    max-width: 800px;
    margin: 30px auto;
    background-color: white;
    padding: 20px;
}

.info-section {
    margin-bottom: 30px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 15px;
}

.info-section:last-child {
    border-bottom: none;
}

.info-section h2 {
    font-size: 20px;
    color: #333;
    margin-bottom: 10px;
    font-weight: bold;
}

.info-section p {
    font-size: 14px;
    color: #555;
    line-height: 1.6;
    margin: 5px 0;
}

.info-contact {
    text-align: center;
    margin-top: 20px;
    padding-top: 10px;
    border-top: 1px solid #ddd;
}

.info-contact h2 {
    font-size: 23px;
    margin-bottom: 10px;
    text-align : left;
}

.info-contact p {
    font-size: 17px;
    font-weight: bold;
    color: #333;
    text-align : left;
}

/* 화면 하단에 이전글/다음글 관련 css */
.navigation-container {
    width: 80%;
    max-width: 800px;
    background-color: #fff;
    padding: 20px;
    margin: 0 auto; /* 수평 중앙 정렬 */
    margin-top : 150px;
    position: relative; /* 위치 기준 설정 */
    top: 50%; /* 부모 컨테이너 기준 세로 중앙 */
    transform: translateY(-50%); /* 세로 중앙 정렬 */
}
.navigation-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
        border-top: 2px solid black; /* 테이블 위쪽 테두리 검정색 */
    border-bottom: 2px solid black; /* 테이블 아래쪽 테두리 검정색 */
    border-left: none; /* 테이블 왼쪽 테두리 제거 */
    border-right: none; /* 테이블 오른쪽 테두리 제거 */
    
}

.navigation-table th, .navigation-table td {
    text-align: left;
    padding: 10px;
    border-bottom: 1px solid #ddd;
    font-size: 1rem;
}

.navigation-table th {
    background-color: #f9f9f9;
    font-weight: bold;
    color: #666;
    width: 20%;
}

.navigation-table td {
    color: #333;
    width: 80%;
}

.button-container {
    text-align: center;
    margin-top: 20px;
}

.back-btn {
    padding: 10px 20px;
    font-size: 1rem;
    color: #705f50;
    background-color: #fff;
    border: 1px solid #705f50;

    cursor: pointer;

}

.back-btn>a {
	text-decoration : none;
	color : black;
}

.back-btn:hover {
    background-color: #705f50;
    color: #fff;
}

</style>
</head>
<body>
    <div class="product-detail">
        <div class="product-header">
            <p class="product-title">${p.packageName}
             <span class="status">
            <c:choose>
                <c:when test="${p.packageStatus == 'Y'}">[진행중]</c:when>
                <c:otherwise>[진행 종료]</c:otherwise>
            </c:choose>
        </span>
             </p>
        </div>
        <table class="product-table">
            <tr>
                <th>상품구성</th>
                <td>${p.productComposit}</td>
            </tr>
            <tr>
                <th>이용기간</th>
                <td>${p.availableStartDate} ~ ${p.availableEndDate}</td>
            </tr>
            <tr>
                <th>티켓 종류</th>
                <td>
					<c:choose>
				        <c:when test="${pack.packageSet == 1}">객실+리프트</c:when>
				        <c:when test="${pack.packageSet == 2}">리프트+락커</c:when>
				        <c:otherwise>객실+리프트+락커</c:otherwise>
				    </c:choose>
				</td>
            </tr>
            <tr>
                <th>금액</th>
                <td>
				    <fmt:formatNumber value="${p.packagePrice}" type="number" groupingUsed="true" />
				</td>

            </tr>
        </table>
        <button class="purchase-btn">구매</button>
    </div>

    <div class="info-container">
        <!-- 티켓상품 안내 -->
        <div class="info-section">
            <h2>티켓상품 안내</h2>
            <p>- 성수기 : 2024년 12월 20일 ~ 2025년 2월 2일</p>
            <p>- 반일권 구분 : 오전권 09:00 ~ 13:00 (4시간), 오후권 13:00 ~ 17:00 (4시간), 야간권 18:30 ~ 21:30 (3시간) 중 택 1</p>
            <p>- 대/소인 구분 없음</p>
        </div>

        <!-- 변경 및 취소 안내 -->
        <div class="info-section">
            <h2>변경 및 취소 안내</h2>
            <p>- 복합 티켓 상품의 특성상 스키/700 등 구매한 상품을 중 한 상품이라도 사용하였을 경우에는 취소 및 환불은 불가합니다.</p>
            <p>- 결제취소 혹은 환불정책은 미사용 티켓에 한해서만 가능합니다.</p>
            <p>- 티켓 구매 후 7일 이내(구매일 포함) "마이페이지"에서 직접 취소가 가능합니다.</p>
            <p>- 티켓 구매 후 7일 이후에는 취소가 불가능합니다.</p>
        </div>

        <!-- 이용 안내 -->
        <div class="info-section">
            <h2>이용 안내</h2>
            <p>- 본 상품은 당일 구매 가능합니다.</p>
            <p>- 티켓 상품은 1회 최대 10매까지 구매 가능합니다.</p>
            <p>- 본 상품은 모바일 상품으로 마이페이지에서 확인 가능합니다.</p>
            <p>- 메퍼소가 매우 혼잡할 수 있으므로 미리 확인해야 이용이 불편이 없습니다.</p>
        </div>

        <!-- 기타 안내 -->
        <div class="info-section">
            <h2>기타 안내</h2>
            <p>- 티켓상품을 구매 시 반드시 사전 영업 일정을 확인 후 구매하시기 바랍니다.</p>
            <p>- 문의 : 종합 대표 번호: 033-339-0318</p>
        </div>

        <!-- 문의 -->
        <div class="info-contact">
            <h2>문의</h2>
            <p>전화번호: 033-339-0000</p>
        </div>
    </div>
    
       <div class="navigation-container">
	        <table class="navigation-table">
	            <tr>
	                <th>다음글</th>
	                <td>1인 종일권 (춘/추계)</td>
	            </tr>
	            <tr>
	                <th>이전글</th>
	                <td>이전 티켓상품이 없습니다.</td>
	            </tr>
	        </table>
	        <div class="button-container">
	            <button class="back-btn">
	            <a href="../list.pk">목록</a>
	            </button>
	        </div>
	    </div>
</body>
</html>