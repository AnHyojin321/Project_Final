<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 관리</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* 전체 레이아웃 스타일 */
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



        .member-table-container h1 {
            font-size: 2.5em;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .member-table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .member-table th,
        .member-table td {
            padding: 15px;
            text-align: left;
        }

        .member-table th {
            background-color: #2c3e50;
            color: white;
            font-size: 1em;
        }

        .member-table td {
            background-color: white;
            font-size: 0.95em;
            border-bottom: 1px solid #ddd;
        }

        .member-table tr:hover td {
            background-color: #f1f3f5;
        }

        /* 버튼 스타일 */
        .member-table td button {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
        }

        .member-table td .edit {
            background-color: #007bff;
        }

        .member-table td .edit:hover {
            background-color: #0056b3;
        }

        .member-table td .delete {
            background-color: #dc3545;
        }

        .member-table td .delete:hover {
            background-color: #c82333;
        }

        /* 애니메이션 효과 */
        .member-table-container {
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
            /* 검색 바 스타일 */
    .filter-bar {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 20px;
        gap: 10px;
        padding: 10px;
        background-color: transparent; /* 배경색 제거 */
    }

    .filter-input {
        padding: 10px;
        width: 200px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    .filter-input:focus {
        border-color: #007bff;
        box-shadow: 0 0 4px rgba(0, 123, 255, 0.5);
        outline: none;
    }

    .filter-select {
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ddd;
        border-radius: 4px;
        background-color: #fff;
        transition: border-color 0.3s, box-shadow 0.3s;
        cursor: pointer;
    }

    .filter-select:focus {
        border-color: #007bff;
        box-shadow: 0 0 4px rgba(0, 123, 255, 0.5);
        outline: none;
    }

    .filter-button {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 14px;
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

    /* 페이징 스타일 */
    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
        gap: 5px;
    }

    .pagination a {
        padding: 10px 15px;
        text-decoration: none;
        color: #007bff;
        border: none; /* 테두리 제거 */
        border-radius: 4px;
        transition: background-color 0.3s, color 0.3s;
        font-size: 14px;
    }

    .pagination a:hover {
        background-color: #007bff;
        color: white;
    }

    .pagination a.active {
        background-color: #007bff;
        color: white;
        font-weight: bold;
    }

    .pagination a.disabled {
        pointer-events: none;
        background-color: transparent;
        color: #aaa;
    }	
    header {
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-bottom: 20px;
}

header h1 {
    font-size: 2.5em;
    color: #2c3e50;
    margin-bottom: 10px;
}

header .welcome-msg {
    font-size: 1.2em;
    color: #6c757d;
    margin: 5px 0;
}

header .stats-container {
    margin-top: 10px;
}

header .stats {
    font-size: 1em;
    color: #343a40;
    margin: 0;
}

header .stats strong {
    color: #007bff;
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
    <h1>회원 관리</h1>
    <p class="welcome-msg">환영합니다, <strong>관리자님</strong>!</p>
    <div class="stats-container">
        <p class="stats">
            현재 총 회원 수: <strong>${totalMembers}</strong>명, 
            가입 중인 회원 수: <strong>${activeMembers}</strong>명
        </p>
    </div>
</header>

            
            <div class="filter-bar">
    <form action="members.ad" method="get" class="filter-form">
        <!-- 검색어 입력 -->
        <input type="text" name="keyword" placeholder="이름 검색" value="${keyword}" class="filter-input">
        
        <!-- 회원 상태 선택 -->
        <select name="memberStatus" class="filter-select">
            <option value="">전체</option>
            <option value="Y" ${memberStatus == 'Y' ? 'selected' : ''}>가입중</option>
            <option value="N" ${memberStatus == 'N' ? 'selected' : ''}>탈퇴</option>
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
            
            
            <div class="member-table-container">
                <table class="member-table">
                    <thead>
                        <tr>
                            <th>회원번호</th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>생년월일</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>가입일</th>
                            <th>상태</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="member" items="${memberList}">
                            <tr>
                                <td>${member.memberNo}</td>
                                <td>${member.memberName}</td>
                                <td>${member.memberId}</td>
                                <td>${member.birthDate}</td>
                                <td>${member.email}</td>
                                <td>${member.phone}</td>
                                <td>${member.createDate}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${member.memberStatus == 'Y'}">가입중</c:when>
                                        <c:otherwise>탈퇴</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <button class="edit"  onclick="openModal('${member.memberNo}', '${member.memberId}', '${member.memberName}', '${member.email}', '${member.memberStatus}')">수정</button>
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
        <a href="members.ad?currentPage=${pi.currentPage - 1}&keyword=${keyword}&memberStatus=${memberStatus}&pageSize=${pageSize}">&laquo;</a>
    </c:if>

    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
        <a href="members.ad?currentPage=${p}&keyword=${keyword}&memberStatus=${memberStatus}&pageSize=${pageSize}" class="${p == pi.currentPage ? 'active' : ''}">${p}</a>
    </c:forEach>

    <c:if test="${pi.currentPage < pi.maxPage}">
        <a href="members.ad?currentPage=${pi.currentPage + 1}&keyword=${keyword}&memberStatus=${memberStatus}&pageSize=${pageSize}">&raquo;</a>
    </c:if>
</div>
    

    <!-- 모달 -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>회원 정보 수정</h2>
            <form class="modal-form" id="editForm">
                <label for="memberNo">회원번호:</label>
                <input type="text" id="memberNo" name="memberNo" readonly>

                <label for="memberId">아이디:</label>
                <input type="text" id="memberId" name="memberId" readonly>

                <label for="memberName">이름:</label>
                <input type="text" id="memberName" name="memberName">

                <label for="email">이메일:</label>
                <input type="email" id="email" name="email">

                <label for="memberStatus">상태:</label>
                <select id="memberStatus" name="memberStatus">
                    <option value="Y">가입중</option>
                    <option value="N">탈퇴</option>
                </select>

                <button type="submit">수정 완료</button>
            </form>
        </div>
    </div>

    <script>
        // 모달 관련 JavaScript
        var modal = document.getElementById("editModal");
        var span = document.getElementsByClassName("close")[0];

        function openModal(memberNo, memberId, memberName, email, memberStatus) {
            modal.style.display = "block";
            document.getElementById("memberNo").value = memberNo;
            document.getElementById("memberId").value = memberId;
            document.getElementById("memberName").value = memberName;
            document.getElementById("email").value = email;
            document.getElementById("memberStatus").value = memberStatus;
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        // 폼 제출 처리
        document.getElementById("editForm").onsubmit = function(e) {
            e.preventDefault();

            // 입력된 데이터 가져오기
            var memberNo = document.getElementById("memberNo").value;
            var memberStatus = document.getElementById("memberStatus").value;

            // AJAX 요청
            $.ajax({
                url: "updateStatus.ad", // 서버의 Controller URL
                type: "POST", // POST 요청
                data: {
                    memberNo: memberNo,
                    memberStatus: memberStatus
                },
                success: function(response) {
                    if (response === "success") {
                        alert("회원 상태가 성공적으로 변경되었습니다.");
                        modal.style.display = "none";
                        location.reload(); // 페이지 새로고침
                    } else {
                        alert("회원 상태 변경에 실패했습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 오류:", status, error);
                    alert("에러가 발생했습니다. 다시 시도해주세요.");
                }
            });
        }
    </script>

</body>
</html>
