<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Alertify 라이브러리 연동 구문 (CDN) -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
<style>
/* 전체 스타일 */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    background-color: #f8f9fa;
    color: #212529;
}

/* 컨테이너 */
.admin-container {
    display: flex;
    min-height: 100vh;
}


/* 사이드바 */
.sidebar {
    width: 260px;
    background: #2c3e50;
    color: white;
    padding: 20px;
    box-shadow: 2px 0 8px rgba(0, 0, 0, 0.2);
}

.sidebar h2 {
    text-align: center;
    font-size: 1.8em;
    margin-bottom: 20px;
    color: #f8f9fa;
}

.sidebar ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.sidebar ul li {
    margin: 10px 0;
}

.sidebar ul li a {
    text-decoration: none;
    font-size: 1.1em;
    color: #d1d3e2;
    padding: 12px 15px;
    display: block;
    border-radius: 8px;
    transition: all 0.3s ease-in-out;
}

.sidebar ul li a.active,
.sidebar ul li a:hover {
    background-color: rgba(255, 255, 255, 0.2);
    color: #fff;
}

hr {
    border: 1px solid rgba(255, 255, 255, 0.1);  /* 경계 색상 설정 */
    border-radius: 10px;  /* 둥근 모서리 */
    background-color: transparent;  /* 배경색 투명하게 설정 (선택 사항) */
    margin:0px;
    padding:0px;
}
</style>
</head>
<body>

	<!-- 1회성 알림 문구 -->
	<c:if test="${ not empty sessionScope.alertMsg }">
		<script>
			alertify.alert('Alert', '${ sessionScope.alertMsg }', function(){ alertify.success('Ok'); });
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>


	 <div class="admin-container">
        <!-- 사이드바 -->
        <aside class="sidebar">
            <h2>관리자 메뉴</h2>
            <ul>
                <li><a href="/admin">대시보드</a></li>             
				<hr>
                <li><a href="members.ad">회원 관리</a></li>
                <hr>
                <li><a href="${pageContext.request.contextPath}/list.ro">객실 관리</a></li>
                <li><a href="roomReservation.se">객실 예약 조회</a>
                <hr>
                <li><a href="liftSelect.li">리프트권 관리</a></li>
                <li><a href="liftPurchase.se">리프트권 구매 조회</a>
                <hr>
                <li><a href="/admin/rooms">락커 관리</a></li>
                <hr>
                <li><a href="list.pk">패키지 관리</a></li>
                <hr>
                <li><a href="lesson.ad">강습 예약 관리</a></li>
                <hr>
                <li><a href="/admin/noticeList">공지사항 등록</a></li>
                <li><a href="/admin/lostList">분실물 등록</a></li>
                <hr>
                <li><a href="/admin/reservations">예약 관리</a></li>
                <li><a href="skiResortUpdate.sm">스키장 관리</a></li>
                <li><a href="slopeUpdate.sm">슬로프 관리</a></li>
                <hr>
                <li><a href="/admin/refund">환불 통합</a></li>
                <li><a href="/admin/reports">통계 및 리포트</a></li>
                <li><a href="/admin/settings">설정</a></li>
            </ul>
        </aside>
      </div>
</body>
</html>