<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>
<script>
  document.querySelectorAll('.card').forEach(card => {
    const cardInner = card.querySelector('.card-inner');
    
    card.addEventListener('mouseenter', () => {
      gsap.to(cardInner, {
        rotateY: 180,
        duration: 0.8,
        ease: 'power2.out',
      });
    });

    card.addEventListener('mouseleave', () => {
      gsap.to(cardInner, {
        rotateY: 0,
        duration: 0.8,
        ease: 'power2.out',
      });
    });
  });
</script>
<title>Insert title here</title>

  <style>
     body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background: url('${pageContext.request.contextPath}/resources/images/room/background.jpg') no-repeat center center fixed;
      background-size: cover;
      position: relative;
    }

    /* 투명도 처리용 */
    body::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5); /* 투명도 설정 (0.5는 50% 투명) */
      z-index: -1; /* 배경 이미지보다 뒤로 보내기 */
    }

    .content {
      text-align: center;
      padding: 40px 20px;
      color: #fff; /* 흰색 텍스트로 설정 */
    }

    .content h2 {
      font-size: 28px;
      margin-bottom: 10px;
    }

    .content p {
      color: #ccc; /* 약간 밝은 회색으로 텍스트 색상 설정 */
      font-size: 18px;
      line-height: 1.5;
      font-weight : 600;
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


    /*-------------------*/

    .garden {
      display: flex;
      align-items: center;
      padding: 40px 20px;
      background-color: rgba(255, 255, 255, 0.8); /* 투명도 있는 배경 */
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
    }
    
    .garden-text {
      padding-left: 20px;
      width: 70%;
      display: flex;
      flex-direction: column;
      justify-content: center; /* 텍스트 수직 중앙 정렬 */
    }
    
    .garden-text h2 {
      font-size: 28px;
      margin-bottom: 10px;
    }
    
    .garden-text p {
      font-size: 15px;
      color: #555;
      line-height: 1.8; /* 문장 간격을 넓힘 */
      letter-spacing: 0.5px; /* 문자 간격을 넓힘 */
    }

    
    
    /* gsap */
  .card {
    width: 350px;
    height: 450px;
    perspective: 1000px; /* 3D 효과를 위한 원근감 설정 */
    margin: 20px;
    overflow: hidden; /* 카드 내부 요소가 튀어나오지 않도록 설정 */
        border-radius: 10px; /* 카드 전체의 모서리 둥글게 설정 */
  }
  
  .card-inner {
    width: 100%;
    height: 100%;
    position: relative;
    transform-style: preserve-3d; /* 3D 변환 유지 */
    transition: transform 0.8s ease; /* 뒤집히는 애니메이션 */
    transform-origin: center center; /* 회전 중심을 카드의 중앙으로 설정 */
  }
  
    .card:hover .card-inner {
      transform: rotateY(180deg); /* 카드 뒤집기 */
    }
  
  .card-front,
  .card-back {
    position: absolute;
    width: 100%;
    height: 100%;
    backface-visibility: hidden; /* 뒤쪽 숨김 */
    border-radius: 10px; /* 카드 모서리 둥글게 */
    overflow: hidden;
  }
  
    .card-front {
      background: #fff;
    }
  
	  .card-front img {
	    width: 100%;
	    height: 100%;
	    object-fit: cover; /* 이미지가 영역에 맞게 조정 */
	  }
  
  .card-back {
    background-color: rgba(255, 255, 255, 0.8); /* 투명도 있는 배경 */
    color: black;
    transform: rotateY(180deg); /* 뒷면 회전 */
    display: flex; /* Flexbox 사용 */
    flex-direction: column; /* 텍스트를 세로로 정렬 */
    justify-content: center; /* 수직 중앙 정렬 */
    align-items: center; /* 가로 중앙 정렬 */
    text-align: center; /* 텍스트 중앙 정렬 */
    padding: 20px; /* 내부 간격 설정 */
    border-radius: 10px; /* 카드의 모서리를 둥글게 */
    box-sizing: border-box; /* 패딩 포함 크기 계산 */
  }

  .card-back h3 {
    font-size: 24px;
    margin: 0 0 10px 0; /* 상단과 하단 여백 설정 */
  }

  .card-back p {
    font-size: 16px;
    line-height: 1.5; /* 텍스트 줄 간격 */
    margin: 0; /* 추가 여백 제거 */
  }
    
     .section {
         padding: 100px 20px;
         text-align: center;
         height: 200px; /* 각 섹션을 화면 크기로 설정 */
         display: flex; /* Flexbox 사용 */
	    flex-direction: column; /* 텍스트를 세로로 정렬 */
	    justify-content: center; /* 수직 중앙 정렬 */
	    align-items: center; /* 가로 중앙 정렬 */
	    text-align: center; /* 텍스트 중앙 정렬 */
     }

     .scroll-effect {
         opacity: 0; /* 초기 상태: 투명 */
         transform: translateY(50px); /* 초기 상태: 아래로 이동 */
     }
     
  </style>
</head>
<body>

  <jsp:include page="../common/header.jsp" />

  <div class="content">
    <h2>SEOLLENEUN RESORT</h2>
    <p>
      설레눈 리조트의 객실은 편안함과 세련미를 겸비한 공간으로, 모든 투숙객에게 특별한 휴식 시간을 제공합니다. <br>
      총 50여 개의 객실과 스위트룸은 넓고 아늑하게 설계되어 자연 속에서의 완벽한 힐링을 선사합니다.
    </p>
  </div>
  
  <div class="rooms">
  
	   <div class="card">
	     <a href="roomDetail.ro?roomType=standard">
	        <div class="card-inner">
	          <!-- 앞면: 숙소 사진 -->
	          <div class="card-front">
	            <img src="${pageContext.request.contextPath}/resources/images/room/standard.jpg">
	          </div>
	          <!-- 뒷면: 숙소 설명 -->
	          <div class="card-back">
	            <h3>Standard Room</h3>
	            <p>편안한 침대와 아름다운 전망을 제공합니다.</p>
	          </div>
	        </div>
	     </a>    
	  </div>
	  	   <div class="card">
	     <a href="roomDetail.ro?roomType=suite">
	        <div class="card-inner">
	          <!-- 앞면: 숙소 사진 -->
	          <div class="card-front">
	            <img src="${pageContext.request.contextPath}/resources/images/room/suite.jpg">
	          </div>
	          <!-- 뒷면: 숙소 설명 -->
	          <div class="card-back">
	            <h3>Suite Room</h3>
	            <p>럭셔리한 스위트룸에서의 특별한 경험</p>
	          </div>
	        </div>
	     </a>    
	  </div>
	  	   <div class="card">
	     <a href="roomDetail.ro?roomType=deluxe">
	        <div class="card-inner">
	          <!-- 앞면: 숙소 사진 -->
	          <div class="card-front">
	            <img src="${pageContext.request.contextPath}/resources/images/room/deluxe.jpg">
	          </div>
	          <!-- 뒷면: 숙소 설명 -->
	          <div class="card-back">
	            <h3>Deluxe Room</h3>
	            <p>편안한 침대와 아름다운 전망</p>
	          </div>
	        </div>
	     </a>    
	  </div>
	  
 </div>

 

  <div class="garden">
    <div class="garden-content">
      <img src="${pageContext.request.contextPath}/resources/images/room/resort.jpg" class="garden-img">
      <div class="garden-text section">
        <h2 class="scroll-effect">설레눈 리조트</h2>
        <p class="scroll-effect">
          설레눈 리조트는 스키와 겨울 스포츠를 즐길 수 있는 최적의 장소입니다. <br>
          경치 좋은 설산에서 스키를 즐기며, 자연과 하나되는 특별한 경험을 선사합니다. <br>
          스키 슬로프와 가까운 위치에서 편안하게 숙박하며, <br>
          겨울의 매력을 마음껏 느낄 수 있습니다. 여유로운 휴식과 활동을 동시에 제공하는 설레눈 리조트에서
          완벽한 겨울 여행을 계획하세요.
        </p>
      </div>
    </div>
  </div>
      <script>
        gsap.registerPlugin(ScrollTrigger);

        // ScrollTrigger를 활용한 애니메이션
        gsap.utils.toArray('.scroll-effect').forEach((element) => {
            gsap.fromTo(
                element,
                {
                    opacity: 0, // 초기 상태: 투명
                    y: 50, // 초기 상태: 아래로 이동
                },
                {
                    opacity: 1, // 최종 상태: 완전히 보임
                    y: 0, // 최종 상태: 제자리
                    duration: 1, // 애니메이션 지속 시간
                    ease: "power3.out", // 부드러운 애니메이션 효과
                    scrollTrigger: {
                        trigger: element, // 트리거로 사용할 요소
                        start: "top 80%", // 애니메이션 시작 위치
                        toggleActions: "play none none none", // 스크롤 동작 설정
                    },
                }
            );
        });
    </script>

  <jsp:include page="../common/footer.jsp" />
</body>
</html>
