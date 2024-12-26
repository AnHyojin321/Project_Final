<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>

    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
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




  

       
        #btn1 {
    right: 80px;
    background-color: #0B3E74; /* 초기 색상 */
    color: white;
    transform: rotate(270deg);
    width: 200px;
    height: 68px;
    margin-top: 330px;
    position: relative;
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
            color: white;
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
  font-weight: lighter; /*
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
  font-size:0.6rem;
    font-weight: 100;
}


    /* SCROLL 옆 가로 선 */
    .scroll-line {
        width: 100px;
        height: 2px;
        top: 150px;
        background-color: white;
        position: relative;
        margin-left: 10px;
    }

    .moving-circle {
    width: 10px; /* 원 크기 수정 */
    height: 10px; /* 원 크기 수정 */
    background-color: white;
    border-radius: 50%;
    bottom: 200px;

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
    width: 50px; /* 원의 크기 */
    height: 50px;
    background-color: rgb(213, 209, 209); /* 반투명 흰색 */
    border-radius: 50%; /* 원 모양 */
    top: 60%; /* 중앙에 배치 */
    left: 80%   ; /* 중앙에 배치 */
    transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
    z-index: 0; /* 텍스트 뒤로 배치 */
    transition: background-color 0.3s ease; /* 부드러운 색 변화 */

}





/* 투명한 스크롤바 디자인 */
.scrollable-div::-webkit-scrollbar {
    width: 8px; /* 스크롤바 너비 */
    background: transparent; /* 스크롤바 배경 투명 */
}

.scrollable-div::-webkit-scrollbar-thumb {
    background: rgba(255, 255, 255, 0.4); /* 스크롤바 손잡이 투명 */
    border-radius: 4px; /* 둥근 모서리 */
}

.scrollable-div::-webkit-scrollbar-thumb:hover {
    background: rgba(255, 255, 255, 0.6); /* 호버 시 조금 더 진한 색상 */
}

.scrollable-div::-webkit-scrollbar-track {
    background: transparent; /* 스크롤 트랙 투명 */
}

.scrollable-div {
    width: 70%; /* 원하는 너비 설정 */
    height: 50%; /* 원하는 높이 설정 */
    overflow-y: scroll; /* 세로 스크롤 활성화 */
    overflow-x: hidden; /* 가로 스크롤 비활성화 */
    background-color: black; /* 배경색 */
    padding: 10px;
    color: white;
    position: relative;
    top: 200px;
    right: 270px;
    z-index: 2;
        opacity: 0.2; /* 투명도 설정 (0.0 ~ 1.0) */
    
}

.person-info {
    display: flex; /* 가로 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
    margin-bottom: 10px; /* 항목 간 간격 */
}

.person-info .name {
    font-size: 26px;
    font-weight: bold;
    margin-right: 70px; /* 이름과 소개 사이 간격 */

    
}

.person-info .description {
    font-size: 1rem;
    font-weight: lighter;
    color: rgb(192, 190, 190); /* 부가 설명 색상 */
    line-height: 2; /* 줄 간격 배율 (1.5나 2와 같이 비율로 설정 가능) */
}


.slide {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: black;
    transform: translateX(100%) scaleX(0); /* 페이지가 오른쪽으로 벗어나고, 가로 크기를 0으로 설정 */
    opacity: 0; /* 처음에는 보이지 않도록 설정 */
    transition: transform 0.7s ease-in-out, opacity 1.0s ease-in-out; /* 부드러운 전환 효과 */
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
      top: 400px;
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
    width: 2000px; /* 화면을 충분히 채울 수 있을 만큼 큰 값 */
    height: 2000px;
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
    
   
        .scrollable-div {
            width: 70%;
            height: 50%;
            overflow-y: scroll;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 10px;
            color: white;
            position: absolute;
            top: 200px;
            left: 15%;
            border-radius: 10px;
            opacity: 0;
            transform: scale(0.9);
            transition: opacity 0.5s, transform 0.5s;
        }

        .btn-toggle {
            position: absolute;
            top: 450px;
            left: 6%;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #0B3E74;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-toggle:hover {
            background-color: #0056b3;
        }

        .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 30px;
            height: 30px;
            background-color: rgba(0, 0, 0, 0.8);
            border: none;
            border-radius: 50%;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
        }

       
</style>
</head>
<body style="
    font-family: 'Roboto', sans-serif;
    background: url('resources/images/main5.jpg') no-repeat center center fixed;
    background-size: cover;
    margin: 0;
    height: 100vh;
    overflow: hidden;
    z-index: 1;
    opacity: 0;
    animation: fadeIn 1s forwards;">
    <div class="container ">
                    
            <div id="circle" class="circle"></div>

            <div class="text-container">
              </div>
            <img src="resources/images/snow.png" class="snow-image" style=" right: 15px;"> 
            <button id="btn1" style="font-size: 21px;">찾아오는 길&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
            
            <div id="top1" style="z-index: 3; color: white;">
                <p style="font-size: 35px; ">[Adv:nture]</p> 
                <p>MAKE YOUR </p>      
            </div>

            <div style="top: 140px; position: relative; font-size: 15px; left: 20px; display: flex; align-items: center;">
                <div class="scroll-line">
                    <div class="moving-circle"></div>
                </div>
                <div style="color: white; top: 150px; position: relative;">&nbsp;&nbsp;&nbsp;SCROLL</div>

            </div>

            <!-- 메뉴 버튼 -->  
            
            <button id="menuBtn" style="
                width: 70px; 
                height: 70px; 
                background: url('resources/images/menu.png') no-repeat center center; 
                background-size: cover; 
                border: none; 
                left: 92.5%;
                top: 20px;
                cursor: pointer;
                position: absolute;
                z-index: 2;
                transition: transform 0.2s ease, opacity 0.2s ease;">
            </button>
            <div style="left: 68.7%; color: white;position: relative; top: 90px;"><b>MENU</b></div>
			
	  <div id="overlay">
	    		<div class="overlay-content">
           	 <jsp:include page="header.jsp" />
			<button id="closeBtn" style="right: 400px; bottom:270px; position: relative; 
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
			
            <div style="color: white; top: 250px; position: absolute; left: 90px; width: 100%;">
                <p style="font-size: 70px;">Review</p>
                <br><br>
                지난 6개월간의 시간들을 되돌아보며,
            </div>
                                    <button class="btn-toggle">리뷰 보기</button>
            
            <div style="display: flex; align-items: center; margin-left: 450px; margin-bottom: 50px; position: relative;">
                <img src="resources/images/question.png" style="width: 20px; position: absolute; left: 390px; bottom: 575px; z-index: 4;">
                <button id="custom-kakao-channel-button"   style="background-color: #0B3E74; color: white; border: none; 
                    width: 130px; height: 40px; border-radius: 8px; font-size: 15px; position: relative; left: 380px; bottom: 260px; z-index: 3;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의하기
                </button>
            </div>   

            

            

            <div class="scrollable-div" >
                    <button class="close-btn">X</button>
            
                <div class="person-info">
                    <p class="name">안효진</p>
                    <p class="description" style="top: 30px; position: relative;">"팀원들과 한달이 넘는 시간동안 같이 동고동락하며 <br>
                                            프로젝트를 마무리 할 수 있어서 감사합니다!<br>
                                            다 못할 거라고 생각했었는데 모두가 밤을 새워가며 <br>
                                            힘써준 덕분에 좋은 결과를 얻을 수 있었습니다.
                                            "</p>
                </div>
                <br>
                <div class="person-info">
                    <p class="name">김동준</p>
                    <p class="description" style="top: 30px; position: relative;">"팀원들과 한달이 넘는 시간동안 같이 동고동락하며 <br>
                        프로젝트를 마무리 할 수 있어서 감사합니다!<br>
                        다 못할 거라고 생각했었는데 모두가 밤을 새워가며 <br>
                        힘써준 덕분에 좋은 결과를 얻을 수 있었습니다.
                        "</p>
                </div>
                <br>
                <div class="person-info">
                    <p class="name">이유민</p>
                    <p class="description" style="top: 30px; position: relative;">"팀원들과 한달이 넘는 시간동안 같이 동고동락하며 <br>
                        프로젝트를 마무리 할 수 있어서 감사합니다!<br>
                        다 못할 거라고 생각했었는데 모두가 밤을 새워가며 <br>
                        힘써준 덕분에 좋은 결과를 얻을 수 있었습니다.
                        "</p>
                </div>
                <br>
                <div class="person-info">
                    <p class="name">김준석</p>
                    <p class="description" style="top: 30px; position: relative;">"팀원들과 한달이 넘는 시간동안 같이 동고동락하며 <br>
                        프로젝트를 마무리 할 수 있어서 감사합니다!<br>
                        다 못할 거라고 생각했었는데 모두가 밤을 새워가며 <br>
                        힘써준 덕분에 좋은 결과를 얻을 수 있었습니다.
                        "</p>
                </div>
               
                
            </div>
            

        
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
    
    
 // GSAP 애니메이션
    document.querySelector('.btn-toggle').addEventListener('click', function () {
        const scrollableDiv = document.querySelector('.scrollable-div');
        if (!scrollableDiv.classList.contains('visible')) {
            gsap.to(scrollableDiv, {
                opacity: 1,
                scale: 1,
                duration: 0.5, // 애니메이션 지속 시간
                ease: "power2.out", // 부드러운 애니메이션 효과
            });
            scrollableDiv.classList.add('visible');
        }
    });

    // 닫기 버튼 기능 추가
    document.querySelector('.scrollable-div .close-btn').addEventListener('click', function () {
        const scrollableDiv = document.querySelector('.scrollable-div');
        gsap.to(scrollableDiv, {
            opacity: 0,
            scale: 0.9,
            duration: 0.5, // 애니메이션 지속 시간
            ease: "power2.in", // 부드러운 애니메이션 효과
            onComplete: () => {
                scrollableDiv.classList.remove('visible');
            },
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
                   window.location.href = "<c:url value='/goToMain4'/>"; // 페이지 이동
               }, 800); // 0.8초 후 이동

               hasScrolled = true; // 스크롤이 발생했음을 추적
           } else if (event.deltaY < 0 && !hasScrolled) {
               // 위로 스크롤 시 (마우스 휠을 올릴 때)
               // goToMain2 페이지로 이동
               setTimeout(function() {
               	window.location.href = "<c:url value='/goToMain4'/>";
               }, 800); // 0.8초 후 이동

               hasScrolled = true; // 스크롤이 발생했음을 추적
           }
       }
    //main2.jsp 페이지에 나타날 때 천천히 보이도록 설정
    function showMain5() {
     let main5 = document.querySelector('.main6');
     if (main5) {
         main5.classList.add('visible');
     }
    }

    //페이지 로드 시 main2.jsp가 천천히 나타나도록 설정
    window.addEventListener('load', showMain5);

    //wheel 이벤트 (마우스 휠)
    window.addEventListener('wheel', handleScroll);

    //touchmove 이벤트 (터치스크린에서 스크롤)
    window.addEventListener('touchmove', handleScroll);
	
    
    document.getElementById('overlay').classList.add('expand'); // 오버레이가 화면을 꽉 채우도록 확장
	
    
    
    document.querySelector('.btn-toggle').addEventListener('click', function () {
        const scrollableDiv = document.querySelector('.scrollable-div');
        scrollableDiv.classList.toggle('visible');
    });
    </script>
</body>
</html>

