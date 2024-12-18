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
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
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
</style>
</head>
<body>
	<div class="admin-container">
		<jsp:include page="../common/sidebar.jsp" />
	    <div class="container">
	        <h1>패키지 상품 목록</h1>
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