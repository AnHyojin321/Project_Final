<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬로프 오픈 현황</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    #title {
        color: #2c3e50;
		width:80%;
		margin:10px auto;
		margin-top:50px;
    }

	.dashboard-tables {
        width: 80%;
        margin: 0 auto;
        text-align: center;
        margin-bottom:100px;
    }
    .dashboard-tables table {
        width: 100%; 
        border-collapse: collapse;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		font-weight: bold;
		font-size: 17px;
		background-color: rgba(230, 230, 255, 0.2);
    }

    .dashboard-tables th,
    .dashboard-tables td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    .dashboard-tables th {
        background-color: #2c3e50;
        color: white;
        font-size: 1em;
    }

    .dashboard-tables td {
        font-size: 0.9em;
    }

	#title>div {
		text-align: right;
		padding-right:10px;
		font-size:18px;
	}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div>
	<jsp:include page="../common/header.jsp" />
	<div id="title">
		<h1>슬로프 오픈 현황 <span id="currentDate"></span></h1>
		<div>
			<i class="fa-solid fa-o fa-xl" style="color:rgb(40, 150, 255);"></i> : OPEN
			&nbsp;&nbsp;
			<i class="fa-solid fa-xmark fa-xl" style="color: #a0a0a0;"></i> : CLOSE		
		</div>
		<script>
	    // 현재 날짜와 요일 가져오기
	    const currentDate = new Date();
	    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
	    const formattedDate = currentDate.toLocaleDateString('ko-KR', options);
	
	    // "현재 날짜, 요일" 형식으로 출력
	    document.getElementById("currentDate").innerText = `(\${formattedDate})`;
	</script>
	</div>
	<section class="dashboard-tables">
	    <table border="1px solid black">
	        <thead>
	            <tr>
	                <th width="30%">난이도</th>
	                <th width="20%">슬로프</th>
	                <th width="20%">오픈 현황</th>
	                <th width="20%">사유</th>
	            </tr>
	        </thead>
	          <tbody>
			    <c:set var="currentLevel" value="" />
			        <c:forEach var="slope" items="${list}">
					    <tr>
					        <!-- 난이도가 바뀌었을 경우 rowspan 설정 -->
					        <c:if test="${currentLevel != slope.slopeLevel}">
					            <c:set var="currentLevel" value="${slope.slopeLevel}" />
					            <td rowspan="${levelCounts[currentLevel]}">
					                <c:choose>
					                    <c:when test="${currentLevel == 'Beginner'}">초급</c:when>
					                    <c:when test="${currentLevel == 'Intermediate'}">중급</c:when>
					                    <c:when test="${currentLevel == 'Advanced'}">상급</c:when>
					                    <c:when test="${currentLevel == 'Expert'}">최상급</c:when>
					                    <c:otherwise>${currentLevel}</c:otherwise>
					                </c:choose>
					            </td>
					        </c:if>
					        <td>
					            <c:choose>
					                <c:when test="${slope.slopeName == 'Crystal Path'}">크리스탈 패스</c:when>
					                <c:when test="${slope.slopeName == 'Snowflake Glide'}">스노우플레이크 그라이드</c:when>
					                <c:when test="${slope.slopeName == 'Bluebird Trail'}">블루버드 트레일</c:when>
					                <c:when test="${slope.slopeName == 'Frostbite Run'}">프로스트바이트 런</c:when>
					                <c:when test="${slope.slopeName == 'Glacier Alley'}">그리셜 얼레이</c:when>
					                <c:when test="${slope.slopeName == 'Summit Slide'}">서밋 슬라이드</c:when>
					                <c:when test="${slope.slopeName == 'Icicle Pass'}">아이시클 패스</c:when>
					                <c:when test="${slope.slopeName == 'Avalanche Chute'}">애벌랜치 슈트</c:when>
					                <c:when test="${slope.slopeName == 'Blizzard Peak'}">블리자드 피크</c:when>
					                <c:when test="${slope.slopeName == 'Thunder Ridge'}">썬더 리지</c:when>
					                <c:when test="${slope.slopeName == 'Fury Descent'}">퓨리 디센트</c:when>
					                <c:when test="${slope.slopeName == 'Dragon Spine'}">드래곤 스파인</c:when>
					                <c:otherwise>${slope.slopeName}</c:otherwise>
					            </c:choose>
					        </td>
					        <td>
							    <c:choose>
							        <c:when test="${slope.slopeIsOpen == 'Y'}">
							            <i class="fa-solid fa-o fa-2xl" style="color:rgb(40, 150, 255);"></i>
							            <i class="fa-solid fa-xmark fa-2xl" style="color: #a0a0a0; display:none;"></i>
							        </c:when>
							        <c:otherwise>
							            <i class="fa-solid fa-o fa-2xl" style="color:rgb(40, 150, 255); display:none;"></i>
							            <i class="fa-solid fa-xmark fa-2xl" style="color: #a0a0a0;"></i>
							        </c:otherwise>
							    </c:choose>
							</td>
					        <td><c:if test="${slope.slopeIsOpen != 'Y'}">${slope.slopeNote}</c:if></td>
					    </tr>
					</c:forEach>
			  </tbody>
	    </table>
	</section>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>
