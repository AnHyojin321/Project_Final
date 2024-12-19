<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	 <div class="admin-container">
        <!-- 사이드바 -->
        <aside class="sidebar">
            <h2>관리자 메뉴</h2>
            <ul>
                <li><a href="/admin">대시보드</a></li>
                <li><a href="members.ad">회원 관리</a></li>
                <li><a href="list.ro">객실 관리</a></li>
                <li><a href="liftSelect.li">리프트권 관리</a></li>
                <li><a href="/admin/rooms">락커 관리</a></li>
                <li><a href="list.pk">패키지 관리</a></li>
                <li><a href="skiResortUpdate.sm">스키장 관리</a></li>
                <li><a href="slopeUpdate.sm">슬로프 관리</a></li>
                <li><a href="/admin/reservations">예약 관리</a></li>
                <li><a href="/admin/reports">통계 및 리포트</a></li>
                <li><a href="lesson.ad">강습 예약 관리</a></li>
                <li><a href="/admin/settings">설정</a></li>
            </ul>
        </aside>
      </div>
</body>
</html>