<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설레눈</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
                    overflow: hidden; /* 페이지 이동 시 스크롤 방지 */
        }

        .container {
            display: flex;
            height: 100vh;
        }

       @keyframes fallFromSky {
    0% {
        transform: translateY(-100vh); /* 화면 위쪽에서 시작 */
        opacity: 0; /* 처음에는 투명하게 시작 */
    }
    50% {
        opacity: 1; /* 중간에 완전히 보이게 */
    }
    100% {
        transform: translateY(0); /* 최종 위치로 이동 */
    }
}

.left {
    width: 50%;
    background-color: #004AAD; /* 파란색 배경 */
    color: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    position: relative;
    animation: fallFromSky 1s ease-out; /* 애니메이션 추가 */
}


        .left h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .left p {
            font-size: 1.2rem;
        }

        .right {
            width: 50%;
            background-image: url('resources/images/ski1.jpg'); /* 이미지 경로를 여기에 설정 */
            background-size: cover;
            background-position: center;
        }

        #btn1 {
    margin-right: 93%;
    background-color: #0B3E74; /* 초기 색상 */
    color: white; 
    transform: rotate(270deg);
    width: 200px;
    height: 60px;
    margin-top: 40px;
    position: absolute;
    z-index: 1;
    animation: colorChange 3s infinite alternate;
    border: none; /* 테두리 없애기 */
    outline: none; /* 포커스 시 나타나는 외곽선 없애기 */
    box-shadow: none; /* 그림자 없애기 */
}

/* 색상 변화를 위한 애니메이션 */
@keyframes colorChange {
    0% {
        background-color: #0B3E74; /* 초기 색상 */
    }
    50% {
        background-color: black; /* 중간에 black으로 변환 */
    }
    100% {
        background-color: #0B3E74; /* 다시 초기 색상으로 돌아옴 */
    }
}


/* 페이지 슬라이드 효과 스타일 */
.slide {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: black;
    transform: translateX(100%) scaleX(0); /* 페이지가 오른쪽으로 벗어나고, 가로 크기를 0으로 설정 */
    opacity: 0; /* 처음에는 보이지 않도록 설정 */
    transition: transform 0.35s ease-in-out, opacity 1.0s ease-in-out; /* 부드러운 전환 효과 */
    z-index: 1000; /* 페이지 전환 시 다른 요소보다 위로 오도록 설정 */
}

/* 페이지가 보이도록 설정하는 클래스 */
.slide.visible {
    transform: translateX(0) scaleX(1); /* 페이지가 왼쪽으로 슬라이드되며 가로 크기가 100%로 펼쳐짐 */
    opacity: 1; /* 화면이 보이도록 설정 */
}

	
		

        #top1 {
            position: absolute;
            top: 20px;
            color: white;
            left: 110px; /* 눈 이미지 오른쪽에 위치하게 조정 */
            font-weight: 500; /* 글씨 두께를 얇게 설정 */

        }

        #top1 p {
            margin: 0;
        }

   
        .snowflake {
            position: absolute;
            top: -10px;
            color: white;
            font-size: 1rem;
            pointer-events: none; /* 마우스 이벤트 방지 */
            animation: fall linear infinite; /* 애니메이션 효과 */
        }

        @keyframes fall {
            0% {
                transform: translateY(0); /* 시작 위치 */
                opacity: 1;
            }
            100% {
                transform: translateY(110vh); /* 화면 아래로 이동 */
                opacity: 0; /* 점점 투명해짐 */
            }
        }

        .snow-image {
            position: absolute;
            top: 280px;
            left: 14px;
            width: 30px;
            transform: rotate(280deg);
            margin-right: 95%;
            z-index: 2; /* 이미지를 버튼보다 위로 오게 설정 */
        }
        .text-container {
  text-align: center;
  color: white; /* 텍스트 색상을 흰색으로 설정 */
  font-family: 'Arial', sans-serif; /* 폰트 설정 */
}

h1 {
  font-size: 3rem; /* 큰 글씨 크기 */
  font-weight: bold; /* 굵은 글씨 */
  letter-spacing: 5px; /* 글자 간격 */
}

h2 {
  font-size: 2rem;
  font-weight: 500; /* 중간 굵기 */
  letter-spacing: 2px;
}

p {
  font-size: 1.2rem;
  font-style: italic; /* 이탤릭체 */
}


    /* SCROLL 옆 가로 선 */
    .scroll-line {
        width: 100px;
        height: 2px;
        background-color: white;
        position: relative;
        margin-left: 10px;
    }

    .moving-circle {
    width: 10px; /* 원 크기 수정 */
    height: 10px; /* 원 크기 수정 */
    background-color: white;
    border-radius: 50%;
    position: absolute;
    top: -4px; /* 원이 선 위에 위치하도록 조정 */
    left: 0;
    animation: moveHorizontal 2s infinite ease-in-out;
}

    @keyframes moveHorizontal {
        0%, 100% {
            transform: translateX(0); /* 원래 위치 */ 
        }
        50% {
            transform: translateX(80px); /* 오른쪽으로 80px 이동 */
        }
    }

    .background-circle {
    position: absolute;
    width: 60px; /* 원의 크기 */
    height: 60px;
    background-color: rgba(255, 255, 255, 0.1); /* 반투명 흰색 */
    border-radius: 50%; /* 원 모양 */
    top: 70%; /* 중앙에 배치 */
    left: 65%   ; /* 중앙에 배치 */
    transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
    z-index: 0; /* 텍스트 뒤로 배치 */
}

.container {
    display: none; /* 초기 상태 */
    opacity: 0; /* 투명 상태로 시작 */
    transition: opacity 1s ease-in-out; /* 부드러운 전환 효과 추가 */
}

.container.visible {
    display: flex; /* 화면 표시 */
    opacity: 1; /* 완전히 보이도록 설정 */
}



   
      .dot-container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100px;
      width: 100%;
      top: 82px;
      right: 170px;
      position: relative;
    }

    .dot {
      width: 10px;
      height: 10px;
      background-color: rgb(138, 135, 135);
      border-radius: 50%;
      margin: 0 5px;
    }

    .dot.active {
      background-color: #2d8ebf;
    }
	
	 #overlay {
    position: fixed;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    background-color: white; /* 오버레이 색상 */
    border-radius: 50%;
    transform: translate(-50%, -50%);
    transition: width 1s ease-in-out, height 1s ease-in-out, background-color 0.5s;
    visibility: hidden; /* 기본적으로 보이지 않음 */
    z-index: 1000;
    overflow: hidden; /* 콘텐츠가 오버레이 크기 외부로 나가지 않도록 */
}

/* 오버레이 활성화 */
#overlay.active {
    width: 200vw; /* 충분히 큰 값으로 설정 */
    height: 200vw;
    visibility: visible;
    background-color: rgba(0, 0, 0, 0.8); /* 부드러운 반투명 효과 */
    transition: width 0.8s cubic-bezier(0.4, 0, 0.2, 1), 
                height 0.8s cubic-bezier(0.4, 0, 0.2, 1),
                background-color 0.3s ease;
}

/* 오버레이 콘텐츠 */
.overlay-content {
    position: relative;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%; /* 화면 전체 높이 */
    display: flex; /* Flexbox 사용 */
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    text-align: center;
    color: white;
    background-color: black; /* 콘텐츠 배경 */
    padding: 20px;
    box-sizing: border-box; /* 패딩 포함 크기 계산 */
    border-radius: 0; /* 둥근 모서리 제거 (선택 사항) */
    box-shadow: none; /* 그림자 제거 (선택 사항) */
    opacity: 0; /* 처음에 콘텐츠 숨기기 */
    transition: opacity 0.5s ease-in-out;
}

/* 오버레이가 활성화되었을 때 콘텐츠 표시 */
#overlay.active .overlay-content {
    opacity: 1;
}

    #menuBtn {
      position: fixed;
      top: 20px;
      right: 20px;
      z-index: 2000;
    }

    #menuBtn button {
      padding: 10px 20px;
      font-size: 16px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    #menuBtn button:hover {
      background-color: #0056b3;
    }
/* 모달 배경 */
.modal {
    display: none;
    position: absolute; /* 부모 div 기준으로 위치를 지정 */
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7); /* 오버레이 효과 */
    z-index: 1000;
    justify-content: center;
    align-items: center;
}

/* 모달 콘텐츠 */
.modal-content {
    background: white;
    width: 90%;
    max-width: 400px;
    padding: 0;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    overflow: hidden;
    position: relative;
}

/* 모달 헤더 */
.modal-header {
    background-color: rgba(0, 0, 0, 0.8);
    color: white;
    padding: 10px;
    text-align: center;
}

/* 모달 바디 */
.modal-body {
    position: relative;
    text-align: center;
    color: white;
    font-family: Arial, sans-serif;
}

.modal-body img {
    width: 100%;
    height: auto;
    border-radius: 10px;
}

.modal-body h3 {
    font-size: 24px;
    font-weight: bold;
    margin: 10px 0;
}

.modal-body p {
    font-size: 16px;
    margin: 5px 0;
}

.modal-footer {
    display: flex;
    justify-content: space-between;
    padding: 10px;
    background-color: white;
}

.modal-footer button {
    background-color: #444;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
}

.modal-footer button:hover {
    background-color: #555;
}

  #widget {
    	width:10px;
    	height:30px;
    	bottom:30px;
    	left:30px;
    	color:black;
    	position: relative;
    	
    }

</style>
</head>
<body>

    <video id="introVideo" autoplay muted playsinline style="
    position: absolute;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: 10;
"></video>

    <div class="container">
        <!-- 왼쪽 섹션 -->
        <div class="left">
            <img src="resources/images/logo.png" style="width: 300px; height: 200px;">

            <div class="text-container">
                <h1>SEOLLEENUN</h1>
                <h2>SKI & RESORT</h2>
                <div class="background-circle"></div>

                <p>Premium Adventure Shop</p>
              </div>
            <img src="resources/images/snow.png" class="snow-image"> 
            <button style="width:200px; height:100px;"><a href="slopeOpen.sm" style="text-decoration:none;">슬로프 오픈 현황</a></button>
            <button id="btn1" style="font-size: 21px;"><a href="search.map" style="color:white; text-decoration:none">찾아오는 길&nbsp;&nbsp;</a></button>
            
            <div id="top1">
                <p style="font-size: 25px;">[Adv:nture]</p> 
                <p>MAKE YOUR </p>
				<%-- 
				<c:choose>
				    <c:when test="${ !empty sessionScope.loginMember }">
				        <a href="${ pageContext.request.contextPath }/myPage.me">마이페이지</a>
				    </c:when>
				    <c:otherwise>
				        로그인 정보가 없습니다.
				    </c:otherwise>
				</c:choose>
					--%>
            </div>

			

            <div style="top: 140px; position: relative; font-size: 15px; left: 20px; display: flex; align-items: center;">
                <div class="scroll-line">
                    <div class="moving-circle"></div>
                </div>
                &nbsp;&nbsp;&nbsp;SCROLL

            </div>
  <div id="popupModal" class="modal">
        <div class="modal-content">
           
            <div class="modal-body">
                <img src="resources/images/modal1.png" style="width: 100%; height: 100%; border-radius: 10px;">
              
            </div>
            <div class="modal-footer">
                <button id="dismissToday" style="background-color: #004AAD; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">오늘 하루 그만보기</button>
                <button id="closeModal" style="background-color: #004AAD; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">닫기</button>
            </div>
        </div>
    </div>
		
			<div class="dot-container">
                <div class="dot active"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
              </div>


        </div>
        <div class="right">
            <!-- 메뉴 버튼 -->
          <button id="menuBtn" style="
                width: 70px; 
                height: 70px; 
                background: url('resources/images/menu.png') no-repeat center center; 
                background-size: cover; 
                border: none; 
                left: 91%;
                top: 20px;
                cursor: pointer;
                position: absolute;
                z-index: 2;
                transition: transform 0.2s ease, opacity 0.2s ease;">
            </button>
            <div style="left: 84%; color: white;position: relative; top: 90px;"><b>MENU</b></div>
			
              <div id="overlay">
	    		<div class="overlay-content">
           	 <jsp:include page="header1.jsp" />
			<button id="closeBtn" style="left: 400px; bottom:270px; position: relative; 
                             background-color: black; 
                             color: white; 
                             border: none; 
                             border-radius: 50%; 
                             width: 40px; 
                             height: 40px; 
                             font-size: 20px; 
                             text-align: center; 
                             display: flex; 
                             align-items: center; 
                             justify-content: center; 
                             cursor: pointer; 
                             transition: background-color 0.3s ease, transform 0.2s ease;">
  X
</button>
            
    	</div>
	  
	  </div>
            
            
        <div style="display: flex; align-items: center; margin: 50px auto; position: relative; justify-content: center;">
    <img src="resources/images/question.png" 
         style="width: 20px; position: absolute; left: 490px; bottom: 0; z-index: 2; bottom:30px;">
    <button id="custom-kakao-channel-button" 
            style="background-color: #004AAD; color: white; border: none; 
                   width: 130px; height: 40px; border-radius: 8px; font-size: 15px; left:160px; bottom:20px;
                   position: relative; z-index: 1;">
        &nbsp;&nbsp;&nbsp;&nbsp;문의하기
    </button>
</div>
    <!-- 위젯 -->
            <div id="widget">
            	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script>
				    $(document).ready(function () {
				        // Ajax 요청
				        $.ajax({
				            url: "widget.sm", // 서버에서 데이터를 가져올 URL
				            method: "GET",
				            success: function (data) {
				                // 데이터를 div에 삽입
				                $("#widget").html(data);
				            },
				            error: function (xhr, status, error) {
				                console.error("Error loading widget:", error);
				            }
				        });
				    });
				</script>
            </div>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script>
    
  
    
    document.addEventListener("DOMContentLoaded", function () {
    	
    	 Kakao.init('dc02060907b4ccb8c6417c5af8b8a228'); // 실제 JavaScript 키로 대체

         // 커스텀 버튼 클릭 이벤트
         const customButton = document.getElementById('custom-kakao-channel-button');
         customButton.addEventListener('click', function () {
           Kakao.Channel.addChannel({
             channelPublicId: '_PPxdxln' // 채널 고유 ID
           });
         });
    	
    	 const popupModal = document.getElementById("popupModal");
    	    const dismissTodayButton = document.getElementById("dismissToday");
    	    const closeModalButtons = document.querySelectorAll("#closeModal");

    	    // 로컬 스토리지를 확인하여 모달 표시 여부 결정
    	    if (localStorage.getItem("dismissModalToday") === "true") {
    	        popupModal.style.display = "none";
    	    } else {
    	        setTimeout(() => {
    	            popupModal.style.display = "flex"; // 모달 표시
    	        }, 1000);
    	    }

    	    // '오늘 하루 그만보기' 버튼 클릭 시 로컬 스토리지에 저장
    	    dismissTodayButton.addEventListener("click", () => {
    	        localStorage.setItem("dismissModalToday", "true");
    	        popupModal.style.display = "none";
    	    });

    	    // '닫기' 버튼 클릭 시 모달 닫기
    	    closeModalButtons.forEach((button) => {
    	        button.addEventListener("click", () => {
    	            popupModal.style.display = "none";
    	        });
    	    });

    	    // 모달 외부 클릭 시 닫기
    	    popupModal.addEventListener("click", (event) => {
    	        if (event.target === popupModal) {
    	            popupModal.style.display = "none";
    	        }
    	    });
    });

  

    
    document.addEventListener("DOMContentLoaded", function () {
        const menuBtn = document.getElementById("menuBtn");
        const overlay = document.getElementById("overlay");
        const closeBtn = document.getElementById("closeBtn");

        // 메뉴 버튼 클릭 시
        menuBtn.addEventListener("click", function () {
            overlay.classList.add("active");

            // 오버레이 콘텐츠의 점진적 표시
            setTimeout(() => {
                overlay.querySelector(".overlay-content").style.opacity = 1;
            }, 300); // 0.5초 후 콘텐츠 표시
        });

        // 닫기 버튼 클릭 시
        closeBtn.addEventListener("click", function () {
            overlay.querySelector(".overlay-content").style.opacity = 0; // 콘텐츠 숨김

            setTimeout(() => {
                overlay.classList.remove("active");
            }, 300); // 0.8초 후 오버레이 닫힘
        });
    });
    
        function createSnowflake() {
            var snowflake = document.createElement('div');
            snowflake.classList.add('snowflake');
            snowflake.textContent = '❄'; // 눈송이 모양
            snowflake.style.left = Math.random() * 100 + 'vw'; // 랜덤 위치
            snowflake.style.animationDuration = (15 + Math.random() * 15) + 's'; // 애니메이션 속도
            snowflake.style.fontSize = (10 + Math.random() * 10) + 'px'; // 눈송이 크기
            document.body.appendChild(snowflake);

            snowflake.addEventListener('animationend', function() {
                snowflake.remove();
            });

            setTimeout(createSnowflake, 1000); // 눈송이 생성 간격
        }

        createSnowflake();



const introVideo = document.getElementById('introVideo');
introVideo.src = 'resources/images/thumnail.mp4'; // 동영상 파일 경로 설정

introVideo.addEventListener('ended', () => {
    introVideo.style.display = 'none'; // 동영상 숨김
    const container = document.querySelector('.container');
    container.style.display = 'flex'; // 화면 표시
    setTimeout(() => {
        container.classList.add('visible'); // 부드럽게 나타나도록 클래스 추가
    }, 10);
});

// 동영상을 클릭하면 스킵되도록 처리
introVideo.addEventListener('click', () => {
    introVideo.style.display = 'none'; // 동영상 숨김
    const container = document.querySelector('.container');
    container.style.display = 'flex'; // 화면 표시
    setTimeout(() => {
        container.classList.add('visible'); // 부드럽게 나타나도록 클래스 추가
    }, 10);
});

let hasScrolled = false; // 스크롤 이벤트가 발생한 여부를 추적하는 변수

//스크롤 또는 터치 이벤트 발생 시
function handleScroll() {
 if (!hasScrolled) {
     // 슬라이드 요소를 만들어서 화면에 추가
     let slideElement = document.createElement('div');
     slideElement.classList.add('slide');
     document.body.appendChild(slideElement);

     // 슬라이드 애니메이션 시작
     setTimeout(function() {
         slideElement.classList.add('visible'); // 슬라이드 애니메이션 적용
     }, 100); // 0.1초 후 애니메이션 시작

     // 애니메이션이 끝난 후 페이지 이동
     setTimeout(function() {
         window.location.href = "<c:url value='/goToMain2' />"; // 페이지 이동
     }, 800); // 1.5초 후 이동

     hasScrolled = true; // 스크롤이 발생했음을 추적
 }
}

//main2.jsp 페이지에 나타날 때 천천히 보이도록 설정
function showMain2() {
 let main2 = document.querySelector('.main2');
 if (main2) {
     main2.classList.add('visible');
 }
}

//페이지 로드 시 main2.jsp가 천천히 나타나도록 설정
window.addEventListener('load', showMain2);

//wheel 이벤트 (마우스 휠)
window.addEventListener('wheel', handleScroll);

//touchmove 이벤트 (터치스크린에서 스크롤)
window.addEventListener('touchmove', handleScroll);

    </script>
</body>
</html>