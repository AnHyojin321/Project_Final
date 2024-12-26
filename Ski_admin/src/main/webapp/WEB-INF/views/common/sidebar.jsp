<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    background-color: #f8f9fa;
    color: #212529;
}

.admin-container {
    display: flex;
    min-height: 100vh;
}

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
    position: relative;
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

.sidebar ul li .dropdown {
    cursor: pointer;
    padding: 12px 15px;
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 8px;
    position: relative;
}

.sidebar ul li .dropdown::after {
    content: "\25BC";
    position: absolute;
    right: 15px;
    font-size: 0.8em;
    transition: transform 0.3s ease-in-out;
}

.sidebar ul li .dropdown.open::after {
    transform: rotate(180deg);
}

.sidebar ul li ul {
    display: none;
    padding-left: 15px;
    margin-top: 5px;
}

.sidebar ul li ul li {
    margin: 5px 0;
}
</style>
<script>
function toggleDropdown(event) {
    const dropdown = event.currentTarget;
    const submenu = dropdown.nextElementSibling;

    if (submenu.style.display === "block") {
        submenu.style.display = "none";
        dropdown.classList.remove("open");
    } else {
        submenu.style.display = "block";
        dropdown.classList.add("open");
    }
}

window.onload = function () {
    const openDropdowns = JSON.parse(localStorage.getItem('openDropdowns')) || [];
    openDropdowns.forEach(id => {
        const dropdown = document.getElementById(id);
        if (dropdown) {
            dropdown.classList.add("open");
            dropdown.nextElementSibling.style.display = "block";
        }
    });
};

function saveDropdownState(event) {
    const dropdown = event.currentTarget;
    const id = dropdown.id;
    let openDropdowns = JSON.parse(localStorage.getItem('openDropdowns')) || [];
    if (dropdown.classList.contains("open")) {
        if (!openDropdowns.includes(id)) {
            openDropdowns.push(id);
        }
    } else {
        openDropdowns = openDropdowns.filter(openId => openId !== id);
    }
    localStorage.setItem('openDropdowns', JSON.stringify(openDropdowns));
}
</script>
</head>
<body>
    <c:if test="${ not empty sessionScope.alertMsg }">
        <script>
            alertify.alert('Alert', '${ sessionScope.alertMsg }', function(){ alertify.success('Ok'); });
        </script>
        <c:remove var="alertMsg" scope="session" />
    </c:if>

    <div class="admin-container">
        <aside class="sidebar">
            <h2>관리자 메뉴</h2>
            <ul>
                <li><a href="/admin">대시보드</a></li>

                <li>
                    <div class="dropdown" id="rooms" onclick="toggleDropdown(event); saveDropdownState(event)">객실 관리</div>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/list.ro">객실 관리</a></li>
                        <li><a href="roomReservation.se">객실 예약 조회</a></li>
                    </ul>
                </li>

                <li>
                    <div class="dropdown" id="lift" onclick="toggleDropdown(event); saveDropdownState(event)">리프트 관리</div>
                    <ul>
                        <li><a href="liftSelect.li">리프트권 관리</a></li>
                        <li><a href="liftPurchase.se">리프트권 구매 조회</a></li>
                    </ul>
                </li>

                <li>
                    <div class="dropdown" id="notices" onclick="toggleDropdown(event); saveDropdownState(event)">공지 및 분실물</div>
                    <ul>
                        <li><a href="/admin/noticeList">공지사항 등록</a></li>
                        <li><a href="/admin/lostList">분실물 등록</a></li>
                    </ul>
                </li>

                <li>
                    <div class="dropdown" id="reservations" onclick="toggleDropdown(event); saveDropdownState(event)">예약 관리</div>
                    <ul>
                        <li><a href="skiResortUpdate.sm">스키장 관리</a></li>
                        <li><a href="slopeUpdate.sm">슬로프 관리</a></li>
                    </ul>
                </li>

                <li>
                    <div class="dropdown" id="refund" onclick="toggleDropdown(event); saveDropdownState(event)">환불 관리</div>
                    <ul>
                        <li><a href="/admin/refund/lockerRefund">락커 환불</a></li>
                        <li><a href="/admin/refund/packageRefund">패키지 환불</a></li>
                        <li><a href="/admin/refund/liftRefund">리프트권 환불</a></li>
                        <li><a href="/admin/refund/roomRefund">객실 환불</a></li>
                        <li><a href="/admin/refund/roomRefund">객실 환불</a></li>
                    </ul>
                </li>

                <li><a href="/admin/reports">통계 및 리포트</a></li>
                <li><a href="/admin/settings">설정</a></li>
            </ul>
        </aside>
    </div>
</body>
</html>
