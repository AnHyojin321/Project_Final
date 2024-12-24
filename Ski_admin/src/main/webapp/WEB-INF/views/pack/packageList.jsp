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
    .container {
        width: 90%;
        max-width: 1200px;
        padding: 20px;
        overflow-x: auto;
    }

    .container h1 {
        text-align: left;
        margin-bottom: 20px;
        font-size: 30px;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table thead {
        background-color: #90adca;
        color: #fff;
    }

    table th, table td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }

    table th {
        font-size: 16px;
        font-weight: bold;
    }

    table tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .btn {
        display: inline-block;
        padding: 8px 16px;
        margin: 5px;
        font-size: 14px;
        color: #fff;
        background-color: #2c3e50;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        text-decoration: none;
        text-align: center;
    }

    .btn:hover {
        background-color: #0056b3;
    }

    .btn-delete {
        background-color: #dc3545;
    }

    .btn-delete:hover {
        background-color: #a71d2a;
    }
    
    table tbody tr {
	    transition: background-color 0.3s ease; /* 부드러운 색상 전환 */
	}
	
	table tbody tr:hover {
	    background-color: lightgray; /* 마우스 오버 시 배경색 변경 */
	    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
	}
	
	/* 페이징 처리 관련 css */
	/* 페이지네이션 관련 css */
	#pagingArea {
	    text-align: center;
	    margin-top: 20px;
	}
	
	.custom-pagination {
	    display: inline-flex;
	    list-style: none;
	    padding: 0;
	    margin: 0;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    overflow: hidden;
	    background-color: #f9f9f9;
	}
	
	.custom-pagination li {
	    margin: 0;
	    border-right: 1px solid #ddd;
	}
	
	.custom-pagination li:last-child {
	    border-right: none;
	}
	
	.custom-pagination a,
	.custom-pagination span {
	    display: inline-block;
	    padding: 8px 12px;
	    text-decoration: none;
	    font-size: 14px;
	    color: #555;
	    background-color: #f9f9f9;
	    transition: all 0.2s ease-in-out;
	}
	
	.custom-pagination a:hover {
	    background-color: #e2e6ea;
	    color: #333;
	}
	
	.custom-pagination li.current span {
	    color: white;
	    background-color: darkgray;
	    font-weight: bold;
	    border: none;
	    cursor: default;
	}
	
	.custom-pagination li.disabled span {
	    color: #aaa;
	    background-color: #f9f9f9;
	    cursor: not-allowed;
	}
	
	.custom-pagination li.disabled span:hover {
	    background-color: #f9f9f9;
	}
	
	.custom-pagination a:active {
	    background-color: #dcdcdc;
	}
	
	/* 필터링 관련  css */
    .filter-container {
        display: flex;
        justify-content: right;
        align-items: center;
        margin-bottom: 20px;
        gap: 10px;
        
    }

    .filter-label {
        font-size: 16px;
        font-weight: bold;
        color: #333;
    }

    .filter-select {
        width: 150px;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
        color: #333;
        background-color: #fff;
        transition: all 0.3s ease;
    }

    .filter-select:focus {
        border-color: #007bff;
        box-shadow: 0 0 4px rgba(0, 123, 255, 0.5);
        outline: none;
    }

    .filter-button {
        padding: 8px 12px;
        font-size: 14px;
        font-weight: bold;
        color: white;
        background-color: #007bff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .filter-button:hover {
        background-color: #0056b3;
    }


	
</style>
</head>
<body>
	<div class="admin-container">
		<jsp:include page="../common/sidebar.jsp" />
	
	    <div class="container">
	        <h1>패키지 상품 목록</h1>
	        <a href="packReservList.pk">패키지 예약 내역 목록</a>
	        
		   <!-- 필터링 UI -->
		    <div class="filter-container">
		        <label for="packageFilter" class="filter-label">패키지 구성:</label>
		        <select id="packageFilter" class="filter-select">
		            <option value="">전체</option>
		            <option value="객실+리프트">객실+리프트</option>
		            <option value="리프트+락커">리프트+락커</option>
		            <option value="객실+리프트+락커">객실+리프트+락커</option>
		        </select>
		        <button id="applyFilter" class="filter-button">검색</button>
		    </div>	        
	        <table id="packageList">
	            <thead>
	                <tr>
	                    <th>상품 번호</th>
	                    <th>상품 구성</th>
	                    <th width="300">상품 이름</th>
	                    <th>시작 날짜</th>
	                    <th>마감 날짜</th>
	                    <th>판매여부</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:forEach var="p" items="${list}">
	                <tr data-packageno="${p.packageNo}">
	                    <td>${p.packageNo}</td>
	                    <td>
					        <c:choose>
					            <c:when test="${p.packageSet == 1}">객실+리프트</c:when>
					            <c:when test="${p.packageSet == 2}">리프트+락커</c:when>
					            <c:otherwise>객실+리프트+락커</c:otherwise>
					        </c:choose>
					    </td>
	                    <td>${p.packageName}</td>
	                    <td>${p.availableStartDate}</td>
	                    <td>${p.availableEndDate}</td>
	                    <td>${p.packageStatus}</td>
	                </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        <a href="packEnrollForm.pk" class="btn">새 패키지 등록</a>
	        
	        
	        <!-- 페이징바 관련 영역 -->
	       <div id="pagingArea">
		    <ul class="custom-pagination">
		        <!-- 왼쪽 화살표 -->
		        <c:choose>
		            <c:when test="${requestScope.pi.currentPage eq 1}">
		                <li class="disabled">
		                    <span>&lt;</span>
		                </li>
		            </c:when>
		            <c:otherwise>
		                <li>
		                    <a href="list.pk?cpage=${requestScope.pi.currentPage - 1}">&lt;</a>
		                </li>
		            </c:otherwise>
		        </c:choose>
		
		        <!-- 페이지 번호 -->
		        <c:forEach var="p" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}" step="1">
		            <c:choose>
		                <c:when test="${p ne requestScope.pi.currentPage}">
		                    <li>
		                        <a href="list.pk?cpage=${p}">${p}</a>
		                    </li>
		                </c:when>
		                <c:otherwise>
		                    <li class="current">
		                        <span>${p}</span>
		                    </li>
		                </c:otherwise>
		            </c:choose>
		        </c:forEach>
		
		        <!-- 오른쪽 화살표 -->
		        <c:choose>
		            <c:when test="${requestScope.pi.currentPage ne requestScope.pi.maxPage}">
		                <li>
		                    <a href="list.pk?cpage=${requestScope.pi.currentPage + 1}">&gt;</a>
		                </li>
		            </c:when>
		            <c:otherwise>
		                <li class="disabled">
		                    <span>&gt;</span>
		                </li>
		            </c:otherwise>
		        </c:choose>
		    </ul>
		</div>
	    </div>
	
	    
    </div>
    <script>
	    // 카드 하나를 클릭했을 때 이벤트를 처리
	    $(function() {
	        $("#packageList>tbody>tr").click(function() {
	            // 상품 번호 가져오기
	            let pno = $(this).data("packageno");
	            
				// console.log(pno);
	            // 상세 페이지로 이동
	            location.href = "package/" + pno;

	        });
	    });
	</script>
	
	
	
	
    
</body>
</html>