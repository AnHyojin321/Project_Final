<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
    }


	.hero {
	    position: relative;
	    background: url('${pageContext.request.contextPath}/resources/images/room/mainResort.jpg') no-repeat center center;
	    background-size: cover;
	    height: 500px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}


  .overlay {
    text-align: center;
    color: #fff;
    background: rgba(0, 0, 0, 0.5);
    padding: 20px;
    border-radius: 10px;
  }

  .hero .overlay h1 {
      font-size: 36px;
      margin: 0;
    }

    .hero .overlay p {
      font-size: 18px;
      margin: 10px 0;
    }

  .search-box {
    margin-top: 100px;
    background: rgba(255, 255, 255, 0.9);
    padding: 15px 20px;
    border-radius: 10px;
    display: inline-block;
    text-align: left;
  }

  .search-box form {
    display: flex;
    gap: 15px;
    align-items: center;
  }

  .input-group {
    display: flex;
    flex-direction: column;
  }

  .input-group label {
    font-size: 14px;
    margin-bottom: 5px;
    color: #333;
  }

  .input-group input,
  .input-group select {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
  }

  .search-btn {
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
  }

  .search-btn:hover {
    background-color: #555;
  }

    .content {
      text-align: center;
      padding: 40px 20px;
    }

    .content h2 {
      font-size: 28px;
      margin-bottom: 10px;
    }

    .content p {
      color: #555;
      font-size: 18px;
      line-height: 1.5;
    }
    
    a {
	    text-decoration: none; /* 밑줄 제거 */
	    color: black; /* 글씨 색상을 검정색으로 */
	}

    .rooms {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 20px;
      padding: 20px;
      max-width: 1200px;
      margin: 0 auto;
    }

    .room {
      background: #fff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      transition: transform 0.3s;
    }

    .room:hover {
      transform: scale(1.05);
    }

    .room img {
      width: 100%;
      height: 300px;
      object-fit: cover;
    }

    .room-details {
      padding: 15px;
    }

    .room-details h3 {
      margin: 0;
      font-size: 20px;
    }

    .room-details p {
      color: #777;
      font-size: 14px;
      margin: 10px 0;
    }

    .room-details .btn {
      display: inline-block;
      background: #c9a53b;
      color: #fff;
      padding: 8px 12px;
      border-radius: 4px;
      text-decoration: none;
      font-size: 14px;
    }

    /*-------------------*/

	.garden {
	  display: flex;
	  align-items: center;
	  padding: 40px 20px;
	  background-color: #f5f5f5;
	}
	
	.garden-content {
	  display: flex;
	  gap: 20px;
	  max-width: 1200px;
	  margin: 0 auto;
	  padding-left: 20px; /* 왼쪽 간격을 넓힘 */
	}
	
	.garden-img {
	  width: 50%;
	  border-radius: 8px;
	}
	
	.garden-text {
	  padding-left : 20px;
	  width: 50%;
	  display: flex;
  	  flex-direction: column;
  	  justify-content: center; /* 텍스트 수직 중앙 정렬 */
	}
	
	.garden-text h2 {
	  font-size: 28px;
	  margin-bottom: 10px;
	}
	
	.garden-text p {
	  
	  font-size: 16px;
	  color: #555;
	  line-height: 1.8; /* 문장 간격을 넓힘 */
	  letter-spacing: 0.5px; /* 문자 간격을 넓힘 */
	}

	.garden-text a {
	    text-align : right;
		padding-bottom : 10px;
	}


	
	  .facilities {
	    padding: 40px 20px;
	    text-align: center;
	  }
	
	  .facilities h2 {
	    font-size: 28px;
	    margin-bottom: 20px;
	  }
	
  /* 슬라이드 편의시설 */
  .carousel {
    position: relative;
    overflow: hidden;
    max-width: 1200px;
    margin: 0 auto;
  }

  .carousel-track {
    display: flex;
    transition: transform 0.3s ease-in-out;
  }

  .carousel-item {
    min-width: 33.33%; /* 한 번에 3개씩 보여지도록 */
    text-align: center;
    padding: 10px;
  }

  .carousel-item img {
    width: 100%;
    height: 350px;
    border-radius: 8px;
  }

  .carousel-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 50%;
    padding: 10px;
    cursor: pointer;
  }

  .prev-btn {
    left: 10px;
  }

  .next-btn {
    right: 10px;
  }
	  .prev-btn {
	    left: 10px;
	  }
	
	  .next-btn {
	    right: 10px;
	  }
  </style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

  <div class="hero">
    <div class="overlay">
      <h1>seolleneun Resort</h1>
      <p>이국적인 제주의 자연과 여유로운 낭만의 만남</p>
      <div class="search-box">
        <form>
          <div class="input-group">
            <label for="checkin">체크인</label>
            <input type="date" id="checkin" name="checkin">
          </div>
          <div class="input-group">
            <label for="checkout">체크아웃</label>
            <input type="date" id="checkout" name="checkout">
          </div>
          <div class="input-group">
            <label for="guests">인원</label>
            <select id="guests" name="guests">
              <option value="2">2명</option>
              <option value="4">4명</option>
              <option value="6">6명</option>
            </select>
          </div>
          <button type="submit" class="search-btn">객실 조회</button>
        </form>
      </div>
    </div>
  </div>



  <div class="content">
    <h2>SEOLLENEUN RESORT</h2>
    <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>
  </div>
  <div class="rooms">
    <div class="room">
    	<a href="roomDetail.ro?roomType=standard">
	      <img src="${pageContext.request.contextPath}/resources/images/room/standard.jpg">
		  <div class="room-details">
		  	 <h3>Standard Room</h3>
		  	 <p>편안한 침대와 아름다운 전망</p>
	      </div>
   		</a>
    </div>
    <div class="room">
    	<a href="roomDetail.ro?roomType=suite">
	      <img src="${pageContext.request.contextPath}/resources/images/room/suite.jpg">
	      <div class="room-details">
	        <h3>Suite Room</h3>
	        <p>럭셔리한 스위트룸에서의 특별한 경험</p>
	        <a href="#" class="btn">자세히 보기</a>
	      </div>
      </a>
    </div>
    <div class="room">
    	<a href="roomDetail.ro?roomType=deluxe">
	      <img src="${pageContext.request.contextPath}/resources/images/room/deluxe.jpg">
	      <div class="room-details">
	        <h3>Deluxe Room</h3>
	        <p>편안한 침대와 아름다운 전망</p>
	        <a href="#" class="btn">자세히 보기</a>
	      </div>
      </a>
    </div>
  </div> <br><br>
  

	<div class="garden">
	  <div class="garden-content">
	    <img src="${pageContext.request.contextPath}/resources/images/room/resort.jpg" class="garden-img">
	    <div class="garden-text">
	      <h2>설레눈 리조트</h2>
	      <p>
	        설레눈 리조트는 스키와 겨울 스포츠를 즐길 수 있는 최적의 장소입니다. <br>
	        경치 좋은 설산에서 스키를 즐기며, 자연과 하나되는 특별한 경험을 선사합니다. <br>
	        스키 슬로프와 가까운 위치에서 편안하게 숙박하며, <br>
	        겨울의 매력을 마음껏 느낄 수 있습니다. 여유로운 휴식과 활동을 동시에 제공하는 설레눈 리조트에서 <br>
	        완벽한 겨울 여행을 계획하세요.
	      </p>
	      <a href="#" class="btn">자세히 보기</a>
	    </div>
	  </div>
	</div>
  
<div class="facilities">
  <h2>Facilities</h2>
  <div class="carousel">
    <button class="carousel-btn prev-btn">←</button>
    <div class="carousel-track">
      <div class="carousel-item">
        <img src="${pageContext.request.contextPath}/resources/images/room/facility1.jpg">
        <h3>Playzone</h3>
        <p>플레이존</p>
      </div>
      <div class="carousel-item">
        <img src="${pageContext.request.contextPath}/resources/images/room/facility2.jpg">
        <h3>Pingpong Room</h3>
        <p>탁구실</p>
      </div>
      <div class="carousel-item">
        <img src="${pageContext.request.contextPath}/resources/images/room/facility3.jpg">
        <h3>Heated Swimming Pool</h3>
        <p>사계절 온수풀</p>
      </div>
      <div class="carousel-item">
        <img src="${pageContext.request.contextPath}/resources/images/room/facility4.jpg" alt="Spa">
        <h3>Spa</h3>
        <p>스파</p>
      </div>
      <div class="carousel-item">
        <img src="${pageContext.request.contextPath}/resources/images/room/facility5.jpg">
        <h3>Fitness Center</h3>
        <p>피트니스 센터</p>
      </div>
    </div>
    <button class="carousel-btn next-btn">→</button>
  </div>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>