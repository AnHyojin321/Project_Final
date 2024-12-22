<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>예약 상세 정보</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <h1>예약 상세 정보</h1>
    <p><strong>객실 번호:</strong> ${room.roomNo}</p>
    <p><strong>객실 이름:</strong> ${room.roomName}</p>
    <p><strong>객실 설명:</strong> ${room.roomDesc}</p>
    <p><strong>객실 타입:</strong> ${room.roomType}</p>
    <p><strong>수용 인원:</strong> ${room.capacity}명</p>
    <p><strong>객실 가격:</strong> ${room.roomPrice}원</p>
    <a href="${pageContext.request.contextPath}/myPage.me">뒤로 가기</a>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
