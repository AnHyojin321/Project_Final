<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설레눈</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            overflow: hidden; /* 스크롤 방지 */
        }

        .container {
            display: flex;
            height: 100vh;
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

        /* 원 스타일 */
        .circle {
            width: 20px;
            height: 20px;
            background-color: black;
            opacity: 0.5; /* 기본 투명도 */
            border-radius: 50%;
            position: absolute;
            pointer-events: none; /* 마우스 이벤트 방지 */
            transform: translate(-50%, -50%);
            transition: transform 0.1s ease, width 0.3s ease, height 0.3s ease, opacity 0.3s ease; /* 부드러운 애니메이션 */
            z-index: 1; /* 기본적으로 버튼 아래에 위치 */
        }

        .circle.enlarge {
            width: 75px; /* hover 시 커지는 크기 */
            height: 75px;
            opacity: 0.6; /* hover 시 투명도 증가 */
            z-index: 3; /* 버튼 위로 이동 */
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
            top: 325px;
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
            <button id="btn1" style="font-size: 21px;"><a href="search.map" style="color:white; text-decoration:none">찾아오는 길</a></button>
            
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

        </div>
        <div class="right">
            <!-- 메뉴 버튼 -->
            <button id="menuBtn" style="
                width: 70px; 
                height: 70px; 
                background: url('resources/images/menu.png') no-repeat center center; 
                background-size: cover; 
                border: none; 
                margin-left: 720px; 
                margin-top: 20px;
                cursor: pointer;
                transition: transform 0.2s ease, opacity 0.2s ease;">
            </button>
            <div style="margin-left: 735px; color: white;">MENU</div>
            
            <div style="display: flex; align-items: center; margin-left: 540px; margin-bottom: 50px; position: relative;">
                <img src="resources/images/question.png" style="width: 20px; position: absolute; left: 45px; bottom: 80px; z-index: 2;">
                <button id="qna"   style="background-color: #004AAD; color: white; border: none; 
                    width: 130px; height: 40px; border-radius: 8px; font-size: 15px; position: relative; left: 30px; bottom: 70px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의하기
                </button>
            </div>

        </div>
        

    <div class="circle" id="circle"></div>

    <script>
        const circle = document.getElementById('circle');
        const button1 = document.getElementById('btn1');
        const menuBtn = document.getElementById('menuBtn'); // 메뉴 버튼 추가
        const qna = document.getElementById('qna'); // 메뉴 버튼 추가

        let mouseX = 0;
        let mouseY = 0;
        let circleX = 0;
        let circleY = 0;
    
        // 마우스 움직임 이벤트
        document.addEventListener('mousemove', (e) => {
            mouseX = e.clientX;
            mouseY = e.clientY;
        });
    
        // 원이 천천히 따라오도록 애니메이션
        function animateCircle() { 
            circleX += (mouseX - circleX) * 0.1; // 부드러운 이동
            circleY += (mouseY - circleY) * 0.1;
    
            circle.style.left = `${circleX}px`;
            circle.style.top = `${circleY}px`;
    
            requestAnimationFrame(animateCircle);
        }
    
        animateCircle();
    
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

    </script>
</body>
</html>
