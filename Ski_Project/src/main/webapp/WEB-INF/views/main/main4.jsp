<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Full Screen Background Video</title>
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Roboto', sans-serif; 
            font-weight: lighter;    
            overflow: hidden; /* 페이지 이동 시 스크롤 방지 */
             opacity: 0;
            animation: fadeIn 1s forwards; /* 화면이 부드럽게 나타나는 애니메이션 */
        }
          @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        .background-video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover; 
            z-index: -1; 
        }

        .content {
            position: relative;
            z-index: 1;
            text-align: center;
            font-size: 2rem;
        }


        .snow-image {
            position: absolute;
            top: 285px;
            left: 15px;
            width: 30px;
            transform: rotate(280deg);
            margin-right: 95%;
            z-index: 2; /* 이미지를 버튼보다 위로 오게 설정 */
        }

        #btn1-vertical {
    display: flex; /* 내부 텍스트를 세로로 정렬 */
    flex-direction: column; /* 글자를 세로로 배치 */
    justify-content: center; /* 수직 가운데 정렬 */
    align-items: center; /* 수평 가운데 정렬 */
    background-color: #0B3E74; /* 초기 배경 색상 */
    color: white; /* 텍스트 색상 */
    width: 60px; /* 버튼 폭 */
    height: 200px; /* 버튼 높이 */
    bottom:115px;
    position: relative;
    border: none; /* 테두리 제거 */
    cursor: pointer; /* 클릭 가능한 버튼 모양 */
    font-size: 21px; /* 텍스트 크기 */
    z-index: 1;
    line-height: 1.2; /* 글자 간 간격 줄이기 */
    animation: colorChange 3s infinite alternate; /* 색상 애니메이션 */
}

@keyframes colorChange {
    0% {
        background-color: #0B3E74; /* 초기 색상 */
    }
    50% {
        background-color: black; /* 중간 색상 */
    }
    100% {
        background-color: #0B3E74; /* 다시 초기 색상 */
    }
}

#top1 {
            position: absolute;
            top: 15px;
            color: black;
            left: 100px; /* 눈 이미지 오른쪽에 위치하게 조정 */
            

        }

        #top1 p {
            margin: 0;
        }

    /* SCROLL 옆 가로 선 */
    .scroll-line {
        width: 100px;
        height: 2px;
        top: 80px;
        background-color: black;
        position: relative;
        margin-left: 60px;
    }
    
    .moving-circle {
    width: 10px; /* 원 크기 수정 */
    height: 10px; /* 원 크기 수정 */
    background-color: black;
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
        position: absolute; /* 부모 요소 내에서 절대 위치 */
        top: 80%; /* 화면 하단에 배치 */
        z-index: 1000; /* 다른 요소보다 위로 오도록 설정 */
    }

    .dot {
        width: 10px;
        height: 10px;
        background-color: rgb(138, 135, 135);
        border-radius: 50%;
        margin: 0 5px;
    }

    .dot.active {
        background-color: #2d8ebf; /* 활성 상태의 색상 */
    }

    /* 초기 상태: 각 요소는 보이지 않게 설정 */
.class1, .class2, .class3 {
    opacity: 0; /* 초기 상태는 투명 */
    transform: translateY(30px); /* 아래로 살짝 밀어놓기 */
    animation: fadeInUp 1s ease-out forwards; /* 애니메이션 추가 */
}

/* 각 요소에 딜레이를 두어 순차적으로 나타나도록 설정 */
.class1 {
    animation-delay: 0.5s;
}

.class2 {
    animation-delay: 1s;
}

.class3 {
    animation-delay: 1.5s;
}

/* 애니메이션 정의: 아래에서 위로 올라오는 효과 */
@keyframes fadeInUp {
    0% {
        opacity: 0;
        transform: translateY(30px); /* 아래에서 시작 */
    }
    100% {
        opacity: 1;
        transform: translateY(0); /* 원래 위치로 */
    }
}

/* 추가적인 스타일: 텍스트 요소들에 대한 스타일 */
.movement-title {
    font-size: 20px;
}

.movement-description {
    font-size: 15px;
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
        @keyframes fadeInUp {
    0% {
        opacity: 0;
        transform: translateY(30px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}
        
    </style>
</head>
<body>
    <div class="container">

    <!-- 배경 비디오 -->
    <video class="background-video" autoplay muted loop>
        <source src="resources/images/back2.mp4" type="video/mp4">
        이 브라우저는 비디오를 지원하지 않습니다.
    </video>

    <!-- 화면에 나타낼 콘텐츠 -->
    <div class="content">


        <div style="display: flex; align-items: center; margin-left: 450px; margin-bottom: 50px; position: relative;">
                    <img src="resources/images/question.png" style="width: 20px; position: absolute; left: 74%; top: 53px; z-index: 4;">
                    <button id="qna"   style="background-color: #0B3E74; color: white; border: none; 
                        width: 130px; height: 40px; border-radius: 8px; font-size: 15px; position: relative;  top: 44px; left: 73%;  z-index: 3;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의하기
                    </button>
                </div>   
            <p style="font-size: 20px; color: rgb(55, 54, 54); bottom: 50px; position: relative;">
                <br><br><br>
                편안함과 모험이 공존하는 공간에서, 진정한 여유를 느끼세요. <br>
                탁월함을 디자인하는 우리의 가치,<br>
                우리는 겨울을 더 특별하게 만들어 드립니다.</p>
       	
       	
       		
	 			
                <div style="top: 280px; position: relative; font-size: 15px; left: 20px; display: flex; align-items: center; left: 230px;">
                <div class="scroll-line">
                    <div class="moving-circle"></div>
                </div>
                <div style="color: black; top: 78px; position: relative;">&nbsp;&nbsp;&nbsp;SCROLL</div>
                </div>
                

                <!--메뉴바, 문의하기-->
                <button id="menuBtn" style="
                width: 70px; 
                height: 70px; 
                background: url('resources/images/menu.png') no-repeat center center; 
                background-size: cover; 
                border: none; 
                margin-left: 86%; 
                bottom: 270px;
                cursor: pointer;
                z-index: 3;
                position: relative;
                transition: transform 0.2s ease, opacity 0.2s ease;">
                </button>
                <div style="margin-left: 87%; color: white; font-size: 16px; bottom: 275px; position: relative;  "><b>MENU</b></div>
                
                
                
                <img src="resources/images/snow.png" class="snow-image"> 
				
       
              
                <button id="btn1-vertical"><br>찾<br>아<br>오<br>는<br> 길</button>
	
                <div id="top1" style="z-index: 3; color: rgb(79, 78, 78);font-family: 'Roboto', sans-serif;
             font-weight: lighter; font-size: 33px;">
                 [Adv:nture] <br>
                 <p style="font-size: 20px; right: 20px; position: relative;">MAKE YOUR </p> 
                </div>

                <div   class="text2" style=" color: black; right: 390px; position: relative; bottom: 360px;">
                <img src="resources/images/main4-img1.png" width="90px"  >
                <p>서비스</p>
                <p style="font-size: 20px;">1st movement <br>
                    <p style="font-size: 15px;">
                        완벽한 설질과 현대적인 시설 <br>고객 맞춤형 서비스로 진정한 휴식을 제공합니다. 
                </p>
            </div>

            <div  class="text2" style="color: black; bottom: 670px; position: relative; ">
                <img src="resources/images/main4-img2.png" width="90px" >
                <p>소통</p>
                <p style="font-size: 20px;">2st movement <br>
                    <p style="font-size: 15px;">
                         소통을 통해 더 나은 서비스를 <br>만들어가며 함께 공감하는 공간을 제공합니다.
                </p>
            </div>
            <div  class="text2" style="color: black;  left: 400px; position: relative; bottom: 975px;">
                <img src="resources/images/main4-img3.png" width="90px" >
                <p>오직</p>
                <p style="font-size: 20px;">3st movement <br>
                    <p style="font-size: 15px;">
                        차별화된 시설과 독창적인 <br>프로그램으로 당신의 겨울을 한층 더 빛나게 합니다. 
                </p>
            </div>
    <script>
   
    
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
                   window.location.href = "<c:url value='/goToMain5'/>"; // 페이지 이동
               }, 800); // 0.8초 후 이동

               hasScrolled = true; // 스크롤이 발생했음을 추적
           } else if (event.deltaY < 0 && !hasScrolled) {
               // 위로 스크롤 시 (마우스 휠을 올릴 때)
               // goToMain2 페이지로 이동
               setTimeout(function() {
               	window.location.href = "<c:url value='/goToMain3'/>";
               }, 800); // 0.8초 후 이동

               hasScrolled = true; // 스크롤이 발생했음을 추적
           }
       }
//main2.jsp 페이지에 나타날 때 천천히 보이도록 설정
function showMain5() {
 let main4 = document.querySelector('.main5');
 if (main4) {
     main4.classList.add('visible');
 }
}

//페이지 로드 시 main2.jsp가 천천히 나타나도록 설정
window.addEventListener('load', showMain5);

//wheel 이벤트 (마우스 휠)
window.addEventListener('wheel', handleScroll);

//touchmove 이벤트 (터치스크린에서 스크롤)
window.addEventListener('touchmove', handleScroll);

    </script>

</body>
</html>
