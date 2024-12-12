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
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

header {
    text-align: center;
    margin: 20px 0;
}

header h1 {
    font-size: 2rem;
    margin-bottom: 10px;
}

header p {
    font-size: 1rem;
    color: gray;
}

.category-menu {
    text-align: center;
    margin: 20px 0;
}

.category-menu span {
    margin: 0 10px;
    cursor: pointer;
    color: gray;
}


.product-list {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 20px;
    margin: 20px;
}

.product {
    width: 200px;
    text-align: center;
}

.product img {
    width: 100%;
    border-radius: 10px;
}

.product h3 {
    font-size: 1rem;
    margin: 10px 0;
}

.product .category, .product .date, .product .status {
    font-size: 0.9rem;
    color: gray;
}

.product .status {
    color: green;
    font-weight: bold;
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
    max-width: 1200px;
    margin: 0 auto;
}

.card {
    border: 1px solid #e0e0e0;

    overflow: hidden;
    transition: transform 0.2s;
}

.card:hover {
    transform: translateY(-5px);
}

.card-image {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.card-content {
    padding: 15px;
}

.category {
    color: #666;
    font-size: 14px;
    margin-bottom: 8px;
}

.title {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 8px;
    line-height: 1.4;
}

.date {
    font-size: 14px;
    color: #888;
    margin-bottom: 8px;
}

.status {
    display: inline-block;
    padding: 4px 8px;
    background-color: #f5f5f5;
    border-radius: 4px;
    font-size: 12px;
}

.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 40px;
    gap: 5px;
}

.pagination a {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    border: 1px solid #ddd;
    text-decoration: none;
    color: #333;
}

.pagination a.active {
    background-color: #876B4C;
    color: white;
    border-color: #876B4C;
}

</style>
</head>
<body>
    <header>
        <h1>티켓상품</h1>
        <p>알펜시아 리조트의 특별한 티켓상품을 만나보세요.</p>
    </header>

    <hr style="width:500px;">
    <div class="category-menu">
        <span>전체</span>
        <span>객실+리프트</span>
        <span>리프트+락커</span>
        <span>객실+리프트+락커</span>
    </div>
    <hr style="width:500px; margin-bottom: 50px;">

    <div class="grid-container">
	    <c:forEach var="pack" items="${list}">
	        <div class="card" data-packageno="${pack.packageNo}"> 
	            <img src="/admin/${pack.packImgPath}" class="card-image">
	            <div class="card-content">
	                <div class="title">${fn:substring(pack.packageName, 0, 20)} ..</div>
	                <div class="date">${pack.availableStartDate} ~ ${pack.availableEndDate}</div>
	                <div class="status">
					    <c:choose>
					        <c:when test="${pack.packageStatus == 'Y'}">판매중</c:when>
					        <c:when test="${pack.packageStatus == 'N'}">판매종료</c:when>
					        <c:otherwise>알 수 없음</c:otherwise>
					    </c:choose>
					</div>
	            </div>
	        </div>
	    </c:forEach>
	</div>
	<script>
	    // 카드 하나를 클릭했을 때 이벤트를 처리
	    $(function() {
	        $(".grid-container .card").click(function() {
	            // 상품 번호 가져오기
	            let pno = $(this).data("packageno");
				console.log(pno);
	            // Path Variable 방식으로 이동
	            location.href = "package/" + pno;
	
	            // URL 예: /package/1
	        });
	    });
	</script>

            <div id="pagingArea">
                <ul class="pagination">
	                
	                <c:choose>
	                	<c:when test="${ requestScope.pi.currentPage eq 1 }">
		                    <li class="page-item disabled">
		                    	<a class="page-link" href="#">
		                    		Previous
		                    	</a>
		                    </li>
		                </c:when>
		                <c:otherwise>
		                	<li class="page-item">
		                    	<a class="page-link" href="list.bo?cpage=${ requestScope.pi.currentPage - 1 }">
		                    		Previous
		                    	</a>
		                    </li>
		                </c:otherwise>
	                </c:choose>
                    
                    <c:forEach var="p" begin="${ requestScope.pi.startPage }"
                    				   end="${ requestScope.pi.endPage }" 
                    				   step="1">
                    	<c:choose>
                    		<c:when test="${ p ne requestScope.pi.currentPage }">			   
			                    <li class="page-item">
			                    	<a class="page-link" href="list.bo?cpage=${ p }">
			                    		${ p }
			                    	</a>
			                    </li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item disabled">
			                    	<a class="page-link" href="list.bo?cpage=${ p }">
			                    		${ p }
			                    	</a>
			                    </li>
	                    	</c:otherwise>
	                    </c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ requestScope.pi.currentPage ne requestScope.pi.maxPage }">
                   			<li class="page-item">
                   				<a class="page-link" href="list.bo?cpage=${ requestScope.pi.currentPage + 1 }">
                   					Next
                   				</a>
                   			</li>
                   		</c:when>
                   		<c:otherwise>
                   			<li class="page-item disabled">
                   				<a class="page-link" href="#">
                   					Next
                   				</a>
                   			</li>
                   		</c:otherwise>
                   	</c:choose>
                </ul>
            </div> 

    
</body>
</html>