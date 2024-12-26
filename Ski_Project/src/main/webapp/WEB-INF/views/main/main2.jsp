<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
             opacity: 0;
             overflow:hidden;
            animation: fadeIn 1s forwards; /* 화면이 부드럽게 나타나는 애니메이션 */
        }

		  /* 부드럽게 화면이 나타나는 애니메이션 */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }


        .container {
            display: flex;
            height: 100vh;
        }

        .left {
            width: 40%;
            background-color: white; /* 파란색 배경 */
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .left h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .left p {
            font-size: 1.2rem;
        }

        .right {
            width: 60%;
            background-image: url('resources/images/main2.jpeg'); /* 이미지 경로를 여기에 설정 */
            background-size: cover;
            background-position: center;
        }

        #btn1 {
    margin-right: 94%;
    background-color: #0B3E74; /* 초기 색상 */
    color: white;
    transform: rotate(270deg);
    width: 200px;
    height: 70px;
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




        #top1 {
            position: absolute;
            top: 20px;
            color: black;
            left: 110px; /* 눈 이미지 오른쪽에 위치하게 조정 */
            font-weight: 500; /* 글씨 두께를 얇게 설정 */

        }

        #top1 p {
            margin: 0;
        }

      

       
        /* 눈송이 스타일 */
        .snowflake {
            position: absolute;
            top: -10px;
            color: white;
            font-size: 1rem;
            pointer-events: none;
            animation: fall linear infinite;
        }

        @keyframes fall {
            to {
                transform: translateY(110vh);
                opacity: 0;
            }
        }

        .snow-image {
            position: absolute;
            top: 285px;
            left: 10px;
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

}


    /* SCROLL 옆 가로 선 */
    .scroll-line {
        width: 100px;
        height: 2px;
        background-color: black;
        position: relative;
        margin-left: 10px;
    }

    .moving-circle {
    width: 10px; /* 원 크기 수정 */
    height: 10px; /* 원 크기 수정 */
    background-color: black;
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
    background-color: rgb(213, 209, 209); /* 반투명 흰색 */
    border-radius: 50%; /* 원 모양 */
    top: 63%; /* 중앙에 배치 */
    left: 40%   ; /* 중앙에 배치 */
    transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
    z-index: 0; /* 텍스트 뒤로 배치 */
    transition: background-color 0.3s ease; /* 부드러운 색 변화 */

}

.background-circle1 {
    position: absolute;
    width: 60px; /* 원의 크기 */
    height: 60px;
    background-color: rgb(213, 209, 209); /* 반투명 흰색 */
    border-radius: 50%; /* 원 모양 */
    top: 63%; /* 중앙에 배치 */
    left: 51%   ; /* 중앙에 배치 */
    transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
    z-index: 0; /* 텍스트 뒤로 배치 */
    transition: background-color 0.3s ease; /* 부드러운 색 변화 */

}

.background-circle2 {
            position: absolute;
            width: 35px; /* 원의 크기 */
            height: 35px;
            background-color: rgb(213, 209, 209); /* 반투명 흰색 */
            border-radius: 50%; /* 원 모양 */
            top: 63%; /* 중앙에 배치 */
            left: 30%;
            transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
            z-index: 0; /* 텍스트 뒤로 배치 */
            transition: left 0.5s ease; /* 이동 애니메이션 */
            
        }

        .background-circle:hover {
            background-color: rgb(110, 108, 108); /* 반투명 흰색 */
        }

        .background-circle1:hover {
            background-color: rgb(110, 108, 108); /* 반투명 흰색 */
        }
        

/* 부모 컨테이너 설정 */
#moveimg {
    display: flex;
    gap: 20px;
    position: relative;
}

/* 이미지 컨테이너 */
.image-container {
    position: relative;
    width: fit-content;
        top: 40px;
    
    overflow: hidden; /* 오버레이가 이미지 영역 밖으로 나가지 않도록 */
}

/* 이미지 스타일 */
.image-container img {
    display: block;
    width: 100%;
    height: auto;
    transition: transform 0.3s ease; /* 부드러운 확대 효과 */
}

/* 오버레이 스타일 */
.image-container::after {
    content: "";
    position: absolute;
    top: 0%;
    left: 100%;
    width: 0;
    height: 0;
    background: rgba(0, 0, 0, 0.5);
    border-radius: 50%; /* 원형 오버레이 */
    transform: translate(-50%, -50%);
    transition: width 0.5s ease, height 0.5s ease;
    z-index: 2;

}

/* 오버레이 텍스트 */
.overlay-text {
    position: absolute;
    color: white;
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    opacity: 0; /* 초기 상태에서 숨김 */
    transition: opacity 0.3s ease;
    z-index: 3; /* 오버레이 위에 표시 */
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

/* 마우스 오버 효과 */
.image-container:hover::after {
    width: 300%; /* 충분히 큰 크기로 확장 */
    height: 300%;
}

.image-container:hover img {
    transform: scale(1.1); /* 이미지 살짝 확대 */
}

.image-container:hover .overlay-text {
    opacity: 1; /* 텍스트 표시 */
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


/*  20241209 1218 점 스타일*/

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
        background: radial-gradient(circle, #0B3E74, #1e2a50);
    border-radius: 50%;
    transform: translate(-50%, -50%);
    transition: width 1s ease-in-out, height 1s ease-in-out, background-color 0.5s;
    visibility: hidden; /* 기본적으로 보이지 않음 */
    z-index: 1000;
    overflow: hidden; /* 콘텐츠가 오버레이 크기 외부로 나가지 않도록 */
}

/* 오버레이 활성화 */
#overlay.active {
    width: 2000px; /* 화면을 충분히 채울 수 있을 만큼 큰 값 */
    height: 2000px;
    background: radial-gradient(circle, #0B3E74, #1e2a50);
    visibility: visible;
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
    background: radial-gradient(circle, #0B3E74, #1e2a50);
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
    
    


    /* 텍스트 애니메이션 */
    @keyframes slideDown {
        0% {
            transform: translateY(-100px); /* 위에서 시작 */
            opacity: 0;
        }
        100% {
            transform: translateY(0); /* 원래 위치로 */
            opacity: 1;
        }
    }

    /* 첫 번째 텍스트 애니메이션 */
    .text1 {
        animation: slideDown 1s ease-out forwards; /* 애니메이션 설정 */
        opacity: 0; /* 초기 숨김 상태 */
        animation-delay: 0.3s; /* 애니메이션 지연 시간 */
    }

    /* 두 번째 텍스트 애니메이션 */
    .text2 {
        animation: slideDown 1s ease-out forwards;
        opacity: 0;
        animation-delay: 0.6s;
    }
    
  
</style>
    
</head>
<body>

		
    <div class="container">
        <!-- 왼쪽 섹션 -->
        <div class="left">


         <div class="text1" style="color: black; font-size: 100px; right: 120px; bottom: 10px; position: relative;">
    Place
</div>

<div class="text2" style="color: black; position: relative; right: 80px;">
    고객과 고객의 고객까지 만족시키는 <br>
    부드러운 슬로프, 아늑한 객실을 약속합니다.
</div>

            <div class="text-container">
             
                
                <div style="color: black; right: 180px; top: 90px; position: relative; z-index: 2;" id="moreImages">More Images</div>
                <div class="background-circle2"></div>
                <img src="resources/images/arrow1.png" style="width: 30px; z-index: 2; 
                position: relative; transform: rotate(180deg); right: 44px; top: 75px;">
                <img src="resources/images/arrow1.png" style="width: 30px; top: 75px; z-index: 2; position: relative; right: 9px;">

                <div class="background-circle"></div>
                <div class="background-circle1"></div>``

                <p>Premium Adventure Shop</p>
              </div>
            <img src="resources/images/snow.png" class="snow-image"> 
            <button id="btn1" style="font-size: 21px;">찾아오는 길&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
            
            <div id="top1">
                <p style="font-size: 35px;">[Adv:nture]</p> 
                <p>MAKE YOUR </p>      
            </div>

            <div style="top: 140px; position: relative; font-size: 15px; left: 20px; display: flex; align-items: center;">
                <div class="scroll-line">
                    <div class="moving-circle"></div>
                </div>
                <div style="color: black;">&nbsp;&nbsp;&nbsp;SCROLL</div>
            </div>
            
			<div class="dot-container">
                <div class="dot"></div>
                <div class="dot active"></div>
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
            <div style="left: 87%; color: white; position: relative; top: 90px;"><b>MENU</b></div>
            
            	  <div id="overlay">
	    		<div class="overlay-content">
           	 <jsp:include page="header.jsp" />
			<button id="closeBtn" style="left: 500px; bottom:270px; position: relative; 
                             background-color: #0B3E74; 
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
            
            
            <div style="display: flex; align-items: center; margin-left: 450px; margin-bottom: 50px; position: relative;">
                <img src="resources/images/question.png" style="width: 20px; position: absolute; left: 190px; top: 40px; z-index: 2;">
                <button id="custom-kakao-channel-button"   style="background-color: black; color: white; border: none; 
                    width: 130px; height: 40px; border-radius: 8px; font-size: 15px; position: relative; left: 180px; top: 30px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의하기
                </button>
            </div>

            <div id="moveimg"> 
				<a href="liftList.li">			
	                <div class="image-container">
	                    <img src="resources/images/ski1.png" style="width: 430px; ">
	                    <div class="overlay-text">
	                        <p style="font-weight: bold; font-size: 40px;">LIFT-PASS</p>
	                        <br>
	                      
	
	                        <p style="font-size: 18px;">12가지 슬로프</p>
	                        <br>
	                        <br>
	                        리프트권 구매하기
	                    </div>
	                </div>
				</a>
                <div class="image-container" onclick="location.href='list.ro';" style="cursor: pointer; position: relative;">
                    <img src="resources/images/room.png" style="width: 430px;">
                    <div class="overlay-text">

                        <p style="font-weight: bold; font-size: 40px;">COMFORT
                        </p>
                        <br>
                      

                        <p style="font-size: 18px;">최고급 호텔식 객실 구비</p>
                        <br>
                        <br>
                        Detail View

                    </div>
                </div>
            </div>
        
            
            
        </div>
        

    <div class="circle" id="circle"></div>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script>
    document.addEventListener('DOMContentLoaded', function () {
        // 카카오 SDK 초기화
        Kakao.init('dc02060907b4ccb8c6417c5af8b8a228'); // 실제 JavaScript 키로 대체

        // 커스텀 버튼 클릭 이벤트
        const customButton = document.getElementById('custom-kakao-channel-button');
        customButton.addEventListener('click', function () {
          Kakao.Channel.addChannel({
            channelPublicId: '_PPxdxln' // 채널 고유 ID
          });
        });
      });
   
    const menuBtn = document.getElementById('menuBtn');
    const closeBtn = document.getElementById('closeBtn');

    document.querySelector("#menuBtn").addEventListener("click", () => {
        const overlay = document.getElementById('overlay');
        overlay.classList.toggle('active');
      });

    document.addEventListener("DOMContentLoaded", function () {
        const overlay = document.getElementById("overlay");
        const closeBtn = document.getElementById("closeBtn");

        // 닫기 버튼 클릭 시 오버레이 비활성화
        closeBtn.addEventListener("click", function () {
            overlay.classList.remove("active");
        });
    });

        // 스크롤 화면 전환
        let hasScrolled = false; // 스크롤 이벤트가 발생한 여부를 추적하는 변수

     // 스크롤 또는 터치 이벤트 발생 시
        function handleScroll(event) {
            if (event.deltaY > 0 && !hasScrolled) {
                // 아래로 스크롤 시 (마우스 휠을 내릴 때)
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
                    window.location.href = "<c:url value='/goToMain3'/>"; // 페이지 이동
                }, 500); // 0.8초 후 이동

                hasScrolled = true; // 스크롤이 발생했음을 추적
            } else if (event.deltaY < 0 && !hasScrolled) {
                // 위로 스크롤 시 (마우스 휠을 올릴 때)
                // goToMain2 페이지로 이동
                setTimeout(function() {
                	window.location.href = "index.jsp";
                }, 800); // 0.8초 후 이동

                hasScrolled = true; // 스크롤이 발생했음을 추적
            }
        }

        // main2.jsp 페이지에 나타날 때 천천히 보이도록 설정
        function showMain3() {
            let main2 = document.querySelector('.main3');
            if (main2) {
                main2.classList.add('visible');
            }
        }

        // 페이지 로드 시 main2.jsp가 천천히 나타나도록 설정
        window.addEventListener('load', showMain3);

        // wheel 이벤트 (마우스 휠)
        window.addEventListener('wheel', handleScroll);

        // touchmove 이벤트 (터치스크린에서 스크롤)
        window.addEventListener('touchmove', handleScroll);

    </script>
</body>
</html>
