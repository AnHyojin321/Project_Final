<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>강습 관리</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        .admin-container {
            display: flex;
            min-height: 100vh;
        }

        .content-area {
            flex-grow: 1;
            padding: 30px;
            background-color: #f8f9fa;
        }

        header h1 {
            font-size: 2.5em;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .welcome-msg {
            font-size: 1.2em;
            color: #6c757d;
        }

        .lesson-table-container h1 {
            font-size: 2.5em;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .lesson-table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .lesson-table th,
        .lesson-table td {
            padding: 15px;
            text-align: left;
        }

        .lesson-table th {
            background-color: #2c3e50;
            color: white;
            font-size: 1em;
        }

        .lesson-table td {
            background-color: white;
            font-size: 0.95em;
            border-bottom: 1px solid #ddd;
        }

        .lesson-table tr:hover td {
            background-color: #f1f3f5;
        }

        .lesson-table td button {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
        }

        .lesson-table td .edit {
            background-color: #007bff;
        }

        .lesson-table td .edit:hover {
            background-color: #0056b3;
        }

        .lesson-table td .delete {
            background-color: #dc3545;
        }

        .lesson-table td .delete:hover {
            background-color: #c82333;
        }

        .lesson-table-container {
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            border-radius: 8px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-form {
            display: flex;
            flex-direction: column;
        }

        .modal-form label {
            margin-top: 10px;
        }

        .modal-form input,
        .modal-form select {
            margin-top: 5px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .modal-form button {
            margin-top: 20px;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .modal-form button:hover {
            background-color: #0056b3;
        }
            .status-success {
        color: #28a745; /* 녹색 */
        font-weight: bold;
    }

    .status-pending {
        color: #ffc107; /* 주황색 */
        font-weight: bold;
    }
.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
}

.pagination a {
    display: inline-block;
    margin: 0 5px;
    padding: 8px 12px;
    text-decoration: none;
    font-size: 14px;
    color: #007bff; /* 기본 파란색 */
    border: 1px solid #ddd;
    border-radius: 4px;
    transition: background-color 0.3s, color 0.3s;
}

.pagination a:hover {
    background-color: #007bff;
    color: white;
    border-color: #007bff;
}

.pagination a.active {
    background-color: #007bff;
    color: white;
    border-color: #007bff;
}

.pagination a.disabled {
    pointer-events: none;
    color: #aaa;
    border-color: #ddd;
    background-color: #f8f9fa;
}
/* 필터 바 스타일 */
.filter-bar {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
    gap: 10px;
    align-items: center;
}

/* 입력 필드 스타일 */
.filter-input {
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ddd;
    border-radius: 4px;
    width: 200px;
    transition: border-color 0.3s;
}

.filter-input:focus {
    border-color: #007bff;
    outline: none;
}

/* 셀렉트 박스 스타일 */
.filter-select {
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ddd;
    border-radius: 4px;
    transition: border-color 0.3s;
    cursor: pointer;
}

.filter-select:focus {
    border-color: #007bff;
    outline: none;
}

/* 검색 버튼 스타일 */
.filter-button {
    padding: 10px 20px;
    font-size: 14px;
    border: none;
    border-radius: 4px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

.filter-button:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}

.filter-button:active {
    transform: scale(0.95);
}
    
    </style>
</head>
<body>
    <div class="admin-container">
        <!-- 사이드바 include -->
        <jsp:include page="../common/sidebar.jsp" />
        
        <!-- 메인 콘텐츠 영역 -->
        <main class="content-area">
            <header>
                <h1>강습 관리</h1>
                <p class="welcome-msg">환영합니다, <strong>관리자님</strong>!</p>
            </header>
            
<div class="filter-bar">
    <form action="lesson.ad" method="get" class="filter-form">
        <!-- 검색어 입력 -->
        <input type="text" name="keyword" placeholder="제목 검색" value="${keyword}" class="filter-input">
        
        <!-- 예약 상태 필터 -->
        <select name="resStatus" class="filter-select">
            <option value="">전체</option>
            <option value="Y" ${resStatus == 'Y' ? 'selected' : ''}>입금 완료</option>
            <option value="N" ${resStatus == 'N' ? 'selected' : ''}>입금 대기중</option>
        </select>

        <!-- 페이지 크기 선택 -->
        <select name="pageSize" onchange="this.form.submit()" class="filter-select">
            <option value="10" ${pageSize == 10 ? 'selected' : ''}>10개씩 보기</option>
            <option value="20" ${pageSize == 20 ? 'selected' : ''}>20개씩 보기</option>
            <option value="100" ${pageSize == 100 ? 'selected' : ''}>100개씩 보기</option>
        </select>
        
        <!-- 검색 버튼 -->
        <button type="submit" class="filter-button">검색</button>
    </form>
</div>


            <div class="lesson-table-container">
                <table class="lesson-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>예약상태</th>
                            <th>제목</th>
                            <th>강습프로그램</th>
                            <th>강습시간</th>
                            <th>접수기간</th>
                            <th>시작일</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
					    <c:forEach var="lesson" items="${lessonList}">
					        <tr>
					            <td>${lesson.resNo}</td>
					            <td>
					                <c:choose>
					                    <c:when test="${lesson.resStatus == 'Y'}">
					                        <span class="status-success">입금 성공</span>
					                    </c:when>
					                    <c:otherwise>
					                        <span class="status-pending">입금 대기중</span>
					                    </c:otherwise>
					                </c:choose>
					            </td>
					            <td>${lesson.lessonTitle}</td>
					            <td>${lesson.lessonType}</td>
					            <td>${lesson.lessonTime}</td>
					            <td>${lesson.lessonResDate}</td>
					            <td>${lesson.lessonDate}</td>
					            <td>
					                <button class="edit" 
					                    onclick="openModal('${lesson.resNo}', '${lesson.lessonTitle}', '${lesson.lessonType}', '${lesson.lessonTime}', '${lesson.lessonResDate}', '${lesson.lessonDate}', '${lesson.resStatus}')">
					                    수정
					                </button>
					            </td>
					        </tr>
					    </c:forEach>
					</tbody>
                </table>
            </div>
        </main>
    </div>
    
<div class="pagination">
    <c:if test="${pi.currentPage > 1}">
        <a href="lesson.ad?currentPage=${pi.currentPage - 1}&keyword=${keyword}&resStatus=${resStatus}&pageSize=${pageSize}">&laquo;</a>
    </c:if>

    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
        <a href="lesson.ad?currentPage=${p}&keyword=${keyword}&resStatus=${resStatus}&pageSize=${pageSize}" class="${p == pi.currentPage ? 'active' : ''}">${p}</a>
    </c:forEach>

    <c:if test="${pi.currentPage < pi.maxPage}">
        <a href="lesson.ad?currentPage=${pi.currentPage + 1}&keyword=${keyword}&resStatus=${resStatus}&pageSize=${pageSize}">&raquo;</a>
    </c:if>
</div>

    <!-- 모달 -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>강습 정보 수정</h2>
            <form class="modal-form" id="editForm">
                <label for="resNo">번호:</label>
                <input type="text" id="resNo" name="resNo" readonly>

                <label for="lessonTitle">제목:</label>
                <input type="text" id="lessonTitle" name="lessonTitle">

                <label for="lessonType">강습프로그램:</label>
                <input type="text" id="lessonType" name="lessonType">

                <label for="lessonTime">강습시간:</label>
                <input type="text" id="lessonTime" name="lessonTime">

                <label for="lessonResDate">접수기간:</label>
                <input type="text" id="lessonResDate" name="lessonResDate">

                <label for="lessonDate">시작일:</label>
                <input type="text" id="lessonDate" name="lessonDate">

                <label for="resStatus">입금 상태:</label>
                <select id="resStatus" name="resStatus">
                    <option value="Y">입금 완료</option>
                    <option value="N">입금 대기중</option>
                </select>

                <button type="submit">수정 완료</button>
            </form>
        </div>
    </div>

    <script>
        var modal = document.getElementById("editModal");
        var span = document.getElementsByClassName("close")[0];

        function openModal(resNo, lessonTitle, lessonType, lessonTime, lessonResDate, lessonDate, resStatus) {
            modal.style.display = "block";
            document.getElementById("resNo").value = resNo;
            document.getElementById("lessonTitle").value = lessonTitle;
            document.getElementById("lessonType").value = lessonType;
            document.getElementById("lessonTime").value = lessonTime;
            document.getElementById("lessonResDate").value = lessonResDate;
            document.getElementById("lessonDate").value = lessonDate;
            document.getElementById("resStatus").value = resStatus;
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        document.getElementById("editForm").onsubmit = function(e) {
            e.preventDefault();

            var resNo = document.getElementById("resNo").value;
            var lessonTitle = document.getElementById("lessonTitle").value;
            var lessonType = document.getElementById("lessonType").value;
            var lessonTime = document.getElementById("lessonTime").value;
            var lessonResDate = document.getElementById("lessonResDate").value;
            var lessonDate = document.getElementById("lessonDate").value;
            var resStatus = document.getElementById("resStatus").value;
            $.ajax({
                url: "lesson/updateStatus.ad", // 정확한 URL 사용
                type: "POST",
                data: {
                    resNo: resNo,
                    resStatus: resStatus, // 데이터 이름 확인
                },
                success: function (response) {
                    console.log("응답 결과:", response); // 서버 응답 확인
                    if (response === "success") {
                        alert("상태 변경 성공");
                        modal.style.display = "none";
                        location.reload(); // 변경된 내용을 반영하기 위해 페이지 새로고침
                    } else {
                        alert("상태 변경 실패");
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX 요청 오류:", error);
                    alert("서버 통신 중 오류가 발생했습니다.");
                },
            });



        };
        
        
        
        
        
    </script>
</body>
</html>