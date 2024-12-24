<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리프트권 구매 조회</title>
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
    </style>
</head>
<body>
    <div class="admin-container">
        <!-- 사이드바 include -->
        <jsp:include page="../common/sidebar.jsp" />
        
        <!-- 메인 콘텐츠 영역 -->
        <main class="content-area">
                    <header>
                <h1>리프트권 구매 조회</h1>
                <p class="welcome-msg">환영합니다, <strong>관리자님</strong>!</p>
            </header>
            
            <div class="filter-bar">
			    <form action="liftPurchase.se" method="get" class="filter-form">
			        <!-- 검색어 입력 -->
			        <input type="text" name="keyword" placeholder="아이디 검색" value="${keyword}" class="filter-input">
			        
			        <!-- 회원 상태 선택 -->
			        <select name="liftLrefundStatus" class="filter-select">
			            <option value="">전체</option>
			            <option value="N" ${liftLrefundStatus == 'N' ? 'selected' : ''}>결제</option>
			            <option value="Y" ${liftLrefundStatus == 'Y' ? 'selected' : ''}>환불</option>
			        </select>
			        
			        <!-- 페이지 크기 선택 -->
			        <select name="pageSize" class="filter-select">
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
                            <th>구매번호</th>
                            <th>회원아이디</th>
                            <th>구매일</th>
                            <th>구매개수</th>
                            <th>구매금액</th>
                            <th>패키지사용여부</th>
                            <th>환불</th>
                            <th>환불일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="lift" items="${liftPurchaseList}">
                            <tr>
                                <td>${lift.liftPurchaseNo}</td>
                                <td>${lift.memberId}</td>
                                <td>${lift.liftPurchaseDate}</td>
                                <td>${lift.totalCount}</td>
                                <td>${lift.totalPrice}</td>
                                <td>
                                	<c:choose>
                                        <c:when test="${lift.packLiftUsed == 'Y'}">O</c:when>
                                        <c:otherwise>X</c:otherwise>
                                    </c:choose>
								</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${lift.liftLrefundStatus == 'Y'}">환불완료</c:when>
                                        <c:otherwise>결제완료</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${lift.liftLrefundDate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
    <div class="pagination">
    <c:if test="${pi.currentPage > 1}">
        <a href="liftPurchase.se?currentPage=${pi.currentPage - 1}&keyword=${keyword}&liftLrefundStatus=${liftLrefundStatus}&pageSize=${pageSize}">&laquo;</a>
    </c:if>

    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
        <a href="liftPurchase.se?currentPage=${p}&keyword=${keyword}&liftLrefundStatus=${liftLrefundStatus}&pageSize=${pageSize}" class="${p == pi.currentPage ? 'active' : ''}">${p}</a>
    </c:forEach>

    <c:if test="${pi.currentPage < pi.maxPage}">
        <a href="liftPurchase.se?currentPage=${pi.currentPage + 1}&keyword=${keyword}&liftLrefundStatus=${liftLrefundStatus}&pageSize=${pageSize}">&raquo;</a>
    </c:if>
</div>
</body>
</html>
