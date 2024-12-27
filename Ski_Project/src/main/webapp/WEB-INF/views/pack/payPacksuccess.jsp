<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
    /* body의 스타일을 설정 */
    body {
        margin: 0;
        padding: 0;
        justify-content: center; /* 수평 중앙 정렬 */
        align-items: center; /* 수직 중앙 정렬 */
        height: 100vh; /* 화면 전체 높이 */
    }

    /* 중앙에 배치할 이미지 스타일 */
    .center-image {
        width: 300px; /* 이미지가 화면을 넘지 않도록 설정 */
        height: 300px;; /* 이미지가 화면을 넘지 않도록 설정 */
        margin : 50px auto;
        display: block; /* 이미지가 블록 요소로 표시되도록 설정 */
    }
    
    /* 문구 스타일 */
    .thank-you-message {
        font-size: 1.5rem; /* 텍스트 크기 설정 */
        color: #333; /* 텍스트 색상 */
        text-align: center; /* 텍스트 가운데 정렬 */
        margin-top: 20px; /* 텍스트와 이미지 간 간격 설정 */
        font-family: "Do Hyeon", serif;
	    font-weight: 400;
	    font-style: normal;
    }
    
    /* 버튼들 감싸는 div */
    .button-group {
        display: flex;
        gap: 60px; /* 버튼 간 간격 */
        margin-top: 30px; /* 버튼과 문구 간 여백 */
        justify-content: center; /* 버튼들을 수평 중앙 정렬 */
        margin-bottom : 100px;
    }

    /* 공통 버튼 스타일 */
    .btn {
        background-color: #2a2a72; /* 기본 배경 색상 */
        color: white; /* 글자 색상 */
        padding: 12px 24px; /* 버튼 크기 조정 */
        border: none;
        font-size: 1rem; /* 폰트 크기 */
        cursor: pointer;
        transition: background-color 0.3s ease; /* 배경색 변화 애니메이션 */
        text-align : center;
    }

    .btn:hover {
        background-color: #2747a5; /* 호버 시 배경색 */
    }

    /* 버튼 내 텍스트를 중앙 정렬 */
    .btn span {
        display: inline-block;
        text-align: center;
        font-weight : bold;
    }
    
    .thank-you-message p {
    	color : darkgray;
    }
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    
    <!-- 중앙에 이미지 배치 -->
    <img src="${pageContext.request.contextPath}/resources/images/paySuccess.jpg" class="center-image" alt="결제 완료 이미지">
    
     <!-- 예약 완료 문구 -->
    <div class="thank-you-message">
        <h1>결제 완료</h1>
        <p>설레눈 리조트를 이용해주셔서 감사합니다.</p>
    </div>
    
    <!-- 버튼들 -->
    <div class="button-group">
        <button class="btn">
            <span onclick="location.href='${pageContext.request.contextPath}/'">홈으로</span>
        </button>
        <button class="btn">
            <span onclick="location.href='${pageContext.request.contextPath}/myPackage.me'">예약내역보기</span>
        </button>
    </div>
    
    
    <jsp:include page="../common/footer.jsp" />
</body>
</html>