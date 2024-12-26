<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문 열림 효과</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: white;
            overflow: hidden;
            font-family: Arial, sans-serif;
        }

        .line-container {
            position: relative;
            width: 100%;
            height: 100%;
        }

        /* 양쪽 선 */
        .line {
            position: absolute;
            width: 2px;
            height: 100%;
            background-color: white;
            z-index: 2;
        }

        .left-line {
            left: 80px; /* 왼쪽 선 위치 */
            transform-origin: top; /* 위쪽 기준으로 애니메이션 */
        }

        .right-line {
            right: 80px; /* 오른쪽 선 위치 */
            transform-origin: bottom; /* 아래쪽 기준으로 애니메이션 */
        }

        /* 중앙 선 */
        .center-line {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 2px;
            height: 100%;
            background-color: white;
            transform-origin: center; /* 중심 기준으로 줄어듦 */
            z-index: 2;
        }

        /* 중앙 문 */
        .center-door {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100%;
            height: 100%;
            display: flex;
            z-index: 1; /* 선보다 뒤로 배치 */
        }

        .door-left {
            width: 50%;
            height: 100%;
            background-color: #004AAD;
            transform-origin: right center; /* 문이 오른쪽을 기준으로 열림 */
        }

        .door-right {
            width: 50%;
            height: 100%;
            background-color: #004AAD;
            transform-origin: left center; /* 문이 왼쪽을 기준으로 열림 */
        }

        /* 중앙 텍스트 */
        .center-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(1);
            font-size: 48px; /* 텍스트 크기 증가 */
            font-weight: bold;
            color: black;
            z-index: 3; /* 문보다 위로 배치 */
            text-align: center;
        }

        /* 화면 내용 */
        .content {
            opacity: 0;
            transform: scale(0.8);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: #2d2d2d;
            font-size: 24px;
            z-index: 4; /* 문보다 위로 배치 */
        }

          /* 눈보라 효과 */
          .snowflake {
            position: absolute;
            width: 5px;
            height: 5px;
            background-color: black;
            border-radius: 50%;
            opacity: 0.8;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <div class="line-container">
        <!-- 양쪽 선 -->
        <div class="line left-line"></div>
        <div class="line right-line"></div>

        <!-- 중앙 선 -->
        <div class="center-line"></div>

        <!-- 중앙 문 -->
        <div class="center-door">
            <div class="door-left"></div>
            <div class="door-right"></div>
        </div>

        <!-- 중앙 텍스트 -->
        <div class="center-text">SEOLLEENUN</div>
    </div>

    <!-- 화면에 나타날 내용 -->
    <div class="content">
        <h1>Welcome to Seolleenun</h1>
        <p>Enjoy your premium adventure!</p>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <script>
        // GSAP 애니메이션
        gsap.timeline()
            // 왼쪽 선 위로 사라짐
            .to(".left-line", {
                scaleY: 0, // 위쪽으로 줄어듦
                duration: 2,
                ease: "power2.out"
            }, 0)

            // 오른쪽 선 아래로 사라짐
            .to(".right-line", {
                scaleY: 0, // 아래쪽으로 줄어듦
                duration: 2,
                ease: "power2.out"
            }, 0)

            // 중앙 선 위아래로 동시에 사라짐
            .to(".center-line", {
                scaleY: 0, // 위와 아래로 동시에 줄어듦
                duration: 1.2,
                ease: "power2.inOut"
            }, "-=1.5") // 양쪽 선 애니메이션과 겹침

            // 중앙 텍스트 확대 및 사라짐 (더 크고 빠르게)
            .to(".center-text", {
                scale: 8, // 텍스트가 훨씬 더 크게 확대됨
                opacity: 0, // 투명해짐
                duration: 1, // 더 빠르게 사라짐
                ease: "power2.out"
            }, "-=1") // 중앙 선 애니메이션과 겹침

            // 중앙 문 열림 (양쪽으로 이동)
            .to(".door-left", {
                x: "-100%", // 왼쪽으로 이동
                duration: 2,
                ease: "power2.inOut",
                onStart: () => createSnowflakes(100) // 눈보라 생성

            }, "-=1") // 중앙 텍스트 애니메이션과 겹침

            .to(".door-right", {
                x: "100%", // 오른쪽으로 이동
                duration: 2,
                ease: "power2.inOut"
            }, "-=2") // 동시에 실행

            // 화면 내용 표시
            .to(".content", {
                opacity: 1,
                transform: "scale(1)",
                duration: 1.5,
                ease: "power2.out"
            }, "-=1"); // 문 열림과 겹침



              // 눈보라 생성 함수
        function createSnowflakes(count) {
            for (let i = 0; i < count; i++) {
                const snowflake = document.createElement("div");
                snowflake.classList.add("snowflake");

                // 랜덤 위치 지정
                snowflake.style.top = "50%";
                snowflake.style.left = "50%";

                // 부모 요소에 추가
                document.body.appendChild(snowflake);

                // GSAP 애니메이션으로 흩뿌리기
                gsap.to(snowflake, {
                    x: Math.random() * 1000 - 600, // 랜덤으로 좌우로 흩어짐
                    y: Math.random() * 1000 - 600, // 랜덤으로 위아래로 흩어짐
                    scale: Math.random() * 2.5 + 1.5, // 크기 랜덤
                    opacity: 0, // 사라짐
                    duration: 3,
                    ease: "power2.out",
                    onComplete: () => snowflake.remove() // 애니메이션 끝나면 제거
                });
            }
        }

    </script>
</body>
</html>
