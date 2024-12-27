<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>


.card-container {
	border : 1px dashed black;
	border-radius : 10px;
    width: 50%;
    margin : 30px auto;
    background-color: #fff;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.card-header {
    background-color: #2c3e50;
    color: #fff;
    text-align: center;
}

.card-header h1 {
    font-size: 23px;
    margin-bottom: 5px;
}

.card-header p {
    font-size: 20px;

    margin-right : 200px;
}

.card-image-section {
    padding: 20px;
    text-align: center;
}

.card-image {
    max-width: 30%;
}

.card-details {
    padding: 20px;
}

.detail-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 15px;
    border-bottom: 1px dashed #ddd;
    padding-bottom: 10px;
}

.label {
    font-weight: bold;
    color: #333;
}

.value {
    color: #555;
}

.status.active {
    color: green;
    font-weight: bold;
}

.status.inactive {
    color: red;
    font-weight: bold;
}

.card-footer {
    padding: 20px;
    display: flex;
    justify-content: space-around;
}

.card-footer a {
	text-decoration: none;
	color : white;
	font-weight : 500;
}

.btn {
    padding: 10px 20px;
    font-size: 1rem;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn.edit {
      color: #27ae60;
      background-color: #eafaf1;
}

.btn.delete {
      color: #e74c3c;
      background-color: #fdecea;
}


.btn.back {
   color: #f39c12;
   background-color: #fdf6e3;
}



</style>
</head>
<body>
	<div class="admin-container">
		<jsp:include page="../common/sidebar.jsp" />
	    <div class="card-container">
	        <header class="card-header">
	            <h1>${p.packageName}</h1>
	            <p>상품 번호: #${p.packageNo}</p>
	        </header>
	
	        <div class="card-image-section">
	            <img src="../${p.packImgPath}" class="card-image">
	        </div>
	
	        <div class="card-details">
	            <div class="detail-row">
	                <span class="label">가격</span>
	                <span class="value">${p.packagePrice}원</span>
	            </div>
	            <div class="detail-row">
	                <span class="label">판매 기간</span>
	                <span class="value">${fn:substring(pack.availableStartDate, 0, 10)} ~ ${fn:substring(pack.availableEndDate, 0, 10)}</span>
	            </div>
	            <div class="detail-row">
	                <span class="label">상품 구성</span>
	                <span class="value">${p.productComposit}</span>
	            </div>
	            <div class="detail-row">
	                <span class="label">패키지 세트</span>
	                <span class="value">
	                    <c:choose>
	                        <c:when test="${p.packageSet == 1}">객실+리프트</c:when>
	                        <c:when test="${p.packageSet} == 2}">리프트+락커</c:when>
	                        <c:otherwise>객실+리프트+락커</c:otherwise>
	                    </c:choose>
	                </span>
	            </div>
	            <div class="detail-row">
	                <span class="label">상태</span>
	                <span class="value">
	                    <c:choose>
	                        <c:when test="${p.packageStatus == 'Y'}">판매중</c:when>
	                        <c:otherwise>판매종료</c:otherwise>
	                    </c:choose>
	                </span>
	            </div>
	        </div>
	
	        <footer class="card-footer">
	       		<a class="btn edit" onclick="packageFormSubmit(1);">수정</a>
				<a class="btn delete" onclick="packageFormSubmit(2);">삭제</a>
				<a href="/admin/list.pk" class="btn back">목록</a>
	        </footer>
	        
	        <form id="packageForm" action="" method="post">
	        	<input type="hidden" name="pno" value="${p.packageNo}">
	        	<input type="hidden" name="filePath" value="${p.packImgPath}">
	        </form>
	    </div>
	 </div>   
	    <script>
	    	function packageFormSubmit(num) {
	    		if(num == 1) {
	    			$("#packageForm").attr("action", "../updateForm.pk").submit();
	    		} else {
	    			$("#packageForm").attr("action", "../deletePackage.pk").submit();
	    		}
	    	}
	    </script>
</body>
</html>