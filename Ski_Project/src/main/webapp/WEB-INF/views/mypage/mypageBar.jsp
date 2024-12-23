<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .nav-bar {
            display: flex;
            justify-content: center;

            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        .nav-bar a {
            margin: 0 40px; /* a 태그 간격을 더 넓게 설정 */
            text-decoration: none;
            color: #333;
            font-size: 1em;
        }
        .nav-bar a:hover {
            color: #007BFF;
            border-bottom: 2px solid #007BFF;
            padding-bottom: 5px;
        }

    </style>
</head>
<body>
    <div class="nav-bar">
        <a href="#">대시보드</a>
        <a href="#">락커 예약</a>
        <a href="#">패키지</a>
        <a href="#">리프트권</a>
        <a href="myRoomReservation.ro">객실 예약</a>
        <a href="#">강습 예약</a>
        <a href="#">결제 관리</a>
    </div>

</body>
</html>