<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>분실물 목록</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;            
            background-color: #f5f5f5;
            color: #333;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            font-size: 28px;
            color: #2a2a72;
        }

               .info-box {
            background-color: #e8f4fd;
            padding: 15px;
            margin: 20px auto;
            width: 90%;
            max-width: 800px;
            border: 1px solid #d6e9f9;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }


        .info-box p {
            margin: 5px 0;
            font-size: 14px;
            color: #333;
        }
   .filter-form {
            width: 90%;
            max-width: 900px;
            margin: 20px auto;
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
         .filter-form label {
            font-weight: bold;
            margin-right: 10px;
        }

           .filter-form input, .filter-form select, .filter-form button {
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }


          .filter-form button {
        padding: 10px 15px;
        font-size: 14px;
        font-weight: bold;
        border: none;
        border-radius: 25px;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s ease;
        color: #fff;
        background: linear-gradient(to right, #4a90e2, #74b9ff); /* 그라데이션 */
        text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2); /* 약간의 텍스트 그림자 */
    }

      .filter-form button:hover {
        background: linear-gradient(to right, #357ab7, #5caeff); /* 호버 효과 */
        transform: translateY(-2px); /* 약간 위로 이동 */
    }

        table {
            width: 90%;
            max-width: 1000px;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #f0f7ff;
            font-weight: bold;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
a {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; /* 부모 요소의 텍스트 색상 상속 */
}
        tr:hover {
            background-color: #f1f7ff;
        }

        .pagination {
            text-align: center;
            margin: 20px 0;
        }

        .pagination a {
            text-decoration: none;
            padding: 8px 12px;
            margin: 0 5px;
            background-color: #ddd;
            color: #333;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .pagination a:hover, .pagination b {
            color: black;
        }

       .btn {
        display: inline-block;
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 25px;
        text-decoration: none;
        color: white;
        background: linear-gradient(to right, #4a90e2, #74b9ff);
        text-align: center;
        transition: background 0.3s ease, transform 0.2s ease;
    }

        .btn:hover {
        background: linear-gradient(to right, #357ab7, #5caeff);
        transform: translateY(-2px);
    }

       
        @media (max-width: 768px) {
            .filter-form {
                flex-direction: column;
                align-items: stretch;
            }

            .filter-form input, .filter-form select, .filter-form button {
                width: 100%;
            }
        }
        
           #content {
        background-size: cover;
        position: relative;
        padding: 20px;
    }

    #content::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(255, 255, 255, 0.6); /* 반투명 효과 */
        z-index: 1;
    }

    #content > * {
        position: relative;
        z-index: 2;
    }
        
    </style>
</head>
<body>
  <jsp:include page="../common/header.jsp" />


	<div id ="content">
    <h1>분실물 센터</h1>

    <!-- 안내 메시지 -->
    <div class="info-box">
        <p>- 설레눈리조트 내에 발생하는 습득물의 보관 기간은 1개월 입니다.</p>
        <p>- 1개월 내 찾지 않은 습득물은 선별하여,  기부를 통해 어려운 이웃에게 전달됩니다.</p>
    </div>

     <form class="filter-form" method="get" action="${pageContext.request.contextPath}/lostList">
            <label for="startDate">시작일:</label>
            <input type="text" id="startDate" name="startDate" value="${filter.startDate}" placeholder="날짜 선택" />
            
            <label for="endDate">종료일:</label>
            <input type="text" id="endDate" name="endDate" value="${filter.endDate}" placeholder="날짜 선택" />
            
            <label for="location">위치:</label>
            <select id="location" name="location">
                <option value="">전체</option>
                <option value="로비" ${filter.location == '로비' ? 'selected' : ''}>로비</option>
                <option value="리조트" ${filter.location == '리조트' ? 'selected' : ''}>리조트</option>
                <option value="슬로프" ${filter.location == '슬로프' ? 'selected' : ''}>슬로프</option>
                <option value="리프트" ${filter.location == '리프트' ? 'selected' : ''}>리프트</option>
                <option value="주차장" ${filter.location == '주차장' ? 'selected' : ''}>주차장</option>
            </select>
            
            <button type="submit">검색</button>
            <button type="button" id="resetButton">초기화</button>
        </form>

    <!-- 목록 테이블 -->
    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>위치</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="item" items="${list}">
            <tr>
                <td>${item.lostNo}</td>
                <td><a href="${pageContext.request.contextPath}/lostItemDetail?lostNo=${item.lostNo}">${item.lostTitle}</a></td>
                <td>${item.lostLocation}</td>
                <td>
                    <fmt:formatDate value="${item.createDate}" pattern="yyyy.MM.dd" />
                </td>
                <td>${item.count}</td>
            </tr>
        </c:forEach>
    </table>

    <!-- 페이징 처리 -->
    <div class="pagination">
        <c:if test="${pi.startPage > 1}">
            <a href="?currentPage=${pi.startPage - 1}">&laquo; 이전</a>
        </c:if>

        <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="i">
            <c:choose>
                <c:when test="${i == pi.currentPage}">
                    <b>${i}</b>
                </c:when>
                <c:otherwise>
                    <a href="?currentPage=${i}&startDate=${filter.startDate}&endDate=${filter.endDate}&location=${filter.location}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${pi.endPage < pi.maxPage}">
            <a href="?currentPage=${pi.endPage + 1}&startDate=${filter.startDate}&endDate=${filter.endDate}&location=${filter.location}">다음 &raquo;</a>
        </c:if>
    </div>
    </div>
      <jsp:include page="../common/footer.jsp" />
    	
    	  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        // Flatpickr 적용
        flatpickr("#startDate", {
            dateFormat: "Y-m-d",
            locale: "ko"
        });
        flatpickr("#endDate", {
            dateFormat: "Y-m-d",
            locale: "ko"
        });

        // 초기화 버튼 동작
        document.getElementById('resetButton').addEventListener('click', function () {
            document.getElementById('startDate').value = '';
            document.getElementById('endDate').value = '';
            document.getElementById('location').selectedIndex = 0;
        });
    </script>
</body>
</html>
