<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 90%;
            margin: 20px auto;
            background: #fff;

        }
        h1 {
            text-align: center;
            color: #333;
            padding: 10px 0;
        }
        .filter {
            text-align: center;
            margin-bottom: 15px;
        }
        .filter button {
            padding: 10px 20px;
            margin: 5px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            color: #495057;
            background-color: #ffffff;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .filter button:hover {
            background-color: #e9ecef;
            border-color: #adb5bd;
            color: #212529;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        img {
            width: 100px;
            height: 70px;
            object-fit: cover;
            border-radius: 5px;
        }
        button {
            padding: 5px 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button.delete {
            background-color: #DC3545;
        }
        button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
	<div class="admin-container">
		<jsp:include page="../common/sidebar.jsp" />
	    <div class="container">
	        <h1>객실 목록</h1>
	        <div class="filter">
	            <button onclick="filterRooms('all')">전체</button>
	            <button onclick="filterRooms('스탠다드')">스탠다드</button>
	            <button onclick="filterRooms('스위트')">스위트</button>
	            <button onclick="filterRooms('디럭스')">디럭스</button>
	        </div>
	        <table id="roomTable">
	            <tr>
	                <th>이미지</th>
	                <th>객실명</th>
	                <th>타입입</th>
	                <th>예약 상태</th>
	                <th>수정</th>
	                <th>삭제</th>
	            </tr>
	            <!-- Dummy Data -->
	            <tr data-type="스탠다드">
	                <td><img src="/images/room1.jpg" alt="객실"></td>
	                <td>스탠다드룸 1</td>
	                <td>스탠다드</td>
	                <td>o</td>
	                <td><button onclick="editRoom(1)">수정</button></td>
	                <td><button class="delete" onclick="deleteRoom(1)">삭제</button></td>
	            </tr>
	            <!-- Repeat rows as necessary -->
	        </table>
	    </div>
	</div>
    <script>
        function editRoom(id) {
            alert(id + '번 객실 수정 페이지로 이동합니다.');
            window.location.href = 'editRoom.jsp?roomId=' + id;
        }

        function deleteRoom(id) {
            if (confirm('정말 삭제하시겠습니까?')) {
                alert(id + '번 객실이 삭제되었습니다.');
                // 서버에 삭제 요청 (AJAX 또는 서버 측 처리)
            }
        }

        function filterRooms(type) {
            const rows = document.querySelectorAll('#roomTable tr');
            rows.forEach((row, index) => {
                if (index === 0) return; // 헤더 제외
                const roomType = row.getAttribute('data-type');
                if (type === 'all' || roomType === type) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>