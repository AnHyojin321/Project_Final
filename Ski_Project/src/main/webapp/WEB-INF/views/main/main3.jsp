<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">

    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            
        }

          body {
            font-family: 'Roboto', sans-serif;
            overflow: hidden;
            /* 페이지 로드 시 부드럽게 나타나도록 설정 */
            opacity: 0;
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
            background-color: black; /* 파란색 배경 */
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
        }


    #main1 {
    position: absolute;
    top: 0px;
    left: 75px;
    width: 330px;
    height: 600px;
    background-color: black;
    border: 1px solid rgb(77, 75, 75);
    font-family: Arial, sans-serif;
 
}

#main2 {
    position: absolute;
    top: 0px;
    left: 405px; /* #main1 옆에 위치 */
    width: 320px;
    height: 400px;
    background-color: white;
    border: 1px solid rgb(77, 75, 75);
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
            background-color: black;
        }

        #btn1 {
    margin-right: 88%;
    background-color: #0B3E74; /* 초기 색상 */
    color: white;
    transform: rotate(270deg);
    width: 200px;
    height: 68px;
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
            left: 23px;
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

.background-circle1 {
    position: absolute;
    width: 60px; /* 원의 크기 */
    height: 60px;
    background-color: rgb(213, 209, 209); /* 반투명 흰색 */
    border-radius: 50%; /* 원 모양 */
    top: 70%; /* 중앙에 배치 */
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
            top: 70%; /* 중앙에 배치 */
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
    top: 0; /* 위쪽에서 시작 */
    left: 0; /* 왼쪽에서 시작 */
    right: 0; /* 오른쪽도 포함 */
    bottom: 0; /* 아래쪽도 포함 */
    width: 0; /* 초기 가로 크기 0 */
    height: 0; /* 초기 세로 크기 0 */
    margin: auto; /* 중앙에서 확장 */
    background: rgba(0, 0, 0, 0.5); /* 반투명 검정 오버레이 */
    transition: width 0.5s ease, height 0.5s ease;
    z-index: 2; /* 이미지 위에 표시 */
}

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

.image-container:hover::after {
    width: 100%; /* 전체 가로 확장 */
    height: 100%; /* 전체 세로 확장 */
    top: 0; /* 초기 위치로 유지 */
    left: 0; /* 초기 위치로 유지 */
    right: 0; /* 초기 위치로 유지 */
    bottom: 0; /* 초기 위치로 유지 */
}

.image-container:hover img {
    transform: scale(1.1); /* 이미지 살짝 확대 */
}

.image-container:hover .overlay-text {
    opacity: 1; /* 텍스트 표시 */
}



 .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 1.5em;
            opacity: 1;
            transition: opacity 0.5s ease;
        }

        .image-container:hover .overlay {
            opacity: 0;
        }


        ---

        .mainimg-container {
            position: relative;
            width: 300px;
            height: 200px;
            margin: 10px;
            overflow: hidden;
        }

        .mainimg-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .overlay1 {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 280px;
            background-color: rgba(29, 28, 28, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 1.5em;
            opacity: 1;
            transition: opacity 0.5s ease;
        }

        .overlay2 {
            position: relative;
            top: 170px;
            left: 0;
            width: 100%;
            height: 380px;
            background-color: rgba(29, 28, 28, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 1.5em;
            opacity: 1;
            transition: opacity 0.5s ease;
        }

        .overlay3 {
            position: absolute;
            top: 0px;
            left: 0;
            width: 100%;
            height: 290px;
            background-color: rgba(29, 28, 28, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 1.5em;
            opacity: 1;
            transition: opacity 0.5s ease;
        }

        
        .overlay3:hover{
            opacity: 0;
        }

    

     .overlay2:hover{
            opacity: 0;
        }

 .overlay1:hover{
            opacity: 0;
        }

  .main1back:hover{
    background-color: black;
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
    transition: transform 0.5s ease-in-out, opacity 1.0s ease-in-out; /* 부드러운 전환 효과 */
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
      top: 300px;
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
    overflow: hidden;
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
      top: 3px;
      right: 3px;
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
    
    
    .hidden {
    display: none;
}

/* 3D Viewer 애니메이션 효과 */
#sketchfabViewer {
    position: relative;
    margin: 20px auto;
    width: 80%; /* 원하는 크기로 조정 */
    height: 500px; /* 원하는 크기로 조정 */
    background-color:white;
    opacity: 0;
    left:400px;
    z-index:3;
    transform: scale(0.9);
    transition: opacity 0.5s ease, transform 0.5s ease;
}

#sketchfabViewer.visible {
    display: block;
    opacity: 1;
    transform: scale(1);
}


    .sketchfab-embed-wrapper {
      position: relative;
      width: 100%;
      max-width: 800px;
      margin: 20px auto;
      border: 5px solid none;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .sketchfab-embed-wrapper iframe {
      width: 100%;
      height: 400px;
      pointer-events: none; /* 마우스 및 터치 이벤트 차단 */
    }
</style>
</head>
<body>
    <div class="container">
    
        <div class="left">


      
            
            <div id="main1">
             <p class="text1"  style="color: white; font-size: 80px; top: 60px; position: relative; font-family: 'Roboto';">
                <b>SKI  RESORT ADVENTURE</b>
             </p>

             <div class="main1back"  style="background-color: white; width: 330px; z-index: 3; height: 150px; top: 158px; position: relative;" >
                <p style="color: black; font-size: 23px; position: relative; top: 56px; left: 40px; font-family: 'Roboto', sans-serif;"> <b>PACKAGE</b> <br>PRODUCT</p>
                    
                <div class="background-circle" onclick="location.href='list.pk'" style="cursor:pointer"></div>
                <img src="resources/images/arrow1.png" style="width: 20px; top: 25px; z-index: 2; position: relative; left: 255px;">
             </div>
            </div>
        <div class="text2" id="main2">
    <img id="main2-img" src="resources/images/skimon.jpg" width="310px" height="300px" style="position: absolute;">
    <div class="overlay3"></div>

    <div id="main2-half" style="background-color: rgb(55, 54, 54); width: 310px; height: 155px; top: 290px; position: relative;">
        <p style="color: white; font-size: 23px; position: relative; top: 50px; left: 40px; font-family: 'Roboto', sans-serif;">
            <b>Slope</b> <br> 미리보기
        </p>
        <div class="background-circle"></div>
        <img src="resources/images/arrow1.png" style="width: 20px; top: 25px; z-index: 2; position: relative; left: 240px;">
    </div>
</div>
        <div class="sketchfab-embed-wrapper hidden" id="sketchfabViewer">
    <iframe
        title="Suomu 3D Ski Map"
        frameborder="0"
        allowfullscreen
        mozallowfullscreen="true"
        webkitallowfullscreen="true"
        allow="autoplay; fullscreen; xr-spatial-tracking"
        src="https://sketchfab.com/models/eda3654190284752acac047f881b5acb/embed?autostart=1&annotations_visible=0&annotation_cycle=4&transparent=1&ui_hint=0">
    </iframe>
    	<div style="color: black;">
    	초급 코스 / 중급 코스 / 상급 코스
    	</div>
</div>
            <div class="text-container">
                
              </div>
            <img src="resources/images/snow.png" class="snow-image"> 
            <button id="btn1" style="font-size: 21px;">찾아오는 길&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>

            <div id="top1" style="z-index: 3; color: white;">
                <p style="font-size: 35px; ">[Adv:nture]</p> 
                <p>MAKE YOUR </p>      
            </div>

	 <div class="dot-container">
                <div class="dot "></div>
                <div class="dot"></div>
                <div class="dot active"></div>
                <div class="dot"></div>
                <div class="dot"></div>
              </div>


            <div style="top: 90px; position: relative; font-size: 15px; left: 20px; display: flex; align-items: center;">
                <div class="scroll-line">
                    <div class="moving-circle"></div>
                </div>
                <div style="color: white; top: 150px; position: relative;">&nbsp;&nbsp;&nbsp;SCROLL</div>



			
			

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
                margin-left: 780px; 
                margin-top: 20px;
                cursor: pointer;
                z-index: 3;
                position: relative;
                transition: transform 0.2s ease, opacity 0.2s ease;">
            </button>
            <div style="margin-left: 800px; color: white;"><b>MENU</b></div>
            
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
            
            
            
            <div style="display: flex; align-items: center; margin-left: 450px; margin-bottom: 50px; position: relative;">
                <img src="resources/images/question.png" style="width: 20px; position: absolute; left: 190px; bottom: 80px; z-index: 4;">
                <button id="qna"   style="background-color: #0B3E74; color: white; border: none; 
                    width: 130px; height: 40px; border-radius: 8px; font-size: 15px; position: relative; left: 180px; bottom: 70px; z-index: 3;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의하기
                </button>
            </div>   

            
            <div class="text2" style="width: 350px; height: 600px; background-color: black; position: relative; bottom: 210px; border: 1px solid  rgb(77, 75, 75); left: 100px;">
                <p style="color: rgb(169, 169, 169); word-spacing: 4px; font-size: 15px; position: relative; top: 100px; left: 65px; font-family: 'Roboto', sans-serif;"> 
                   <b> The essential part of creativity is <br>
                    not being afraid to fail. <br><br>
                    
                    We not only create Activity, we <br>
                    create pride the most Activity <br>
                    and advanced group.</b>
                    <img id="main3-img"  src="resources/images/skisky.jpg" width="348px" height="360px" style="position: absolute; right: 65px; top: 200px;">
                    <div class="overlay2"></div>
                </p>

               

            </div>
            <div  class="text2" style="width: 350px; height: 700px; background-color: black; position: relative; bottom: 810px; left: 450px; border: 1px solid  rgb(77, 75, 75);" >
                <p style="color: white; font-size: 50px; position: relative; top: 470px; left: 190px; font-family: 'Roboto', sans-serif;"> 
                    <img id="main4-img"   src="resources/images/contact.jpg" width="348px" height="280px" style="position: absolute; right: 190px; bottom: 370px;" >
                    
                    <b>BACK<br>
                    &nbsp;TO<br>
                    &nbsp;TOP</p></b> 
                    <div class="overlay1"></div>

                    <dotlottie-player src="https://lottie.host/cb2be985-0804-4d11-b8e7-5b305167b13e/ekPO1c0lRS.lottie" background="transparent" speed="1" 
                    style="width: 100px; height: 100px; top: 350px; left: 40px; position: relative;" loop autoplay></dotlottie-player>
            </div>
            
        </div>
        <script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script>

    <div class="circle" id="circle"></div>

    <script>
    
 // main2 클릭 시 Sketchfab Viewer 표시
   // main2 클릭 시 Sketchfab Viewer 표시
document.getElementById('main2').addEventListener('click', function () {
    const sketchfabViewer = document.getElementById('sketchfabViewer');
    sketchfabViewer.classList.add('visible'); // Viewer 보이기
});

// sketchfabViewer 클릭 시 Sketchfab Viewer 숨기기
document.getElementById('sketchfabViewer').addEventListener('click', function () {
    const sketchfabViewer = document.getElementById('sketchfabViewer');
    sketchfabViewer.classList.remove('visible'); // Viewer 숨기기
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
       
        /*여기서부터 
        
      
        // #btn1 버튼 hover 시 원 커지기 및 투명하게 표시
        button1.addEventListener('mouseenter', () => {
            circle.classList.add('enlarge');
        });
    
        button1.addEventListener('mouseleave', () => {
            circle.classList.remove('enlarge');
        });
        

        qna.addEventListener('mouseenter', () => {
            circle.classList.add('enlarge');
        });
    
        qna.addEventListener('mouseleave', () => {
            circle.classList.remove('enlarge');
        }); 

        
        // #menuBtn 버튼 hover 시 원 커지기 및 투명하게 표시 (추가된 부분)
        menuBtn.addEventListener('mouseenter', () => {
            circle.classList.add('enlarge');
        });
    
        menuBtn.addEventListener('mouseleave', () => {
            circle.classList.remove('enlarge');
        });
    
        const moreImages = document.getElementById("moreImages");
        const backgroundCircle2 = document.querySelector(".background-circle2");

        moreImages.addEventListener("mouseenter", () => {
            backgroundCircle2.style.left = "10%"; // 마우스를 올리면 왼쪽으로 이동
        });

        moreImages.addEventListener("mouseleave", () => {
            backgroundCircle2.style.left = "30%"; // 마우스를 떼면 원래 위치로 돌아옴
        });
        여기까지 제거하면 화면 잘넘어감 
        */
        
      //스크롤 화면전환
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
                	window.location.href = "<c:url value='/goToMain2'/>";
                }, 300); // 0.8초 후 이동

                hasScrolled = true; // 스크롤이 발생했음을 추적
            }
        }

// main5.jsp 페이지에 나타날 때 천천히 보이도록 설정
function showMain4() {
    let main4 = document.querySelector('.main4');
    if (main4) {
        main4.classList.add('visible');
    }

    // 페이지가 로드될 때마다 hasScrolled 초기화
    hasScrolled = false;
}

// 페이지 로드 시 main5.jsp가 천천히 나타나도록 설정
window.addEventListener('load', showMain4);

// wheel 이벤트 (마우스 휠)
window.addEventListener('wheel', handleScroll);

// touchmove 이벤트 (터치스크린에서 스크롤)
window.addEventListener('touchmove', handleScroll);



</script>
</body>
</html>