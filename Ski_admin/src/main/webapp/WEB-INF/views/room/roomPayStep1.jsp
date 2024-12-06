<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
	  font-family: Arial, sans-serif;
	  margin: 0;
	  padding: 0;
	}
	
	.reservation-menu {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  background-color: #f8f8f8;
	  padding: 20px 0;
	  gap: 60px;
	}
	
	.menu-item {
	  text-align: center;
	  cursor: pointer;
	}
	
	.menu-item .icon {
	  width: 100px;
	  height: 100px;
	  border-radius: 50%;
	  background-color: #fff;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  margin-bottom: 5px;
	  transition: background-color 0.3s ease;
	}
	
	.menu-item img {
	  width: 50px;
	  height: 50px;
	}
	
	.menu-item span {
	  font-size: 14px;
	  color: #333;
	}
	
	.menu-item.active .icon {
	  background-color: #2a4d9e;
	}
	
	.menu-item.active span {
	  color: #2a4d9e;
	}
	
	.reservation-steps {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  margin-top: 20px;
	  gap: 20px;
	}
	
	.step {
	  font-size: 14px;
	  color: #333;
	  position: relative;
	}
	
	.step.active {
	  font-weight: bold;
	}
	
	.step:not(:last-child)::after {
	  content: '>';
	  margin-left: 10px;
	  color: #aaa;
	}


</style>
</head>
<body>
  <div class="reservation-menu">
    <div class="menu-item active">
      <div class="icon">
        <img src="${pageContext.request.contextPath}/resources/images/room/bed.png">
      </div>
      <span>객실</span>
    </div>
    <div class="menu-item">
      <div class="icon">
        <img src="${pageContext.request.contextPath}/resources/images/room/locker.png">
      </div>
      <span>락커</span>
    </div>
    <div class="menu-item">
      <div class="icon">
        <img src="${pageContext.request.contextPath}/resources/images/room/lift.png">
      </div>
      <span>리프트</span>
    </div>
    <div class="menu-item">
      <div class="icon">
        <img src="${pageContext.request.contextPath}/resources/images/room/package.png">
      </div>
      <span>패키지</span>
    </div>
  </div>

  <div class="reservation-steps">
    <span class="step active">STEP1. 객실/날짜 선택</span>
    <span class="step">STEP2. 예약정보 입력</span>
    <span class="step">STEP3. 결제정보 입력</span>
    <span class="step">STEP4. 예약완료</span>
  </div>
</body>
</html>