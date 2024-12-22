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
    padding: 10px 15px;
}

.custom-pagination li {
    margin: 0 5px;
}

.custom-pagination a,
.custom-pagination span {
    display: inline-block;
    padding: 8px 12px;
    text-decoration: none;
    color: #34495e;
    transition: all 0.2s ease-in-out;
}

.category-menu span.active {
    font-weight: bold;
    color: #34495e;
}




</style>
</head>
<body>
    <header>
        <h1>패키지상품</h1>
        <p>설레눈 리조트의 특별한 티켓상품을 만나보세요.</p>
    </header>

    <hr style="width:500px;">
    <div class="category-menu">
        <span onclick="location.href='list.pk?cpage=1'">전체</span>
        <span data-packageSet="1">객실+리프트</span>
        <span data-packageSet="2">리프트+락커</span>
        <span data-packageSet="3">객실+리프트+락커</span>
    </div>
    <hr style="width:500px; margin-bottom: 50px;">
    
    <script>
    $(document).ready(function () {
        // 카테고리 클릭 이벤트
        $(".category-menu span").slice(1).on("click", function () {
            var packageSet = $(this).data("packageset"); // 선택한 카테고리 번호

            location.href = "packageList.pk?packageSet=" + packageSet + "&capge=1"; // URL 생성과 동시에 이동	

            
        });
    });
    
    $(document).ready(function () {
        // URL에서 packageSet 값을 가져옴
        const urlParams = new URLSearchParams(window.location.search);
        const packageSet = urlParams.get("packageSet");

        // 기본 active 설정
        if (packageSet) {
            $(".category-menu span").removeClass("active"); // 모든 active 제거
            $(".category-menu span[data-packageset='" + packageSet + "']").addClass("active"); // 해당 packageSet에 active 추가
        } else {
            $(".category-menu span").removeClass("active");
            $(".category-menu span:first-child").addClass("active"); // "전체"를 기본 active로 설정
        }

        // 클릭 이벤트 처리
        $(".category-menu span").on("click", function () {
            $(".category-menu span").removeClass("active"); // 기존 active 제거
            $(this).addClass("active"); // 현재 클릭한 요소에 active 추가
        });
    });

    </script>
	
	
<div id="packageList">
 <!-- 상품 목록과 페이징 버튼이 이곳에 동적으로 로드됩니다 -->

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
		                    <a href="packageList.pk?packageSet=${packageSet}&cpage=${requestScope.pi.currentPage - 1}">&lt;</a>
		                </li>
		            </c:otherwise>
		        </c:choose>
		
		        <!-- 페이지 번호 -->
		        <c:forEach var="p" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}" step="1">
		            <c:choose>
		                <c:when test="${p ne requestScope.pi.currentPage}">
		                    <li>
		                        <a href="packageList.pk?packageSet=${packageSet}&cpage=${p}">${p}</a>
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
		                    <a href="packageList.pk?packageSet=${packageSet}&cpage=${requestScope.pi.currentPage + 1}">&gt;</a>
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
    <script>
 

    </script>

    
</body>
</html>